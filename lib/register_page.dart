import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  static String tag = 'register-page';
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> registerFormKey = new GlobalKey<FormState>();
  _RegisterData _registerData = new _RegisterData();

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
      'Create an Account',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 30.0,
      ),
      textAlign: TextAlign.center,
    );

    final firstName = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: '',
        labelText: 'Firstname',
        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
      ),
      onSaved: (String value) {
        this._registerData.firstName = value;
      }
    );

    final lastName = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: '',
        labelText: 'Lastname',
        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
      ),
      onSaved: (String value) {
        this._registerData.lastName = value;
      }
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: 'jlramothale@gmail.com',
      decoration: InputDecoration(
        hintText: 'you@example.com',
        labelText: 'E-mail Address',
        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
      ),
      onSaved: (String value) {
        this._registerData.email = value;
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
        this._registerData.password = value;
      }
    );

    final registerButton = Container(
      width: screenSize.width,
      child: RaisedButton(
        child: Text(
          'Register',
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

    final loginPage = FlatButton(
      child: Text(
        'Go to Login',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: ()=> Navigator.of(context).pushReplacementNamed(LoginPage.tag),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Form(
          key: this.registerFormKey,
          child: ListView(
            children: <Widget>[
              logo,
              SizedBox(height: 30.0),
              driverText,
              SizedBox(height: 10.0),
              firstName,
              SizedBox(height: 8.0),
              lastName,
              SizedBox(height: 8.0),
              email,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 24.0),
              registerButton,
              loginPage
            ],
          ),
        )
      ),
    );
  }

   void submit(){
    // First validate form.
    if (this.registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save(); // Save our form now.
      print('Printing the register data.');
      print('Firstname: ${_registerData.firstName}');
      print('Lastname: ${_registerData.lastName}');
      print('Email: ${_registerData.email}');
      print('Password: ${_registerData.password}');
      Navigator.of(context).pushReplacementNamed(HomePage.tag);
    }
  }

}

class _RegisterData {
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
}

