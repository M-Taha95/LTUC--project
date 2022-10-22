import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Add_Com extends StatelessWidget {
  const Add_Com({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController idCont = TextEditingController();
    TextEditingController nameCont = TextEditingController();
    TextEditingController courseCont = TextEditingController();
    // final studentReference = FirebaseFirestore.instance;

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Center(
                child: Text(
              "Add the student info",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: idCont,
              decoration: InputDecoration(
                labelText: "ID",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: nameCont,
              decoration: InputDecoration(
                labelText: "Name",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: courseCont,
              decoration: InputDecoration(
                labelText: "Course",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                CollectionReference studentReference =
                    FirebaseFirestore.instance.collection("students");
                studentReference.add({
                  'id': idCont.text,
                  'name': nameCont.text,
                  'course': courseCont.text
                });
              },
              child: Text(
                "Add the student",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              color: Color(0xffe46b10),
            )
          ],
        ),
      ),
    );
  }
}
