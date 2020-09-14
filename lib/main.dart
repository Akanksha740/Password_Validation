import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  String _jsscmpid;
  String _password;
  String validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid password';
      else
        return null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();

      performLogin();
    }
  }

  void performLogin() {
    final snackBar = new SnackBar(
      content: Text("ID:$_jsscmpid,password:$_password"),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: new Text("Login"),
        ),
        body: Form(
          key: formKey,
          child: new Column(
            children: [
              new TextFormField(
                decoration: new InputDecoration(labelText: "JSS Companion Id"),
                validator: (val) =>
                    !val.startsWith('Jsscmp') ? 'Invalid Id' : null,
                onSaved: (val) => _jsscmpid = val,
              ),
              new TextFormField(
                decoration: new InputDecoration(labelText: "Password"),
                validator: validatePassword,
                onSaved: (val) => _password = val,
              ),
              RaisedButton(
                child: new Text("login"),
                onPressed: _submit,
              )
            ],
          ),
        ),
      ),
    );
  }
}
