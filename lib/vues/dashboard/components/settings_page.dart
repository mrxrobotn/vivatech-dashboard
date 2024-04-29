import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vtdashboard/functions.dart';
import 'package:vtdashboard/vues/auth/Login/login_screen.dart';

import '../../../constants.dart';
import '../../../controller/auth_response.dart';
import '../../../controller/authentication_service.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 600,
        height: 400,
        child: Padding(
          padding: EdgeInsets.only(
              top: 20, bottom: MediaQuery.of(context).viewInsets.bottom + 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F4F8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/images/details.png",
                          width: 250,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(getUsername.toString()),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            getEmail.toString(),
                            style: const TextStyle(
                              color: kDarkPurple,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor.withOpacity(1),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5,
                            color: kLightGrey,
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Text(
                                'Changer le mot de passe',
                                style: TextStyle(
                                  color: kGrey,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: const AlignmentDirectional(0.9, 0),
                                child: IconButton(
                                  color: kGrey,
                                  onPressed: () {
                                    showDialog<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const AlertDialog(
                                          title: Text('Changer votre mot de passe:'),
                                          content: ChangePasswordPopUp(),
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.arrow_forward_ios,
                                      size: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 5),
                    child: Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: kPrimaryLightColor.withOpacity(1),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5,
                            color: kLightGrey,
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        shape: BoxShape.rectangle,
                      ),
                      child: Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Text(
                                'Déconnexion',
                                style: TextStyle(
                                  color: kGrey,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: const AlignmentDirectional(0.9, 0),
                                child: IconButton(
                                  color: kGrey,
                                  onPressed: () {
                                    AuthenticationService()
                                        .signOut()
                                        .then((value) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            const LoginScreen()),
                                      );
                                    });
                                  },
                                  icon: const Icon(Icons.arrow_forward_ios,
                                      size: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kBlue, elevation: 0),
                    child: const Text(
                      "Fermer",
                      style: TextStyle(
                          color: kGrey
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChangePasswordPopUp extends StatefulWidget {
  const ChangePasswordPopUp({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPopUp> createState() => _ChangePasswordPopUpState();
}

class _ChangePasswordPopUpState extends State<ChangePasswordPopUp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 400,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          const Text(
            "Saisissez votre adresse électronique pour réinitialiser votre mot de passe",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
              key: _formKey,
              child: Column(
                  children: [
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      cursorColor: kPrimaryColor,
                      onSaved: (email) {},
                      decoration: const InputDecoration(
                        hintText: "Votre email",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(kDefaultPadding),
                          child: Icon(Icons.email),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entrer votre email';
                        } else if (!value.contains('@')) {
                          return 'Veuillez saisir un email valide';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Hero(
                      tag: "reset_btn",
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            AuthenticationService()
                                .resetPassword(email: email.text)
                                .then((authResponse) {
                              if (authResponse.authStatus == AuthStatus.success) {
                                Util.showSuccessMessage(context,
                                    "Un e-mail a été envoyé pour réinitialiser le mot de passe, veuillez vérifier votre adresse e-mail.");
                              } else {
                                Util.showErrorMessage(context, authResponse.message);
                              }
                            });
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          "Envoyer",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Hero(
                      tag: "close_btn",
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Fermer",
                        ),
                      ),
                    ),
                  ]
              )
          ),
        ]),
      ),
    );
  }
}
