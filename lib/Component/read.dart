import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Read_Com extends StatelessWidget {
  const Read_Com({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference studentRef =
        FirebaseFirestore.instance.collection('students');
    return Container(
      child: FutureBuilder<QuerySnapshot>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int i) {
                  return ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: "${snapshot.data!.docs[i]['id']}",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "${snapshot.data!.docs[i]['name']}",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "${snapshot.data!.docs[i]['course']}",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
        future: studentRef.get(),
      ),
    );
  }
}
