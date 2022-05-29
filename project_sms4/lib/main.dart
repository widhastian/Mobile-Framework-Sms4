import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_sms4/SpashScreen.dart';
import 'package:project_sms4/page/profile_page.dart';
import 'package:project_sms4/themes.dart';
import 'package:project_sms4/utils/user_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

// void main() {
//   runApp(MaterialApp(
//     home: SplashScreenWidget(),
//   ));
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'GoFarm';

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return ThemeProvider(
      initTheme: user.isDarkMode ? MyThemes.darkTheme : MyThemes.lightTheme,
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: ThemeProvider(),
          title: title,
          home: SplashScreenWidget(),
        ),
      ),
    );
  }
}
