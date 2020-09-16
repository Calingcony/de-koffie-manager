import 'package:de_koffie_manager/models/simple_user.dart';
import 'package:de_koffie_manager/screens/authenticate/authenticate.dart';
import 'package:de_koffie_manager/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<SimpleUser>(context);

    if (user == null) {
      return Authenticate();
    }

    return Home();
  }
}
