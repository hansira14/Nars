const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code
exports.updateKardexCount = functions.firestore
  .document("patient/{patientId}/kardex/{kardexId}")
  .onWrite(async (change, context) => {
    const patientId = context.params.patientId;
    const patientRef = admin.firestore().collection("patient").doc(patientId);

    // Get all kardex documents where isCompleted is false
    const kardexSnapshot = await patientRef
      .collection("kardex")
      .where("isCompleted", "==", false)
      .get();
    const incompleteKardexCount = kardexSnapshot.size;

    // Update the kardexcount field in the patient document
    return patientRef.update({ kardexcount: incompleteKardexCount });
  });
