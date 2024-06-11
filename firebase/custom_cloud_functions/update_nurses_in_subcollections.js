const functions = require("firebase-functions");
const admin = require("firebase-admin");

exports.updateNursesInSubcollections = functions.firestore
  .document("patient/{patientId}")
  .onUpdate(async (change, context) => {
    const newValue = change.after.data();
    const previousValue = change.before.data();

    // Check if nurse1, nurse2, or nurse3 has changed
    if (
      newValue.nurse1 !== previousValue.nurse1 ||
      newValue.nurse2 !== previousValue.nurse2 ||
      newValue.nurse3 !== previousValue.nurse3
    ) {
      // Create the new nurses array
      const nurses = [newValue.nurse1, newValue.nurse2, newValue.nurse3];

      const batch = admin.firestore().batch();

      // Update the 'nurses' field in 'kardex'
      const kardexDocs = await admin
        .firestore()
        .collection("patient")
        .doc(context.params.patientId)
        .collection("kardex")
        .get();

      kardexDocs.forEach((doc) => {
        batch.update(doc.ref, { nurses });
      });

      // Update the 'nurses' field in 'medications'
      const medicationDocs = await admin
        .firestore()
        .collection("patient")
        .doc(context.params.patientId)
        .collection("medications")
        .get();

      medicationDocs.forEach((doc) => {
        batch.update(doc.ref, { nurses });
      });

      // Update the 'nurses' field in 'labtests'
      const labtestDocs = await admin
        .firestore()
        .collection("patient")
        .doc(context.params.patientId)
        .collection("labtests")
        .get();

      labtestDocs.forEach((doc) => {
        batch.update(doc.ref, { nurses });
      });

      // Commit the batch
      await batch.commit();
    }
  });
