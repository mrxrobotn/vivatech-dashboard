import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../functions.dart';
import 'custom_loader.dart';


class QuestionsDataList extends StatefulWidget {
  const QuestionsDataList({Key? key}) : super(key: key);

  @override
  _QuestionsDataListState createState() => _QuestionsDataListState();
}

class _QuestionsDataListState extends State<QuestionsDataList> {


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: appresults.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomLoader();
        }

        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int index) {
            DocumentSnapshot document = snapshot.data!.docs[index];
            Query<Map<String, dynamic>> choicesRef = document.reference.collection('choices').orderBy('num', descending: true).limit(1);

            return StreamBuilder<QuerySnapshot>(
              stream: choicesRef.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> choicesSnapshot) {
                if (choicesSnapshot.hasError) {
                  return Text('Error: ${choicesSnapshot.error}');
                }

                if (choicesSnapshot.connectionState == ConnectionState.waiting) {
                  return CustomLoader();
                }

                List<Widget> choiceListTiles = choicesSnapshot.data!.docs
                    .where((choiceDocument) => (choiceDocument.data() as Map<String, dynamic>).containsKey('question'))
                    .map((choiceDocument) {
                  Map<String, dynamic> data = choiceDocument.data() as Map<String, dynamic>;
                  String question = data['question'] ?? '';
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(5),
                    color: kPrimaryLightColor.withOpacity(1),
                    child: ListTile(
                      textColor: kGrey,
                      title: Wrap(
                        children: [
                          const Text('Question: ', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(question, style: const TextStyle(fontSize: 15)),
                        ],
                      ),
                      leading: const Icon(Icons.question_answer),
                    ),
                  );
                }).toList();

                return SingleChildScrollView(
                  child: Column(
                    children: choiceListTiles,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
