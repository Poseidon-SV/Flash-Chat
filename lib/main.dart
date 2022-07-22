import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

/// Static it's direct way to call without calling whole class'()' for just [1 thing (is way to name a route)
/// Animation(Hero animation)
    /// It transition one image to another screen with a floating animation
    /// requires: 2 tags(same)(takes a string) on 2 diff screens(no limits)
/// Animation(custom)
    /// Requires: A Ticker; Animation Control; An Animation Value
      /// A Ticker: It's like frames for animation(it ticks and something new renders due to set state)
      /// Animation Controller: Manger of the animation(tells to Start, stop, forward or reverse, loop or foe how long)
      ///IMPORTANT Animation Value: It's the thing which actually does the animation(Value: 0 to 1)
/// Animation (Steps)
    /// 1st Make an variable (AnimationController anyName;)
    /// 2nd create an init state to initialize the AnimationController Property /// Change the State into ticker provider
    /// 3rd for start the animation Controller.forward(); and addListener((){setState((){});}); to Know the value of the controller
    /// Curved Animation for varying the time of value change in between
      /// /// For Animation to loop
    ///  @override
    ///  void dispose() { /// TO kill our animation as soon this screen is gone
    //     controller.dispose();
    //     super.dispose();
    //   }
    /// Animation Tween(Color Tween)(begin: value, end: value).animation(controller);

/// (For robot)Mixins : It enable your class with multiple type of abilities from different classes (not bother by its parent or chile)
  ///  Its a way of reusing a class's code in multiple class hierarchies
///  Pre Package animation (animated_text_kit: ^4.2.2 and more)
  // Pre-packaged Animations: Flutter Sequence Animation
  // Pre-packaged Animations: Rubber
  // Pre-packaged Animations: Sprung
/// Refactoring (import 'package:flash_chat/components/rounded_button.dart';)[kTextFieldDecoration.copyWith(hintText: '')
    /// .copyWith() to change a specific property of constant or method
///
/// Firebase
/// 1st create a project
/// 2nd add Firebase to app
/// For Android:
    /// Click on Android Icon in Your Project and do as instructed
    /// Android package name(android/app/build.gradle{ [AND ADD DOWNLOADED FOLDER HERE(IN APP FOLDER)
        /// defaultConfig {
        ///         applicationId "com.shubham_verma.flash_chat"}
    ///         }) Change it so it's a unique ID
    ///  Now in [Android/build.gradle add [classpath 'com.google.gms:google-services:4.3.13'
    ///  then in [android/app/build.gradle add [apply plugin: 'com.google.gms.google-services'[implementation platform('com.google.firebase:firebase-bom:30.2.0')[implementation 'com.google.firebase:firebase-analytics'
    ///  Done Just the app for once
/// For IOS: click on 'Add app'
    /// You need a Mac or apple computer and Xcode install in it
    /// open IOS/Runner(in Finder(File Explorer)
    ///  open up this Runner.scodeproj.
        // So it's the one that has a blue icon rather than the one that has a white icon.
    /// After that click on blue ICON Runner having general Settings
    /// bundle identifier: (Change it make it unique and Paste it as instructed )
    /// Continue(add to xcode directly)
    /// So now the next step of setting up a Firebase involves CocoaPods. And because we're using Flutter, it's
    // actually going to do this for us automatically.
    // So we don't actually need to perform any of these commands.
    /// Done
/// 182. Firebase Flutter Packages Setup (iOS & Android)
/// We'll use only firebase_auth and cloud_firestore in it
/// 1st always install firebase_core to use any firebase packges
//   firebase_core: ^1.19.1
//   firebase_auth: ^3.4.1
//   cloud_firestore: ^3.2.1
/// Now Ios time (Skip if using windows)
///
/// Let's use firebase
/// From Registraion_Screen input is required
/// 1st create String email and password and set to TextField Value(textAlign.center)
/// 2nd take output form registration onPressed
  /// For Password security
    // obscureText: true,
  /// For Email
    // keyboardType: TextInputType.emailAddress,
/// Now import firebase packages
  /// 1st import 'package:firebase_auth/firebase_auth.dart';
  /// 2nd final _auth = FirebaseAuth.instance; create variable
  /// 3rd final newUser = _auth.createUserWithEmailAndPassword in onPressed of registration and make it async and await
  /// 4th after registration push the user to chat_screen with login username
/// Chat_screen (print email user for current user)
  /// import auth package and create instance (final _auth = FirebaseAuth.instance; )
  /// create method getCurrentUser() to get the email of user
  /// and trigger it by init state(){}
  /// Now enable the auth form Firebase project by Build/Authentication/Sign-in method(Email-pass Enable)
  /// Now Run and check the user Firebase project by Build/Authentication/Users
  /// Before running to initialize the app from below method __
 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}
/// ______
/// Now Login_Screen
  /// import auth package and instance of '_auth', var of email and pass for TextField
  /// [SignIn then for login onPressed method create user = _auth.signInWithEmailAndPassword(email: email, password: password)
/// Chat_Screen logout onPressed of cross icon button
  //  _auth.signOut();
  //  Navigator.pop(context);

/// Loading indicator between screen change()package
  /// model_progress_hud(Registration_screen)
  /// make a bool and set it to false then wrap our body of scaffold with ModalProgressHUD widget
  /// add required: inAsyncCall: showSpinner,
  /// setState((){showSpinner = true;}); in the register onPressed
  /// Now add the spinner for loading screen (Need to add/remove 'Run → Edit Configurations → Add Additional Run args → --no-sound-null-safety')

/// Chat_screen Chatting system
  /// Firebase project Build/Firebase Database/create database then Enable
  /// Cloud Firestore click on Start Collection(It's like Excel spread sheets)
  /// we can add data through the firebase database but now we are going to do it with the app:
  /// Chat_screen import import 'package:cloud_firestore/cloud_firestore.dart';
  /// Save the message in String called messageText in message textfield
  /// Now let the user send data by clicking Send button
  /// creating _firestore just like _auth instance
  /// Send button onPressed: () {
//                     //Implement send functionality.
//                     _firestore.collection('messages').add({
//                       'text': messageText,
//                       'sender': loggedInUser.email,
//                     });

/// Now use the send data from database to populate our app
  ///(It needs to be called when ever we need data) create method> void getMessages() // IT's not good way to see messages SO
  ///(It is called whenever data is update)_firestore.collection('messages').snapshots() Triggers a rerun and act like WhatsApp messanger
/// Stream (bamboo noodle stream from japan)
/// Now lets conv stream into widget to show as messages
  /// StreamBuilder (use setState) in Widget Children above Send text Widget
/// MessageBubble and ListView(Scroll function) to decorate our messages
/// Tired X(
/// Security rules from Firebase project
    /// https://firebase.google.com/docs/firestore/security/get-started
  /// Build/Firestore Database/Rules And you can simulate also to check the auth
/// The END 13-07-2020
/// deleted my notes(LIB) file raat bhr jagna(RE-WRITE) so much chaos X( X( X(
/// Sleep is nesc From 194. Tip from Angela - Sleep is My Secret Weapon

// void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: WelcomeScreen(),
      /// OR
      initialRoute: WelcomeScreen.id,
      routes: { /// It's for namedRoute
        // 'welcome_screen': (context) => WelcomeScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
