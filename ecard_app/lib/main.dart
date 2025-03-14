import 'package:ecard_app/router/page_router.dart';
import 'package:ecard_app/screens/splash_screen.dart';
import 'package:ecard_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp , DeviceOrientation.portraitDown, DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight
  ]);

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isDarkMode = prefs.getBool("themeMode")?? false;
  runApp(EcardApp(isDarkMode: isDarkMode));
}

class EcardApp extends StatelessWidget{
  final bool isDarkMode;
  const EcardApp({super.key , required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent
      )
    );

    return ChangeNotifierProvider<ThemeNotifier>(
      create: (_)=>ThemeNotifier(isDarkMode),
      child: Consumer<ThemeNotifier>(builder: (context , theme , _){
          return MaterialApp(
            initialRoute: '/',
            onGenerateRoute: PageRouter.switchRoute,
            debugShowCheckedModeBanner: false,
            theme: AppThemeController.lightMode,
            darkTheme: AppThemeController.darkMode,
            home: SplashScreen(),
            themeMode: theme.isDarkMode ? ThemeMode.light : ThemeMode.dark,
          );
      }),
    );
  }
}

class ThemeNotifier extends ChangeNotifier{
  bool _isDarkMode;
  ThemeNotifier(this._isDarkMode);
  bool get isDarkMode => _isDarkMode;

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("themeMode", _isDarkMode);
  }
}