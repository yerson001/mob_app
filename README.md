# mob_app
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:taskmanager/components/notification.dart';
//import 'package:taskmanager/database/db_helper.dart';
import 'package:provider/provider.dart';
import 'package:taskmanager/components/home_screen.dart';
import 'package:taskmanager/components/theme_notifier.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await DBHelper.initDb();
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    //NotificationServices().initNotification();
    tz.initializeTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.currentTheme,
      home: const MyHomePage(),
    );
  }
}


##theme
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishColor = Color(0xFF3832F9);
const Color yellowColor = Color.fromARGB(255, 156, 188, 12);
const Color pinkColor = Color(0xFFC8000A);
const Color greyColor = Color(0xFF9E9E9E);
const Color darkGreyColor = Color(0xFF151515);
const Color whiteColor = Color(0xFFFFFFFF);
const Color blackColor = Color(0xFF000000);
const primaryColor = bluishColor;

class Themes {
  static final light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      background: whiteColor,
    ),
    useMaterial3: true,
  );

  static final dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        background: blackColor,
        brightness: Brightness.dark),
    useMaterial3: true,
  );
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.grey[500],
  ));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w800,
  ));
}

TextStyle get titleStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ));
}

TextStyle get subTitleStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ));
}

## theme_notifier
import 'package:flutter/material.dart';
import 'package:taskmanager/components/theme.dart';

class ThemeNotifier with ChangeNotifier {
  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  ThemeData get currentTheme => _isDarkMode ? Themes.dark : Themes.light;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
##home_screen
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskmanager/components/theme.dart';
import 'package:taskmanager/components/theme_notifier.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Column(children: [
        _addDateBar(),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }

  _appBar(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return AppBar(
      leading: GestureDetector(
        onTap: () {
          themeNotifier.toggleTheme();
        },
        child: Icon(
          themeNotifier.isDarkMode ? Icons.light_mode : Icons.dark_mode,
          size: 23,
          color: Theme.of(context).colorScheme.inverseSurface,
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: const AssetImage("images/logo.png"),
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        const SizedBox(
          width: 20,
        )
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      // title: Text(widget.title),
    );
  }


  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(left: 5, top: 8),
      child: DatePicker(
        DateTime.now(),
        onDateChange: (selectedDate) {
          setState(() {
            //_selectedDate = DateFormat.yMMMEd().format(selectedDate);
          });
        },
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryColor,
        dateTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: greyColor,
        )),
        monthTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: greyColor,
        )),
        dayTextStyle: GoogleFonts.lato(
            textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: greyColor,
        )),
      ),
    );
  }

}



