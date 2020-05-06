import 'package:flutter/material.dart';
import 'package:github_profiler/UI/HomePage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var fkey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Positioned(
                bottom: 250,
                left: 100,
                child: Opacity(
                  opacity: 0.2,
                  child: Container(
                    child: Image.asset(
                      'assets/Octocat.png',
                      height: 600,
                      width: 600,
                    ),
                  ),
                )),
            Center(
                child: Container(
                    child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/Octocat.png',
                      height: 150,
                      width: 200,
                    ),
                    Form(
                      key: fkey,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Theme(
                            data: ThemeData(
                              primaryColor: Colors.grey[400],
                              primaryColorDark: Colors.red,
                            ),
                            child: TextFormField(
                              controller: usernameController,
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Please Enter Username';
                                } else if (value.contains(' ')) {
                                  return 'Please Enter valid Username';
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: 'Username',
                                  labelText: 'Username',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8))),
                            )),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        width: MediaQuery.of(context).size.width,
                        child: MaterialButton(
                          color: Colors.blue,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                              onPressed: () {
                                setState(() {
                                  String username = usernameController.text;
                                  print(usernameController.text);
                                  if(fkey.currentState.validate()) {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                      return HomePage(username: username);
                                      //return Homepage();
                                    }));
                                    usernameController.clear();
                                  }
                                });
                              },
                          child: Padding(
                              padding: EdgeInsets.only(
                                //Left and right is the top and bottom, and vice versa
                                  left: 5, right: 5, top: 12, bottom: 12),
                              child: Text('Submit'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20))),
                        ))
                  ]),
            )))
          ],
        )),
      ),
    );
  }
}
