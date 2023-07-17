import 'package:flutter/widgets.dart';

import 'package:shared_preferences/shared_preferences.dart';

//import 'package:departure_code/Models/Themedatemodel.dart';

import '../models/Themedatemodel.dart';

class Theme_Provider extends ChangeNotifier {

  Theme_Model m1;

  Theme_Provider({required this.m1});

  changeTheme() async{

    m1.isDark = !m1.isDark;

    SharedPreferences Pref = await SharedPreferences.getInstance();

    await Pref.setBool('isDark', m1.isDark);

    notifyListeners();
  }
}