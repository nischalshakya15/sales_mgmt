import 'package:flutter/material.dart';
import 'package:sales_mgmt/org/personal/salemgmt/domain/sales_ui.dart';
import 'package:sales_mgmt/org/personal/salemgmt/utils/ui_utils.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final globalKey = GlobalKey<ScaffoldState>();

  Container salesManagementContainer() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Text('Sales Management',
            style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
                fontSize: 30)));
  }

  Container signInContainer() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Text('Sign In',
            style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w400,
                fontSize: 20)));
  }

  Container userNameContainer() {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
          controller: _userNameController,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'User Name')),
    );
  }

  Container passwordContainer() {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Password')));
  }

  FlatButton forgotPassword() {
    return FlatButton(
        onPressed: () {
          //forgot password screen
        },
        textColor: Colors.blue,
        child: Text('Forgot Password'));
  }

  Container loginContainer(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: RaisedButton(
            textColor: Colors.white,
            color: Colors.blue,
            child: Text('Login'),
            onPressed: () {
              if (_userNameController.text.trim() == 'admin' &&
                  _passwordController.text.trim() == 'admin') {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SaleUi()));
              } else {
                UiUtils.showSnackBar(
                    globalKey, 'Invalid Credentials', Colors.red);
              }
            }));
  }

  Container signInForgotPasswordContainer() {
    return Container(
      child: Row(
        children: <Widget>[
          Text('Does not have account ?'),
          FlatButton(
            textColor: Colors.blue,
            child: Text('Sign in', style: TextStyle(fontSize: 18)),
            onPressed: () {},
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
          title: Text('Sales Management',
              style: Theme.of(context).primaryTextTheme.headline6)),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            salesManagementContainer(),
            signInContainer(),
            userNameContainer(),
            passwordContainer(),
            forgotPassword(),
            loginContainer(context),
            signInForgotPasswordContainer()
          ],
        ),
      ),
    );
  }
}
