const functions = require("firebase-functions");
const admin = require("firebase-admin");

// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.getInsights = functions
  .region("asia-southeast2")
  .https.onCall(async (data, context) => {
    // Get the current user ID
    const currentUserId = context.auth.uid;

    // Get the current time in UTC+8
    const currentTimeUTC8 = new Date().toLocaleString("en-US", {
      timeZone: "Asia/Singapore",
    });

    // Initialize counts
    let medicationCount = 0;
    let labtestCount = 0;

    try {
      const query1 = admin
        .firestore()
        .collection("patient")
        .where("nurse1", "==", admin.firestore().doc(`users/${currentUserId}`));

      const query2 = admin
        .firestore()
        .collection("patient")
        .where("nurse2", "==", admin.firestore().doc(`users/${currentUserId}`));

      const query3 = admin
        .firestore()
        .collection("patient")
        .where("nurse3", "==", admin.firestore().doc(`users/${currentUserId}`));

      const patientsSnapshot = await query1.union(query2).union(query3).get();

      // Loop through each patient
      for (const patientDoc of patientsSnapshot.docs) {
        // Get the medications subcollection
        const medicationsSnapshot = await patientDoc.ref
          .collection("medications")
          .where("end", ">=", currentTimeUTC8)
          .get();

        // Count the medications
        medicationCount += medicationsSnapshot.size;

        // Get the labtests subcollection
        const labtestsSnapshot = await patientDoc.ref
          .collection("labtests")
          .where("fetched", "==", false)
          .get();

        // Count the labtests
        labtestCount += labtestsSnapshot.size;
      }

      return { medicationCount, labtestCount };
    } catch (error) {
      console.error("Error getting insights:", error);
      throw new functions.https.HttpsError(
        "internal",
        "Failed to get insights",
      );
    }
  });
