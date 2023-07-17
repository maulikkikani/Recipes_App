import 'dart:js';

import 'package:collection_of_recipes_flutter_app/views/screens/spleshscreen.dart';
import 'package:flutter/material.dart';
import 'package:collection_of_recipes_flutter_app/views/screens/homepage.dart';
import 'package:collection_of_recipes_flutter_app/views/screens/introscreens.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Controllers/ThemedetaProvider.dart';
import 'Globals/Globalfile.dart';
import 'models/Themedatemodel.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences Pref = await SharedPreferences.getInstance();

  bool isDark = Pref.getBool('isDark') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) =>
                Theme_Provider(m1: Theme_Model(isDark: isDark))),
      ],
      builder: (context,_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Globals.ligth_Theme,
        darkTheme: Globals.dark_Theme,
        themeMode: (Provider.of<Theme_Provider>(context).m1.isDark)
            ? ThemeMode.dark
            : ThemeMode.light,
        initialRoute: 'splashscreen',
        routes: {
          '/' : (context)=> homepage(),
          'spleshscreen' : (context)=> spleshscreen(),
          'introscreens': (context) => introscreens(),
        },
      ),
    ),
  );
}

