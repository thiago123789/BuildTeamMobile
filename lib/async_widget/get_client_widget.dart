import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetClientWidget extends StatelessWidget {
  final String documentId;

  GetClientWidget(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection("clients");

    return FutureBuilder();
  }
}
