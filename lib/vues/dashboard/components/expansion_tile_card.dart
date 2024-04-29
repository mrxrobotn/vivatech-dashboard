import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';


class ExpansionTileCardDemo extends StatelessWidget {
  ExpansionTileCardDemo( {Key? key, required this.username, required this.email, required this.link}) : super(key: key);
  GlobalKey<ExpansionTileCardState> cardA = GlobalKey();

  String username = '';
  String email = '';
  String link = '';


  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      baseColor: kPrimaryLightColor.withOpacity(1),
      expandedColor: kPrimaryLightColor.withOpacity(1),
      shadowColor: kWhite,
      animateTrailing: true,
      key: cardA,
      leading: const CircleAvatar(
          child: Icon(Icons.person)
      ),
      title: const Text("Nom d'utilisateur: ", style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(username),
      children: <Widget>[
        const Divider(
          thickness: 1.0,
          height: 1.0,
        ),
        DataTable(
          headingRowHeight: 0,
          columns: const [
            DataColumn(label: Text('')),
            DataColumn(label: Text(''))
          ],
          rows:[
            DataRow(
              cells: [
                DataCell(
                  Wrap(
                    children: [
                      SvgPicture.asset("assets/icons/Subscribers.svg", color: kBlue),
                      const SizedBox(width: kDefaultPadding),
                      const Text("Nom d'utilisateur: "),
                    ],
                  ),
                ),
                DataCell(
                  Text(username),
                ),
              ]
            ),
            DataRow(
              cells: [
                DataCell(
                  Wrap(
                    children: [
                      SvgPicture.asset("assets/icons/Message.svg", color: kBlue),
                      const SizedBox(width: kDefaultPadding),
                      const Text("Email: "),
                    ],
                  ),
                ),
                DataCell(
                  Text(email),
                ),
              ]
            ),
            DataRow(
              cells: [
                DataCell(
                  Wrap(
                    children: [
                      SvgPicture.asset("assets/icons/Linkedin.svg", color: kBlue, width: 25, height: 25,),
                      const SizedBox(width: kDefaultPadding),
                      const Text("Profil: "),
                    ],
                  ),
                ),
                DataCell(
                  Text(link),
                ),
              ]
            ),
          ]
        ),
        ButtonBar(
          alignment: MainAxisAlignment.spaceAround,
          buttonHeight: 52.0,
          buttonMinWidth: 90.0,
          children: <Widget>[
            TextButton(
              onPressed: () async {
                if (link != '' && link != 'Aucun profil LinkedIn trouvé' ){
                  final Uri _url = Uri.parse(link);
                  if (!await launchUrl(_url)) {
                    throw Exception('Could not launch $_url');
                  }
                }
              },
              child: const Column(
                children: <Widget>[
                  Icon(Icons.link),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Text('Ouvrir le lien'),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                cardA.currentState?.collapse();
              },
              child: const Column(
                children: <Widget>[
                  Icon(Icons.close),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.0),
                  ),
                  Text('Fermer'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}