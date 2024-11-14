import 'package:flutter/material.dart';

import 'views/home_view.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const HomeView(),
    ));
