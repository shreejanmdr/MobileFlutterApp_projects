// import 'package:flutter/material.dart';
// import 'package:final_assignment/screens/login_screen.dart';
// import 'package:final_assignment/screens/register_screen.dart';
// import 'screens/splash_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'My App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SplashScreen(),
//       routes: {
//         '/login': (context) => LoginScreen(),
//         '/register': (context) => RegisterScreen(),
//       },
//     );
//   }
// }


import 'package:final_assignment/app/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const App(),
  );
}
