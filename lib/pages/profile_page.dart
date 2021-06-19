import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:karma_login/constants/colors.dart';
import 'package:karma_login/widgets/background.dart';
import 'package:karma_login/widgets/text_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MyColor.orange,
      body: Stack(
        children: [
          CustomBackground(size: size),
          Positioned(
            top: 60,
            right: 30,
            left: 30,
            child: Row(
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
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Profile',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(.3),
                  child: Center(
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * .15,
            left: 110,
            right: 110,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpixexid.com%2Fimg%2Ff3ag1chz-men-profile-headshot-portrait.jpeg%3Fw%3D1300&f=1&nofb=1',
              ),
            ),
          ),
          Positioned(
            top: size.height * .38,
            left: 1,
            right: 1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LabelTextField(
                      text: 'Paul',
                      label: 'Name',
                    ),
                    LabelTextField(
                      text: '8959293251',
                      label: 'Phone Number',
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    LabelTextField(
                      text: 'New York',
                      label: 'Loaction',
                    ),
                    LabelTextField(
                      text: 'Football',
                      label: 'Intrest',
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(
                        'Notifications',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: FlutterSwitch(
                        borderRadius: 5,
                        activeColor: MyColor.orange,
                        toggleColor: Colors.orange.shade700,
                        showOnOff: true,
                        onToggle: (bool value) {},
                        value: true,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
