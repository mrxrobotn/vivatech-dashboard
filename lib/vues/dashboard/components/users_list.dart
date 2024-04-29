import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../functions.dart';
import 'custom_loader.dart';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 540,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Administrateurs:',
            style: TextStyle(
              color: kGrey,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: StreamBuilder(
                stream: users.where('username', isNotEqualTo: getUsername).snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  if (streamSnapshot.hasData) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: streamSnapshot.data!.docs.length,
                      itemBuilder: (context, index) {

                        final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.all(5),
                          color: kPrimaryLightColor.withOpacity(1),
                          child: ListTile(
                            textColor: kGrey,
                            title: Row(
                              children: [
                                const Text('Nom: '),
                                Text(documentSnapshot['username'])
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                const Text('Email: '),
                                Expanded(child: Text(documentSnapshot['email']))
                              ],
                            ),
                            leading: const CircleAvatar(
                                child: Icon(Icons.person)
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return CustomLoader();
                },
              ),
            )
          )
        ],
      ),
    );
  }
}
