import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String getaccstat(int? stat) {
  // if 0 or null return "Pending", if 1 return "Approved", if 2 return "Declined"
  if (stat == 0 || stat == null) {
    return "Pending";
  } else if (stat == 1) {
    return "Approved";
  } else if (stat == 2) {
    return "Declined";
  } else {
    return "error";
  }
}

String? listToString(List<String>? list) {
  // converts a list of string to a single string divided by a comma
  if (list == null || list.isEmpty) {
    return null;
  }
  return list.join(', ');
}

int getAge(DateTime dateOfBirth) {
  // get the age by using the date of birth
  final now = DateTime.now();
  final age = now.year - dateOfBirth.year;
  if (now.month < dateOfBirth.month ||
      (now.month == dateOfBirth.month && now.day < dateOfBirth.day)) {
    return age - 1;
  }
  return age;
}

double ounceToML(double ounce) {
  // convert ounce to ml
  return ounce * 29.5735;
}

bool compare(
  DateTime? referencedate,
  DateTime datenow,
) {
  // check if referencedate is the same with datenow current day
  if (referencedate == null) {
    return false;
  }
  return referencedate.year == datenow.year &&
      referencedate.month == datenow.month &&
      referencedate.day == datenow.day;
}

DateTime nextSched(
  DateTime time,
  int addHour,
) {
  // get next schedule by adding the number of hours to the current time
  final nextTime = time.add(Duration(hours: addHour));
  return nextTime;
}

List<DocumentReference> generateNurseRefList(
  DocumentReference nurse1,
  DocumentReference nurse2,
  DocumentReference nurse3,
) {
  // generate a list of document reference from the parameters
  return [nurse1, nurse2, nurse3];
}

DateTime getEndDate(
  DateTime startDate,
  int durationDays,
) {
  // get end date by adding day duration to the start date
  return startDate.add(Duration(days: durationDays));
}

DocumentReference getNurseRecipient(
  DocumentReference nurse1,
  DocumentReference nurse2,
  DocumentReference nurse3,
  DateTime scheduledTime,
) {
  int scheduledHour = scheduledTime.hour;

  // Check the scheduled hour against the shifts
  if (scheduledHour >= 7 && scheduledHour < 15) {
    // Scheduled time falls within nurse1's shift
    return nurse1;
  } else if (scheduledHour >= 15 && scheduledHour < 23) {
    // Scheduled time falls within nurse2's shift
    return nurse2;
  } else {
    // Scheduled time falls within nurse3's shift
    return nurse3;
  }
}

DateTime getLastWeek(DateTime today) {
  // get the date last week
  return today.subtract(Duration(days: 7));
}

DocumentReference getDocumentReference(String documentID) {
  // generate document reference for users collection from documentID
  return FirebaseFirestore.instance.collection('users').doc(documentID);
}

int getCareLevel(String level) {
  if (level == 'Low')
    return 1;
  else if (level == 'Normal')
    return 2;
  else if (level == 'Medium')
    return 3;
  else if (level == 'High')
    return 4;
  else if (level == 'Critical')
    return 5;
  else
    return 0;
}

int getSum(List<int> number) {
  // get the sum
  int sum = 0;
  for (int i = 0; i < number.length; i++) {
    sum += number[i];
  }
  return sum;
}

String getTime(DateTime time) {
  // return AM if its 7pm 3pm, PM if its 3pm to 11pm, GY if 11pm to 7am
  if (time.hour >= 7 && time.hour < 15) {
    return 'AM';
  } else if (time.hour >= 15 && time.hour < 23) {
    return 'PM';
  } else {
    return 'GY';
  }
}
