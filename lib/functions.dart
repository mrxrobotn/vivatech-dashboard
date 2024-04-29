import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


// Variables
Map<String, int> mergedCountryCounts = {};
int touchedIndex = -1;
Map<String, double> ratingData = {};

// User
User? user = FirebaseAuth.instance.currentUser;
String? userUID = user?.uid;
String? getUsername = FirebaseAuth.instance.currentUser?.displayName;
String? getEmail = FirebaseAuth.instance.currentUser?.email;


// Firestore Collections
CollectionReference users = FirebaseFirestore.instance.collection("users");
CollectionReference appresults = FirebaseFirestore.instance.collection("results");

// TextEditingControllers
final TextEditingController username = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController password = TextEditingController();

// Functions
Future SaveUserData(String username, String email) async {
  users.add({
    'username': username,
    'email': email,
  }).then((value) {
    print('Result added successfully!');
  }).catchError((error) {
    print('Failed to add result: $error');
  });
}

Stream<Map<String, int>> getCountryCountsStream() {
  return appresults.snapshots().asyncMap((resultsSnapshot) async {
    for (QueryDocumentSnapshot resultDoc in resultsSnapshot.docs) {
      Query<Map<String, dynamic>> choicesRef = resultDoc.reference
          .collection('choices')
          .orderBy('num', descending: true)
          .limit(1);

      QuerySnapshot choicesSnapshot = await choicesRef.get();

      Map<String, int> countryCounts = {};

      for (QueryDocumentSnapshot choiceDoc in choicesSnapshot.docs) {
        List<dynamic> countries = choiceDoc['countries'];

        for (dynamic country in countries) {
          if (countryCounts.containsKey(country)) {
            countryCounts[country] = countryCounts[country]! + 1;
          } else {
            countryCounts[country] = 1;
          }
        }
      }

      countryCounts.forEach((country, count) {
        if (mergedCountryCounts.containsKey(country)) {
          mergedCountryCounts[country] = mergedCountryCounts[country]! + count;
        } else {
          mergedCountryCounts[country] = count;
        }
      });
    }


    return mergedCountryCounts;
  });
}

