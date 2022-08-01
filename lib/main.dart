import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:my_page/about/about_section.dart';
import 'package:my_page/knowledge/knowledge_section.dart';
import 'package:my_page/timeline/timeline_section.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('pt', 'BR')],
        path: 'assets/translations',
        // <-- change the path of the translation files
        fallbackLocale: Locale('pt', 'BR'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  AdaptiveThemeMode initialTheme;

  MyApp() {
    initTheme();
  }

  initTheme() async {
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    initialTheme = savedThemeMode ?? AdaptiveThemeMode.light;
    return initialTheme;
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          accentColor: Colors.green,
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          accentColor: Colors.green,
        ),
        initial: initialTheme,
        builder: (theme, darkTheme) => MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: 'title'.tr(),
              theme: theme,
              darkTheme: darkTheme,
              home: HomePage(),
            ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AdaptiveTheme.of(context).mode.isDark
            ? Colors.blue.shade200
            : Colors.black87,
        child: AdaptiveTheme.of(context).mode.isDark
            ? Icon(
                Icons.wb_sunny_sharp,
                color: Colors.yellow,
              )
            : Icon(
                Icons.nights_stay,
                color: Colors.yellow,
              ),
        onPressed: () => {
          AdaptiveTheme.of(context).toggleThemeMode(),
          persistTheme(context)
        },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              AboutSection(),
              KnowledgeSection(),
              TimeLineSection(),
            ],
          ),
        ),
      ),
    );
  }

  persistTheme(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    AdaptiveTheme.of(context).persist();
  }
}
