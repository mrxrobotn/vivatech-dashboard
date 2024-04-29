import 'package:flutter/material.dart';
import 'package:vtdashboard/vues/auth/Login/login_screen.dart';
import 'package:vtdashboard/vues/dashboard/components/settings_page.dart';
import '../../../constants.dart';
import '../../../controller/authentication_service.dart';
import 'drawer_list_tile.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo-oif.png")
          ),
          const Padding(
              padding: EdgeInsets.only(top: kDefaultPadding * 4)
          ),
          DrawerListTile(
              title: 'Paramètres',
              svgSrc: 'assets/icons/Setting.svg',
              tap: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text('Paramètres'),
                      content: SettingsPage(),
                    );
                  },
                );
              }
          ),
          DrawerListTile(
              title: 'Déconnexion',
              svgSrc: 'assets/icons/Logout.svg',
              tap: () {
                AuthenticationService().signOut().then((value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                });
              }
          ),
          Container(
            padding: const EdgeInsets.only(top: 100),
            child: Image.asset("assets/images/logo-dclic.png"),
          ),
        ],
      ),
    );
  }
}
