import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungproduct/models/user_model.dart';
import 'package:ungproduct/utility/my_style.dart';
import 'package:ungproduct/utility/normal_dialog.dart';
import 'package:ungproduct/widget/list_product.dart';
import 'package:ungproduct/widget/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Field
  String user, password;

  // Method
  Widget userForm() {
    return Container(
      width: 250.0,
      child: TextField(
        onChanged: (value) {
          user = value.trim();
        },
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
        obscureText: true,
        onChanged: (value) {
          password = value.trim();
        },
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
      onPressed: () {
        if (user == null ||
            user.isEmpty ||
            password == null ||
            password.isEmpty) {
          normalDialog(context, 'มีช่องว่าง', 'กรุณา กรอกทุกช่องสิ คะ');
        } else {
          checkAuthen();
        }
      },
    );
  }

  Future<void> checkAuthen() async {
    String url =
        'https://www.androidthai.in.th/feb13/getUserWhereUserUng.php?isAdd=true&User=$user';

    try {
      Response response = await Dio().get(url);
      print('response = $response');

      if (response.toString() == 'null') {
        normalDialog(context, 'User False', 'No $user in my Database');
      } else {
        var result = json.decode(response.data);
        print('result = $result');

        for (var map in result) {
          print('map = $map');
          UserModel userModel = UserModel.fromMap(map);

          if (password == userModel.password) {
            MaterialPageRoute materialPageRoute =
                MaterialPageRoute(builder: (BuildContext buildContext) {
              return ListProduct(userModel: userModel,);
            });
            Navigator.of(context).push(materialPageRoute);
          } else {
            normalDialog(
                context, 'Password False', 'Try Agains Password False');
          }
        }
      }
    } catch (e) {}
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
