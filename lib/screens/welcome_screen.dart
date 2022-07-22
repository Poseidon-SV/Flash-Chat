import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/constants.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  ///[static It's a modifier to modify the class to associated with class to make it more efficient

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  /// Change the State into ticker provider(Ticker[For multiple ticker)

  late AnimationController controller;
  late Animation animation;

  /// For Curved Aniamtion

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 2),

      ///It is Ticker provider
      vsync: this,

      ///upperBound = 100, //(Property) Instead of printing 1 it will give till 100 value
    );

    /// Animation Starts
    controller.forward();

    /// Animation Reverse
    // controller.reverse(from: 1.0); /// Goose form large to small (1-0) remove forward();

    ///Animation CURVE
    // animation = CurvedAnimation(parent: controller , curve: Curves.decelerate); ///(easeIn)Upper Bound Can't be grater than 1

    /// For Animation to loop
    // animation.addStatusListener((status) { /// Forward (Status = Completed)
    /// Reverse (Status = Dismissed);
    // if (status == AnimationStatus.completed){
    //   controller.reverse(from : 1.0);
    // } else if (status == AnimationStatus.dismissed){
    //   controller.forward();
    // }
    //
    // });

    /// For color tween
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.addListener(() {
      /// To know the value of the controller
      // print(controller.value);
      setState(() {});

      /// To Change
    });
  }

  @override
  void dispose() {
    /// TO kill our animation as soon this screen is gone
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white.withOpacity(controller.value),
      backgroundColor: animation.value,

      /// To change the color value
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

                    /// height: cantroller.value , Now the logo will grow in size form 0-100pix and stop
                    height: 60.0,
                  ),
                ),
                DefaultTextStyle(
                  /// '${contoller.value} %' Now it will be like loading screen till 0-100%
                  child: AnimatedTextKit(
                    animatedTexts: [TypewriterAnimatedText(' Flash Chat')],
                    repeatForever: true,
                  ),
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(buttonColor:Colors.lightBlueAccent, title: 'Log In', onPressed:() {
              Navigator.pushNamed(context, LoginScreen.id);
            }),
            RoundedButton(buttonColor: Colors.blueAccent, title:'Register',onPressed: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            }),
          ],
        ),
      ),
    );
  }
}


//Padding(
//       padding: EdgeInsets.symmetric(vertical: 16.0),
//       child: Material(
//         elevation: 5.0,
//         color: Colors.lightBlueAccent,
//         borderRadius: BorderRadius.circular(30.0),
//         child: MaterialButton(
//           onPressed: () {
//             //Go to login screen.
//             Navigator.pushNamed(context, LoginScreen.id);
//           },
//           minWidth: 200.0,
//           height: 42.0,
//           child: Text(
//             'Log In',
//           ),
//         ),
//       ),
//     );
