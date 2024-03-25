import 'package:flutter/material.dart';
import 'package:justice_bridge/authenticate/authenticate.dart';
import 'package:justice_bridge/pages/home.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
// import 'package:techcurious/pages/home.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<Users?>(context);
    // print(user);
    if(user== null)
      return Authenticate();
    else
      return Home();
  }
}

