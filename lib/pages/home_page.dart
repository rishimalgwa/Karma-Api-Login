import 'package:flutter/material.dart';
import 'package:karma_login/constants/colors.dart';
import 'package:karma_login/pages/profile_page.dart';
import 'package:karma_login/widgets/background.dart';
import 'package:karma_login/widgets/card.dart';
import 'package:karma_login/widgets/text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.token}) : super(key: key);
  final String? token;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.orange,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: CustomBackground(size: size),
          ),
          Positioned(
            top: 60,
            right: 30,
            left: 30,
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(.3),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.remove('userToken');
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Karma Drives',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 120,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                        child: Center(
                          child: Text(
                            'PROFILE',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()));
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SearchBar(),
              ],
            ),
          ),
          Positioned(
            bottom: 1,
            right: 1,
            left: 1,
            child: Container(
              padding: const EdgeInsets.all(8),
              height: size.height * .72,
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return DriveCard();
                  }),
            ),
          )
        ],
      ),
    );
  }
}
