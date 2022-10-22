import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Update_Com extends StatefulWidget {
  const Update_Com({super.key});

  @override
  State<Update_Com> createState() => _Update_ComState();
}

class _Update_ComState extends State<Update_Com> {
  CollectionReference studentRef =
      FirebaseFirestore.instance.collection('students');

  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController courseController = TextEditingController();

  Future<void> update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      idController.text = documentSnapshot['id'];
      nameController.text = documentSnapshot['name'];
      courseController.text = documentSnapshot['course'];
    }
    await showBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(labelText: 'ID'),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'name'),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: courseController,
              decoration: InputDecoration(labelText: 'course'),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  final String name = nameController.text;
                  final String course = courseController.text;
                  final double? id = double.tryParse(idController.text);
                  if (id != null) {
                    await studentRef
                        .doc(documentSnapshot!.id)
                        .update({"Id": id, "name": name, "course": course});
                    idController.text = '';
                    nameController.text = '';
                    courseController.text = '';
                    Navigator.of(context).pop();
                  }
                },
                child: Text("Update"))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: studentRef.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                      trailing: Text(documentSnapshot['id'].toString()),
                      title: Text(documentSnapshot['name'].toString()),
                      subtitle: Text(documentSnapshot['course'].toString()),
                      leading: IconButton(
                          onPressed: () {
                            update(documentSnapshot);
                          },
                          icon: Icon(Icons.edit))),
                );
              },
            );
          }
          return Center(
            child: Text("Faild"),
          );
        },
      ),
    );
  }
}
