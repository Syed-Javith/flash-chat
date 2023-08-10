import 'package:app_dev_11_flash_chat_flutter/screens/login_screen.dart';
import 'package:app_dev_11_flash_chat_flutter/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_dev_11_flash_chat_flutter/components/WelcomeScreenIcon.dart';

class WelcomeScreen extends StatefulWidget {
  static var id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // static String id = 'welcome_screen';
  late AnimationController controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 5), // upperBound: 1
  );
  late Animation curvedAnimation =
      CurvedAnimation(parent: controller, curve: Curves.decelerate);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // controller =
    curvedAnimation =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);
    controller.forward();
    //controller.reverse(from:);

    controller.addStatusListener((status) {
      // print(status);
    });

    controller.addListener(() {
      setState(() {
        // curvedAnimation =
        print(curvedAnimation.value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: curvedAnimation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                Text(
                  '${controller.value.toInt() * 100}',
                  style: TextStyle(
                    fontSize: 45.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            WelcomeScreenIcons(
                text: 'login',
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }));
                },
                color: Colors.lightBlueAccent),
            WelcomeScreenIcons(
                text: 'register',
                onPress: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RegistrationScreen();
                  })
                  );
                },
                color: Colors.blueAccent),
          ],
        ),
      ),
    );
  }
}
