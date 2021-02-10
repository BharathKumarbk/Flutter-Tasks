import 'package:flutter/material.dart';
import 'package:intern_task/components/constants.dart';
import 'package:intern_task/components/textStyles.dart';
import 'package:intern_task/views/authScreen/widgets.dart';
import 'package:intern_task/views/chatScreen/chat_view.dart';
import 'package:intern_task/views/chatUsersScreen/user_list.dart';

class AuthenticationWrapper extends StatefulWidget {
  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();

  bool emailValidation(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: deviceHeight / 3,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  child: Image(
                    image: AssetImage("assets/logo.png"),
                  ),
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              TextFormField(
                                controller: _emailController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "Field should not be empty";
                                  } else if (!emailValidation(
                                      _emailController.text)) {
                                    return "Invalid email";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: "EMAIL ADDRESS",
                                  labelStyle: kFormLabelStyle,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Column(
                                children: [
                                  TextFormField(
                                    validator: (value) {
                                      return value.isEmpty
                                          ? "Field Should not be empty"
                                          : value.length <= 8
                                              ? "Password must contain minimum 8 Characters"
                                              : null;
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: "ENTER PASSWORD",
                                      labelStyle: kFormLabelStyle,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Spacer(),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 30.0,
                                          child: Center(
                                            child: Text(
                                              "Forgot Password",
                                              style: TextStyle(
                                                color: kMainColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          termsText(),
                          SizedBox(
                            height: 30.0,
                          ),
                          authButton(() {
                            if (_formKey.currentState.validate()) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => UserList()));
                            }
                          }, "Login"),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Divider(
                                color: kMainColor,
                              )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "OR",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      letterSpacing: 2.0),
                                ),
                              ),
                              Expanded(
                                  child: Divider(
                                color: kMainColor,
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          authButton(() {}, "Create an Account"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
