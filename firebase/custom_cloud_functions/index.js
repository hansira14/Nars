const admin = require("firebase-admin/app");
admin.initializeApp();

const updateNursesInSubcollections = require("./update_nurses_in_subcollections.js");
exports.updateNursesInSubcollections =
  updateNursesInSubcollections.updateNursesInSubcollections;
const getInsights = require("./get_insights.js");
exports.getInsights = getInsights.getInsights;
const updateKardexCount = require("./update_kardex_count.js");
exports.updateKardexCount = updateKardexCount.updateKardexCount;
const createUserAccount = require("./create_user_account.js");
exports.createUserAccount = createUserAccount.createUserAccount;
const assignNursesToPatient = require("./assign_nurses_to_patient.js");
exports.assignNursesToPatient = assignNursesToPatient.assignNursesToPatient;
