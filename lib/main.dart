import 'package:bmi_calculator/model/theme_changer.dart';
import 'package:bmi_calculator/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/state_data.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(
    sharedPreferences: sharedPreferences,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.sharedPreferences});
  final SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StateData()),
        ChangeNotifierProvider<ThemeChanger>(
          create: (_) => ThemeChanger(sharedPreferences),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final themeService = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeService.darkTheme
                ? MyTheme.lightTheme(context)
                : MyTheme.darkTheme(context),
            home: HomePage(),
          );
        },
      ),
    );
  }
}
