import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/components/doctor_list/doctor_list_widget.dart';
import '/components/icu/icu_widget.dart';
import '/components/room/room_widget.dart';
import '/components/ward/ward_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'input_patient_widget.dart' show InputPatientWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class InputPatientModel extends FlutterFlowModel<InputPatientWidget> {
  ///  Local state fields for this page.

  List<String> allergies = [];
  void addToAllergies(String item) => allergies.add(item);
  void removeFromAllergies(String item) => allergies.remove(item);
  void removeAtIndexFromAllergies(int index) => allergies.removeAt(index);
  void insertAtIndexInAllergies(int index, String item) =>
      allergies.insert(index, item);
  void updateAllergiesAtIndex(int index, Function(String) updateFn) =>
      allergies[index] = updateFn(allergies[index]);

  List<String> intolerances = [];
  void addToIntolerances(String item) => intolerances.add(item);
  void removeFromIntolerances(String item) => intolerances.remove(item);
  void removeAtIndexFromIntolerances(int index) => intolerances.removeAt(index);
  void insertAtIndexInIntolerances(int index, String item) =>
      intolerances.insert(index, item);
  void updateIntolerancesAtIndex(int index, Function(String) updateFn) =>
      intolerances[index] = updateFn(intolerances[index]);

  List<DiagnosisStruct> illnesses = [];
  void addToIllnesses(DiagnosisStruct item) => illnesses.add(item);
  void removeFromIllnesses(DiagnosisStruct item) => illnesses.remove(item);
  void removeAtIndexFromIllnesses(int index) => illnesses.removeAt(index);
  void insertAtIndexInIllnesses(int index, DiagnosisStruct item) =>
      illnesses.insert(index, item);
  void updateIllnessesAtIndex(int index, Function(DiagnosisStruct) updateFn) =>
      illnesses[index] = updateFn(illnesses[index]);

  List<String> surgeries = [];
  void addToSurgeries(String item) => surgeries.add(item);
  void removeFromSurgeries(String item) => surgeries.remove(item);
  void removeAtIndexFromSurgeries(int index) => surgeries.removeAt(index);
  void insertAtIndexInSurgeries(int index, String item) =>
      surgeries.insert(index, item);
  void updateSurgeriesAtIndex(int index, Function(String) updateFn) =>
      surgeries[index] = updateFn(surgeries[index]);

  List<String> familyillnesses = [];
  void addToFamilyillnesses(String item) => familyillnesses.add(item);
  void removeFromFamilyillnesses(String item) => familyillnesses.remove(item);
  void removeAtIndexFromFamilyillnesses(int index) =>
      familyillnesses.removeAt(index);
  void insertAtIndexInFamilyillnesses(int index, String item) =>
      familyillnesses.insert(index, item);
  void updateFamilyillnessesAtIndex(int index, Function(String) updateFn) =>
      familyillnesses[index] = updateFn(familyillnesses[index]);

  List<String> socialhisto = [];
  void addToSocialhisto(String item) => socialhisto.add(item);
  void removeFromSocialhisto(String item) => socialhisto.remove(item);
  void removeAtIndexFromSocialhisto(int index) => socialhisto.removeAt(index);
  void insertAtIndexInSocialhisto(int index, String item) =>
      socialhisto.insert(index, item);
  void updateSocialhistoAtIndex(int index, Function(String) updateFn) =>
      socialhisto[index] = updateFn(socialhisto[index]);

  DocumentReference? doctor;

  String? deptnumber;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for fname widget.
  FocusNode? fnameFocusNode;
  TextEditingController? fnameTextController;
  String? Function(BuildContext, String?)? fnameTextControllerValidator;
  // State field(s) for mname widget.
  FocusNode? mnameFocusNode;
  TextEditingController? mnameTextController;
  String? Function(BuildContext, String?)? mnameTextControllerValidator;
  // State field(s) for lname widget.
  FocusNode? lnameFocusNode;
  TextEditingController? lnameTextController;
  String? Function(BuildContext, String?)? lnameTextControllerValidator;
  // State field(s) for contanct widget.
  FocusNode? contanctFocusNode;
  TextEditingController? contanctTextController;
  String? Function(BuildContext, String?)? contanctTextControllerValidator;
  // Model for WARD component.
  late WardModel wardModel;
  // Model for ICU component.
  late IcuModel icuModel;
  // Model for ROOM component.
  late RoomModel roomModel;
  // State field(s) for carelevel widget.
  String? carelevelValue;
  FormFieldController<String>? carelevelValueController;
  // State field(s) for dropward widget.
  String? dropwardValue;
  FormFieldController<String>? dropwardValueController;
  // State field(s) for droproom widget.
  String? droproomValue;
  FormFieldController<String>? droproomValueController;
  // State field(s) for dropicu widget.
  String? dropicuValue;
  FormFieldController<String>? dropicuValueController;
  DateTime? datePicked1;
  // State field(s) for gender widget.
  FormFieldController<List<String>>? genderValueController;
  String? get genderValue => genderValueController?.value?.firstOrNull;
  set genderValue(String? val) =>
      genderValueController?.value = val != null ? [val] : [];
  // State field(s) for civilstat widget.
  String? civilstatValue;
  FormFieldController<String>? civilstatValueController;
  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressTextController;
  String? Function(BuildContext, String?)? addressTextControllerValidator;
  // State field(s) for natio widget.
  FocusNode? natioFocusNode;
  TextEditingController? natioTextController;
  String? Function(BuildContext, String?)? natioTextControllerValidator;
  // State field(s) for relig widget.
  FocusNode? religFocusNode;
  TextEditingController? religTextController;
  String? Function(BuildContext, String?)? religTextControllerValidator;
  // State field(s) for occu widget.
  FocusNode? occuFocusNode;
  TextEditingController? occuTextController;
  String? Function(BuildContext, String?)? occuTextControllerValidator;
  // State field(s) for soname widget.
  FocusNode? sonameFocusNode;
  TextEditingController? sonameTextController;
  String? Function(BuildContext, String?)? sonameTextControllerValidator;
  // State field(s) for sorelation widget.
  FocusNode? sorelationFocusNode;
  TextEditingController? sorelationTextController;
  String? Function(BuildContext, String?)? sorelationTextControllerValidator;
  // State field(s) for socontact widget.
  FocusNode? socontactFocusNode;
  TextEditingController? socontactTextController;
  String? Function(BuildContext, String?)? socontactTextControllerValidator;
  // State field(s) for doctor widget.
  FocusNode? doctorFocusNode;
  TextEditingController? doctorTextController;
  String? Function(BuildContext, String?)? doctorTextControllerValidator;
  // Stores action output result for [Bottom Sheet - DoctorList] action in Button widget.
  UsersRecord? doc;
  // State field(s) for inputallergy widget.
  FocusNode? inputallergyFocusNode;
  TextEditingController? inputallergyTextController;
  String? Function(BuildContext, String?)? inputallergyTextControllerValidator;
  // State field(s) for inputintolerance widget.
  FocusNode? inputintoleranceFocusNode;
  TextEditingController? inputintoleranceTextController;
  String? Function(BuildContext, String?)?
      inputintoleranceTextControllerValidator;
  // State field(s) for blood widget.
  String? bloodValue;
  FormFieldController<String>? bloodValueController;
  // State field(s) for height widget.
  FocusNode? heightFocusNode;
  TextEditingController? heightTextController;
  String? Function(BuildContext, String?)? heightTextControllerValidator;
  // State field(s) for weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightTextController;
  String? Function(BuildContext, String?)? weightTextControllerValidator;
  // State field(s) for inputillness widget.
  FocusNode? inputillnessFocusNode;
  TextEditingController? inputillnessTextController;
  String? Function(BuildContext, String?)? inputillnessTextControllerValidator;
  // State field(s) for startillness widget.
  FocusNode? startillnessFocusNode;
  TextEditingController? startillnessTextController;
  String? Function(BuildContext, String?)? startillnessTextControllerValidator;
  DateTime? datePicked2;
  // State field(s) for endillness widget.
  FocusNode? endillnessFocusNode;
  TextEditingController? endillnessTextController;
  String? Function(BuildContext, String?)? endillnessTextControllerValidator;
  DateTime? datePicked3;
  // State field(s) for inputsurgery widget.
  FocusNode? inputsurgeryFocusNode;
  TextEditingController? inputsurgeryTextController;
  String? Function(BuildContext, String?)? inputsurgeryTextControllerValidator;
  // State field(s) for inputfamilliness widget.
  FocusNode? inputfamillinessFocusNode;
  TextEditingController? inputfamillinessTextController;
  String? Function(BuildContext, String?)?
      inputfamillinessTextControllerValidator;
  // State field(s) for inputsocialhisto widget.
  FocusNode? inputsocialhistoFocusNode;
  TextEditingController? inputsocialhistoTextController;
  String? Function(BuildContext, String?)?
      inputsocialhistoTextControllerValidator;
  // Stores action output result for [Cloud Function - createUserAccount] action in Button widget.
  CreateUserAccountCloudFunctionCallResponse? createdUser;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PatientRecord? newpatient;

  @override
  void initState(BuildContext context) {
    wardModel = createModel(context, () => WardModel());
    icuModel = createModel(context, () => IcuModel());
    roomModel = createModel(context, () => RoomModel());
  }

  @override
  void dispose() {
    fnameFocusNode?.dispose();
    fnameTextController?.dispose();

    mnameFocusNode?.dispose();
    mnameTextController?.dispose();

    lnameFocusNode?.dispose();
    lnameTextController?.dispose();

    contanctFocusNode?.dispose();
    contanctTextController?.dispose();

    wardModel.dispose();
    icuModel.dispose();
    roomModel.dispose();
    addressFocusNode?.dispose();
    addressTextController?.dispose();

    natioFocusNode?.dispose();
    natioTextController?.dispose();

    religFocusNode?.dispose();
    religTextController?.dispose();

    occuFocusNode?.dispose();
    occuTextController?.dispose();

    sonameFocusNode?.dispose();
    sonameTextController?.dispose();

    sorelationFocusNode?.dispose();
    sorelationTextController?.dispose();

    socontactFocusNode?.dispose();
    socontactTextController?.dispose();

    doctorFocusNode?.dispose();
    doctorTextController?.dispose();

    inputallergyFocusNode?.dispose();
    inputallergyTextController?.dispose();

    inputintoleranceFocusNode?.dispose();
    inputintoleranceTextController?.dispose();

    heightFocusNode?.dispose();
    heightTextController?.dispose();

    weightFocusNode?.dispose();
    weightTextController?.dispose();

    inputillnessFocusNode?.dispose();
    inputillnessTextController?.dispose();

    startillnessFocusNode?.dispose();
    startillnessTextController?.dispose();

    endillnessFocusNode?.dispose();
    endillnessTextController?.dispose();

    inputsurgeryFocusNode?.dispose();
    inputsurgeryTextController?.dispose();

    inputfamillinessFocusNode?.dispose();
    inputfamillinessTextController?.dispose();

    inputsocialhistoFocusNode?.dispose();
    inputsocialhistoTextController?.dispose();
  }
}
