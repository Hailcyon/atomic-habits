import "package:ahapp3/routes/app_routes.dart";
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ahapp3/presentation/auth.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text, 
        password: _controllerPassword.text);
    } on FirebaseAuthException catch(e) {
      setState(() {
        errorMessage = "Error logging in: ${e.toString().substring(0, 50)}" ;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text, 
        password: _controllerPassword.text);
    } on FirebaseAuthException catch(e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('Atomic Habits');
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
         labelText: title,
      ),
    );

  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '$errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
        isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Login' : 'Register')
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login instead'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField('email', _controllerEmail),
            _entryField('password', _controllerPassword),
            _errorMessage(),
            _submitButton(),
            _loginOrRegisterButton(),
          ],
        ),
      ),
    );
  }
}

// class loginScreen extends StatelessWidget{

// final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _loginForm(context),
//       // body: BlocProvider(
//       //   create: (context) => LoginBloc(
//       //     authRepo: context.read<AuthRepository>(),
//       //   ),
//       //   child: _loginForm(),
//       // ),
//     );
//   }

//   Widget _loginForm(BuildContext context) {
//     return Form(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           //name of the app
//           Text(
//             'Atomic Habits',
//             style: TextStyle(
//               fontSize: 45,
//               color: Colors.lightBlue[900],
//               height: 1,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           _atomicIcon(),
//           _authenticField(),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
//             child: _loginButton(context),
//           ),
//         ]
//       ),
//     );
//   }

//   Widget _atomicIcon() {
//     return Image(
//       image: AssetImage("assets/images/atomic_icon.png"),
//     );
//   }

//   Widget _authenticField() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 20.0,
//             vertical: 5.0
//           ),
//           child: _usernameField(),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 20.0,
//             // vertical: 5.0
//           ),
//           child: _passwordField(),
//         ),
//       ],
//     );
//   }

//   Widget _usernameField() {
//     return TextFormField(
//       decoration: InputDecoration(
//         hintText: 'Username',
//         border: new OutlineInputBorder(
//           borderRadius: const BorderRadius.all(
//             const Radius.circular(10.0),
//           ),
//           borderSide: new BorderSide(
//             color: Colors.black,
//             width: 1.0,
//           ),
//         ),
//       ),
//       validator: (value) => null,
//     );
//   }

//   Widget _passwordField() {
//     return TextFormField(
//       obscureText: true,
//       decoration: InputDecoration(
//         hintText: 'Password',
//         border: new OutlineInputBorder(
//           borderRadius: const BorderRadius.all(
//             const Radius.circular(10.0),
//           ),
//           borderSide: new BorderSide(
//             color: Colors.black,
//             width: 1.0,
//           ),
//         ),
//       ),
//       validator: (value) => null,
//     );
//   }

//   Widget _loginButton(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         // Navigator.of(context).pushReplacementNamed(AppRoutes.homePageContainerPage);
//         Navigator.pushNamed(context, AppRoutes.homePageContainer1Screen);
//       }, 
//       child: Text(
//         'Login',
//         style: TextStyle(
//           fontSize: 35.0
//         ),
//       ),
//       style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         primary: Colors.lightBlue[900],
//         onPrimary: Colors.amber[50],
//         padding: EdgeInsets.symmetric(
//           vertical: 15.0,
//           horizontal: 125.0
//         )
//       ),
//     );
//   }
// }