import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Delete_Com extends StatefulWidget {
  const Delete_Com({super.key});

  @override
  State<Delete_Com> createState() => _Delete_ComState();
}

class _Delete_ComState extends State<Delete_Com> {
  CollectionReference studentRef =
      FirebaseFirestore.instance.collection('students');

  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController courseController = TextEditingController();

  Future<void> delete([DocumentSnapshot? documentSnapshot]) async {
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
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: courseController,
              decoration: InputDecoration(labelText: 'Course'),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () async {
                  final String name = nameController.text;
                  final String course = courseController.text;
                  final double? id = double.tryParse(idController.text);
                  if (id != null) {
                    await studentRef.doc(documentSnapshot!.id).delete();
                    idController.text = '';
                    nameController.text = '';
                    courseController.text = '';
                    Navigator.of(context).pop();
                  }
                },
                child: Icon(Icons.delete))
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
                            delete(documentSnapshot);
                          },
                          icon: Icon(Icons.delete))),
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
    ;
  }
}
