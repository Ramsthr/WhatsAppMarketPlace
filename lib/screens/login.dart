import '../services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double? _deviceWidth, _deviceHeight;
  final GlobalKey<FormState> _loginFormKey = GlobalKey();
  String? _email;
  String? _pwd;
  User? _user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: _deviceWidth! * 0.05),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _titleWidget(),
              _loginForm(),
              Column(
                children: [
                  _loginButton(),
                  const Divider(
                    height: 70,
                    thickness: 1,
                  ),
                  // _googleloginButton(),
                ],
              ),
              _registerPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _SignIntitleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      child: const Text(
        "SignIn",
        style: TextStyle(
          decorationStyle: TextDecorationStyle.solid,
          color: Colors.black,
          fontSize: 40,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            "FireMed",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Icon(Icons.medication),
      ],
    );
  }

  Widget _loginButton() {
    return MaterialButton(
      onPressed: _loginUser,
      minWidth: _deviceWidth! * 0.7,
      height: _deviceHeight! * 0.06,
      color: Colors.red,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: const Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

//  Widget _googleloginButton() {
//     return MaterialButton(
//       onPressed: () async {
//         final GoogleSignInAccount? googleUser =
//             await GoogleSignIn(scopes: <String>["email"]).signIn();

//         final GoogleSignInAuthentication googleAuth =
//             await googleUser!.authentication;

//         final credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );
//         Navigator.popAndPushNamed(context, 'home');
//       },
//       minWidth: _deviceWidth! * 0.7,
//       height: _deviceHeight! * 0.06,
//       color: Colors.red,
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(50))),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Icon(Icons.login_sharp),
//           const Text(
//             'Sign in by Google',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 25,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

  Widget _loginForm() {
    return Container(
      height: _deviceHeight! * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SignIntitleWidget(),
          Form(
            key: _loginFormKey,
            child: Container(
              height: _deviceHeight! * 0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _emailTextField(),
                  _passTextField(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "Email:abc@xys.com"),
      onSaved: (_value) {
        setState(
          () {
            _email = _value;
          },
        );
      },
      validator: (_value) {
        bool _result = _value!.contains(RegExp('[a-z0-9]+@[a-z]+\.[a-z]{2,3}'));
        return _result ? null : "Please Enter Valid Email";
      },
    );
  }

  Widget _passTextField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(hintText: "Enter Your Password"),
      onSaved: (_value) {
        setState(
          () {
            _pwd = _value;
          },
        );
      },
      validator: (_value) {
        return _value!.length > 8 ? null : "Please Enter Valid Password";
      },
    );
  }

  void _loginUser() async {
    print(_loginFormKey.currentState!.validate());
    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!.save();
      final _user =
          await AuthService().signInWithEmailAndPassword(_email!, _pwd!);
      if (_user != null) {
        Navigator.popAndPushNamed(
          context,
          'home',
        );
      }
    }
  }

  Widget _registerPage() {
    return GestureDetector(
      child: const Text(
        'Create an account',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 15,
          fontWeight: FontWeight.w200,
        ),
      ),
      onTap: () => Navigator.pushNamed(context, 'register'),
    );
  }
}
