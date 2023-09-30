import 'package:flutter/material.dart';
import 'package:newsapp/view/home.dart';
import 'package:newsapp/view/splash.dart';

void main() => 
runApp(MaterialApp(
  title: 'News App',
  debugShowCheckedModeBanner:false,
  home: SplashScreen(),
));