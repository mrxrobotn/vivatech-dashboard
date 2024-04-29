import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../functions.dart';
import 'custom_loader.dart';
import 'expansion_tile_card.dart';

class DataResultsList extends StatelessWidget {
  const DataResultsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: StreamBuilder(
            stream: appresults.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasData) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: streamSnapshot.data!.docs.length,
                  itemBuilder: (context, index) {

                    final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];

                    String Email = documentSnapshot['email'];
                    String Link = documentSnapshot['link'];

                    if (documentSnapshot['email'] == '')
                      {
                        Email = "Pas d'email trouvé";
                      } else {
                        Email = documentSnapshot['email'];
                    }
                    if (documentSnapshot['link'] == '')
                    {
                      Link = 'Aucun profil LinkedIn trouvé';
                    } else {
                      Link = documentSnapshot['link'];
                    }
                    return Padding(
                        padding: const EdgeInsets.all(5),
                      child: ExpansionTileCardDemo(username: documentSnapshot['username'], email: Email, link: Link)
                    );
                  },
                );
              }
              return CustomLoader();
            },
          ),
        )
    );
  }
}
