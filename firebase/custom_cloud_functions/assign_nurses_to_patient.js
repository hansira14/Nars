const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
exports.assignNursesToPatient = functions.firestore
  .document("patient/{patientId}")
  .onCreate(async (snap, context) => {
    const patientData = snap.data();
    const department = patientData.department;
    const careLevel = patientData.carelevel;

    // Get all nurses in the same department
    const nursesQuery = admin
      .firestore()
      .collection("users")
      .where("department", "==", department)
      .where("role", "==", "Nurse");

    const nursesSnapshot = await nursesQuery.get();

    if (nursesSnapshot.empty) {
      console.log("No nurses found for the department:", department);
      return;
    }

    // Group nurses by shift
    const nursesByShift = {};
    nursesSnapshot.forEach((doc) => {
      const nurseData = doc.data();
      const shift = nurseData.shift;
      if (!nursesByShift[shift]) nursesByShift[shift] = [];
      nursesByShift[shift].push({ id: doc.id, totalCareLevel: 0 });
    });

    // Assign nurses with the lowest total care level for each shift
    const nursesToAssign = {};
    for (const shift in nursesByShift) {
      nursesByShift[shift].sort((a, b) => a.totalCareLevel - b.totalCareLevel);
      nursesToAssign[shift] = nursesByShift[shift][0].id;
    }

    // Update the patient document with assigned nurses
    const patientRef = admin
      .firestore()
      .collection("patient")
      .doc(context.params.patientId);
    await patientRef.update({
      nurse1: admin
        .firestore()
        .collection("users")
        .doc(nursesToAssign["07:00 - 15:00"]),
      nurse2: admin
        .firestore()
        .collection("users")
        .doc(nursesToAssign["15:00 - 23:00"]),
      nurse3: admin
        .firestore()
        .collection("users")
        .doc(nursesToAssign["23:00 - 07:00"]),
    });

    // Update the total care level for the assigned nurses
    for (const shift in nursesToAssign) {
      const nurseRef = admin
        .firestore()
        .collection("users")
        .doc(nursesToAssign[shift]);
      await nurseRef.get().then((doc) => {
        const nurseData = doc.data();
        const currentTotalCareLevel = nurseData.totalCareLevel || 0;
        nurseRef.update({ totalCareLevel: currentTotalCareLevel + careLevel });
      });
    }
  });
