import 'package:flutter/material.dart';
import 'package:ungproduct/utility/my_style.dart';
import 'package:ungproduct/widget/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Field

  // Method
  Widget userForm() {
    return Container(
      width: 250.0,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: MyStyle().textColor),
          ),
          hintStyle: TextStyle(color: MyStyle().textColor),
          hintText: 'User :',
        ),
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      width: 250.0,
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: MyStyle().textColor),
          ),
          hintStyle: TextStyle(color: MyStyle().textColor),
          hintText: 'Password :',
        ),
      ),
    );
  }

  Widget showLogo() {
    return Container(
      height: 120.0,
      child: Image.asset('images/logo2.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Ung Product',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: MyStyle().textColor,
      ),
    );
  }

  Widget signInButton() {
    return RaisedButton(
      color: MyStyle().textColor,
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget singUpButton() {
    return OutlineButton(
      borderSide: BorderSide(color: MyStyle().textColor),
      child: Text(
        'Sign Up',
        style: TextStyle(color: MyStyle().textColor),
      ),
      onPressed: () {
        print('You Click SignUp');

        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext buildContext) {
          return Register();
        });
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget mySizeBox() {
    return SizedBox(
      width: 5.0,
      height: 10.0,
    );
  }

  Widget showButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        signInButton(),
        mySizeBox(),
        singUpButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[Colors.white, MyStyle().mainColor],
            radius: 1.0,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showLogo(),
              showAppName(),
              userForm(),
              passwordForm(),
              mySizeBox(),
              showButton(),
            ],
          ),
        ),
      ),
    );
  }
}
