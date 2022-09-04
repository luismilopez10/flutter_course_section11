import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seccion11_fluttercourse/providers/theme_provider.dart';
import 'package:seccion11_fluttercourse/screens/screens.dart';
import 'package:seccion11_fluttercourse/share_preferences/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(isDarkmode: Preferences.isDarkmode),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: HomeScreen.routerHome,
      routes: {
        HomeScreen.routerHome: (_) => const HomeScreen(),
        SettingsScreen.routerHome: (_) => const SettingsScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
