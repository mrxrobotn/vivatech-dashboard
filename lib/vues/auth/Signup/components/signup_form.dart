import 'package:flutter/material.dart';
import 'package:vtdashboard/functions.dart';
import '../../../../constants.dart';
import '../../already_have_an_account_acheck.dart';
import '../../../../controller/auth_response.dart';
import '../../../../controller/authentication_service.dart';
import '../../Login/login_screen.dart';


class SignUpForm extends StatefulWidget {
  SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget> [
          TextFormField(
            controller: username,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Nom d'utilisateur",
              prefixIcon: Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Icon(Icons.person),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Saisir votre nom d\'utilisateur';
              } else if (value.length < 4) {
                return 'saisir au moins 4 caractères';
              } else if (value.length > 13) {
                return 'Le nombre maximum de caractères est de 13';
              }
              return null;
            },
          ),
          const SizedBox(height: kDefaultPadding * 2),
          TextFormField(
            controller: email,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Icon(Icons.email),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Saisir votre email';
              } else if (!value.contains('@')) {
                return 'Veuillez saisir un email valide';
              }
              return null;
            },
          ),
          const SizedBox(height: kDefaultPadding * 2),
          TextFormField(
            controller: password,
            textInputAction: TextInputAction.done,
            obscureText: ispasswordev,
            cursorColor: kPrimaryColor,
            decoration: InputDecoration(
              hintText: "Mot de passe",
              prefixIcon: const Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Icon(Icons.lock),
              ),
              suffixIcon: IconButton(
                icon: ispasswordev
                    ? Icon(
                  Icons.visibility_off,
                  color: selected == FormData.password
                      ? enabledtxt
                      : disabledtxt,
                  size: 20,
                )
                    : Icon(
                  Icons.visibility,
                  color: selected == FormData.password
                      ? enabledtxt
                      : disabledtxt,
                  size: 20,
                ),
                onPressed: () => setState(
                        () => ispasswordev = !ispasswordev),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Saisir un mot de passe';
              } else if (value.length < 4) {
                return 'Saisir au moins 4 caractères';
              } else if (value.length > 13) {
                return 'Le nombre maximum de caractères est de 13';
              }
              return null;
            },
          ),
          const SizedBox(height: kDefaultPadding * 2),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {

                String un = username.text ;
                String em = email.text ;
                String pwd = password.text ;


                if (un.isEmpty || em.isEmpty || pwd.isEmpty) {
                  print('One or more fields are empty');
                }
                else {
                  AuthenticationService()
                      .signUpWithEmail(
                      name: un,
                      email: em,
                      password: pwd)
                      .then((authResponse) {
                    if (authResponse.authStatus == AuthStatus.success) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                              (route) => false);
                      SaveUserData(un, em);
                    } else {
                      Util.showErrorMessage(
                          context, authResponse.message);
                    }
                  });
                }
              }
            },
            child: Text("S'inscrire".toUpperCase()),
          ),
          const SizedBox(height: kDefaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}