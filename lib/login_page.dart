import 'package:flutter/material.dart';
import 'home_page.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> loginFormKey = new GlobalKey<FormState>();
  _LoginData _data = new _LoginData();
  // _Validator _v = new _Validator();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final driverText = Text(
      'Schoober Driver',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 30.0,
      ),
      textAlign: TextAlign.center,
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'you@example.com',
        labelText: 'E-mail Address',
        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
      ),
      onSaved: (String value) {
        this._data.email = value;
      }
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
      ),
      onSaved: (String value) {
        this._data.password = value;
      }
    );

    final loginButton = Container(
      width: screenSize.width,
      child: RaisedButton(
        child: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0
          ),
        ),
        onPressed: this.submit,
        color: Colors.blue,
      ),
      margin: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0
      ),
    );

    // final forgotLabel = FlatButton(
    //   child: Text(
    //     'Forgot password?',
    //     style: TextStyle(color: Colors.black54),
    //   ),
    //   onPressed: () {},
    // );

    final registerPage = FlatButton(
      child: Text(
        'Create a new account',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: ()=> Navigator.of(context).pushReplacementNamed(RegisterPage.tag)
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Form(
          key: this.loginFormKey,
          child: ListView(
            children: <Widget>[
              logo,
              SizedBox(height: 30.0),
              driverText,
              SizedBox(height: 10.0),
              email,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 24.0),
              loginButton,
              // forgotLabel,
              registerPage
            ],
          ),
        )
      ),
    );
  }

  void submit(){
    // First validate form.
    if (this.loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save(); // Save our form now.
      print('Printing the login data.');
      print('Email: ${_data.email}');
      print('Password: ${_data.password}');
      Navigator.of(context).pushReplacementNamed(HomePage.tag);
    }
  }

}

class _LoginData {
  String email = '';
  String password = '';
}

