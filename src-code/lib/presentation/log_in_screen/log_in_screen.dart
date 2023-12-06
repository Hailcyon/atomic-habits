import "package:ahapp3/routes/app_routes.dart";
import "package:flutter/material.dart";

class loginScreen extends StatelessWidget{

final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginForm(context),
      // body: BlocProvider(
      //   create: (context) => LoginBloc(
      //     authRepo: context.read<AuthRepository>(),
      //   ),
      //   child: _loginForm(),
      // ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //name of the app
          Text(
            'Atomic\nHabits',
            style: TextStyle(
              fontSize: 60,
              color: Colors.lightBlue[900],
              height: 1,
            ),
            textAlign: TextAlign.center,
          ),
          _atomicIcon(),
          _authenticField(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: _loginButton(context),
          ),
        ]
      ),
    );
  }

  Widget _atomicIcon() {
    return Image(
      image: AssetImage("assets/images/atomic_icon.png"),
    );
  }

  Widget _authenticField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 5.0
          ),
          child: _usernameField(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            // vertical: 5.0
          ),
          child: _passwordField(),
        ),
      ],
    );
  }

  Widget _usernameField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Username',
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
          borderSide: new BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),
      validator: (value) => null,
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
          borderSide: new BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),
      validator: (value) => null,
    );
  }

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigator.of(context).pushReplacementNamed(AppRoutes.homePageContainerPage);
        Navigator.pushNamed(context, AppRoutes.homePageContainer1Screen);
      }, 
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 35.0
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        primary: Colors.lightBlue[900],
        onPrimary: Colors.amber[50],
        padding: EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 150.0
        )
      ),
    );
  }
}