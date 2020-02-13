import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ungproduct/utility/my_style.dart';
import 'package:ungproduct/utility/normal_dialog.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Field
  String name, user, password, rePassword;

  // Method

  Widget nameForm() {
    Color color = Colors.purple;
    return TextField(
      onChanged: (String string) {
        name = string.trim();
      },
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        helperStyle: TextStyle(color: color),
        helperText: 'Type Your Name in Blank',
        labelStyle: TextStyle(color: color),
        labelText: 'Display Name :',
        icon: Icon(
          Icons.person,
          size: 36.0,
          color: color,
        ),
      ),
    );
  }

  Widget userForm() {
    Color color = Colors.green.shade700;
    return TextField(
      onChanged: (String string) {
        user = string.trim();
      },
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        helperStyle: TextStyle(color: color),
        helperText: 'Type User in Blank',
        labelStyle: TextStyle(color: color),
        labelText: 'User :',
        icon: Icon(
          Icons.email,
          size: 36.0,
          color: color,
        ),
      ),
    );
  }

  Widget passwordForm() {
    Color color = Colors.blue[700];
    return TextField(
      obscureText: true,
      onChanged: (String string) {
        password = string.trim();
      },
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        helperStyle: TextStyle(color: color),
        helperText: 'Type Your Password in Blank',
        labelStyle: TextStyle(color: color),
        labelText: 'Password :',
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: color,
        ),
      ),
    );
  }

  Widget rePasswordForm() {
    Color color = Colors.brown.shade700;
    return TextField(
      obscureText: true,
      onChanged: (String string) {
        rePassword = string.trim();
      },
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        helperStyle: TextStyle(color: color),
        helperText: 'Type Your Password in Blank Again',
        labelStyle: TextStyle(color: color),
        labelText: 'Re-Password :',
        icon: Icon(
          Icons.lock_open,
          size: 36.0,
          color: color,
        ),
      ),
    );
  }

  Widget registerButton() {
    return IconButton(
      tooltip: 'Upload To Server',
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print(
            'name = $name, user = $user, password = $password, rePassword = $rePassword');

        if (name == null ||
            name.isEmpty ||
            user == null ||
            user.isEmpty ||
            password == null ||
            password.isEmpty ||
            rePassword == null ||
            rePassword.isEmpty) {
          normalDialog(context, 'Have Space', 'Please Fill Every Blank');
        } else if (password == rePassword) {
          registerThread();
        } else {
          normalDialog(context, 'Password Not Math',
              'Plaese Type Password Math Re-Password');
        }
      },
    );
  }

  Future<void> registerThread()async{

    String url = 'https://www.androidthai.in.th/feb13/addUserUng.php?isAdd=true&Name=$name&User=$user&Password=$password';

    try {

      Response response = await Dio().get(url);
      print('response = $response');

      if (response.toString() == 'true') {
        Navigator.of(context).pop();
      } else {
        normalDialog(context, 'Register False', 'Try Again Register False');
      }
      
    } catch (e) {
      
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          nameForm(),
          userForm(),
          passwordForm(),
          rePasswordForm(),
        ],
      ),
      appBar: AppBar(
        actions: <Widget>[registerButton()],
        backgroundColor: MyStyle().textColor,
      ),
    );
  }
}
