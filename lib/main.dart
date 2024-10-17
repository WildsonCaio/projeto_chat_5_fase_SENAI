import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_5/firebase_options.dart';
import 'package:flutter_application_5/views/detail_page.dart';
import 'package:flutter_application_5/views/feedback_page.dart';
import 'package:flutter_application_5/views/home_page.dart';
import 'package:flutter_application_5/views/login_page.dart';
import 'package:flutter_application_5/views/register_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.dmSans().fontFamily,
        useMaterial3: false
      ),
      initialRoute: 'feedback',
      routes: {
        '/':(context)=>HomePage(),
        'login':(context)=>LoginPage(),
        'register':(context)=>RegisterPage(),
        'feedback':(context)=>FeedbackPage(),
      },
    ),
  );
}
