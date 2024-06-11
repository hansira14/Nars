const functions = require("firebase-functions");
const admin = require("firebase-admin");
// To avoid deployment errors, do not call admin.initializeApp() in your code

exports.createUserAccount = functions
  .region("asia-southeast1")
  .https.onCall(async (data, context) => {
    const email = data.email;
    const password = data.password;
    const lname = data.lname;
    const fname = data.fname;
    const role = data.role;
    const specialty = data.specialty;

    try {
      // Create the user
      const userRecord = await admin.auth().createUser({
        email,
        password,
        display_name: `${lname}, ${fname}`,
      });

      // Set additional user claims
      await admin.auth().setCustomUserClaims(userRecord.uid, {
        role,
        specialty,
        accStatus: 1,
        completedSetup: true,
        lname,
        fname,
      });

      //const userDocRef = admin.firestore().doc(`users/${userRecord.uid}`);
      // Create a document in the "users" collection
      const userDocRef = admin
        .firestore()
        .collection("users")
        .doc(userRecord.uid);
      await userDocRef.set({
        email,
        uid: userRecord.uid,
        display_name: `${lname}, ${fname}`,
        role,
        specialty,
        accStatus: 1,
        completedSetup: true,
        lname,
        fname,
      });

      return userRecord.uid;
    } catch (error) {
      console.error("Error creating user:", error);
      throw new functions.https.HttpsError(
        "internal",
        error.message,
        error.details,
      );
    }
  });
