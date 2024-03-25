import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:justice_bridge/models/user.dart';
import 'package:justice_bridge/pages/abuse.dart';
import 'package:justice_bridge/pages/home.dart';
import 'package:justice_bridge/pages/bot.dart';
import 'package:justice_bridge/pages/lawyer_dash.dart';
import 'package:justice_bridge/pages/register.dart';
import 'package:justice_bridge/pages/lawyer.dart';
import 'package:justice_bridge/pages/login.dart';
import 'package:justice_bridge/pages/track.dart';
import 'package:justice_bridge/pages/rehab.dart';
import 'package:justice_bridge/pages/status.dart';
import 'package:justice_bridge/services/auth.dart';
import 'package:justice_bridge/services/wrapper.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users?>.value(
      initialData: null,
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/wrapper',
        routes: {
          '/':(context)=>const Login(),
          '/wrapper':(context)=>const Wrapper(),
          '/home': (context)=> const Home(),
          '/status': (context)=> const Status(),
          '/lawyer': (context)=> const Lawyer(),
          '/bot': (context)=>const Bot(),
          '/register': (context)=>const Register(),
          '/rehab': (context)=> const Rehab(),
          '/abuse': (context)=> const Abuse(),
          '/lawyerdash': (context) => LawyerDashboard(),
          '/track': (context) => MapsPage(),
        },
      ),
    );
  }
}
