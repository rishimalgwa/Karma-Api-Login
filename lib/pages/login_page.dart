import 'package:flutter/material.dart';
import 'package:karma_login/apis/api_service.dart';
import 'package:karma_login/constants/colors.dart';
import 'package:karma_login/models/request.dart';
import 'package:karma_login/pages/home_page.dart';
import 'package:karma_login/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  late SharedPreferences prefs;

  LoginApiService apiService = LoginApiService();
  late TextEditingController emailController, passwordController;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: size.height * .3,
                  width: size.width,
                  child: Image.asset(
                    'images/semicircle.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  height: size.height * .7,
                ),
              ],
            ),
            Positioned(
              top: size.height * .1,
              left: 8,
              right: 8,
              child: Column(
                children: [
                  Text(
                    'KARMA',
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  ),
                  // Divider(
                  //   color: Colors.white,
                  //   thickness: .5,
                  // ),
                  Text(
                    'UNITING POWER',
                    style: TextStyle(fontSize: 9, color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height * .4,
              left: 25,
              right: 25,
              child: Column(
                children: [
                  CustomTextField(
                    hint: 'Email',
                    controller: emailController,
                  ),
                  SizedBox(height: 50),
                  CustomTextField(
                    hint: 'Password',
                    isPassword: true,
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.w700),
                      )),
                  SizedBox(
                    height: size.height * .17,
                  ),
                  MaterialButton(
                    minWidth: 155,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () async {
                      LoginRequestModel req = LoginRequestModel(
                          email: emailController.text,
                          password: passwordController.text);
                      try {
                        var res = await apiService.login(req);
                        if (res.token != '') {
                          prefs = await SharedPreferences.getInstance();
                          prefs.setString('userToken', res.token);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage(
                                        token: res.token,
                                      )));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text(res.error)));
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    color: MyColor.loghtGreen,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Not a memeber yet?',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          )),
                      Text(' Click Here',
                          style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
