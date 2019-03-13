import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static String tag = 'profile-page';
  @override 
  _ProfilePageState createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final GlobalKey<FormState> profileFormKey = new GlobalKey<FormState>();
  _ProfilePageState();

  List<Widget> cards = new List.generate(20, (i)=>new CustomCard());

  @override
  Widget build(BuildContext context) {

    final firstName = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: '',
        labelText: 'Firstname',
        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
      ),
      onSaved: (String value) {
        // this._registerData.firstName = value;
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
        // this._registerData.lastName = value;
      }
    );

    final gender = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Radio(
          value: 'Male',
          // groupValue: _data.gender,
          // onChanged: ,
        ),
        new Text('Male'),
        new Radio(
          value: 'Female',
          // groupValue: _data.gender,
          // onChanged: _handleRadioValueChange,
        ),
        new Text('Female'),
      ],
    );

    final idPassport = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: '',
        labelText: 'South African ID',
        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
      ),
      onSaved: (String value) {
        // this._registerData.lastName = value;
      }
    );

    final cellNumber = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: '0623692587',
        labelText: 'Cell Number',
        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
      ),
      onSaved: (String value) {
        // this._data.cellNumber = value;
      }
    );

     final physicalAddress = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: '100 Lucia Street, Tsenelong Section, Tembisa, 1632',
        labelText: 'Physical Address',
        contentPadding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
      ),
      onSaved: (String value) {
        // this._data.physicalAddress = value;
      }
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
        // this._data.email = value;
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
        // this._data.password = value;
      }
    );

    final saveProfileButton = Container(
      // width: screenSize.width,
      child: RaisedButton(
        child: Text(
          'Save Profile',
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

    return Scaffold(
       appBar: new AppBar(
        title: new Text("Johannes Ramothale"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 0.0 : 0.0,
      ),
      body:  new Container(
        padding: EdgeInsets.all(15.0),
        child:new Form(
          key: this.profileFormKey,
          child: ListView(
            children: <Widget>[
              SizedBox(height: 10.0),
              firstName,
              SizedBox(height: 8.0),
              lastName,
              SizedBox(height: 8.0),
              gender,
              SizedBox(height: 8.0),
              idPassport,
              SizedBox(height: 8.0),
              cellNumber,
              SizedBox(height: 8.0),
              physicalAddress,
              SizedBox(height: 24.0),
              saveProfileButton,
            ],
          ),
        )
      ),
    );
  }

   void submit(){
    // First validate form.
    if (this.profileFormKey.currentState.validate()) {
      profileFormKey.currentState.save(); // Save our form now.
      // print('Printing the login data.');
      // print('Email: ${_data.email}');
      // print('Password: ${_data.password}');
      // Navigator.of(context).pushReplacementNamed(HomePage.tag);
    }
  }
}

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
return  new Card(
      child: new Column(
        children: <Widget>[
          new Image.network('https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg'),
          new Padding(
            padding: new EdgeInsets.all(7.0),
            child: new Row(
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: new Icon(Icons.thumb_up),
                ),
                new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: new Text('Like',style: new TextStyle(fontSize: 18.0),),
                ),
                new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: new Icon(Icons.comment),
                ),
                new Padding(
                  padding: new EdgeInsets.all(7.0),
                  child: new Text('Comments',style: new TextStyle(fontSize: 18.0)),
                )

              ],
            )
          )
        ],
      ),
    );
  }
}