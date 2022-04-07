import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

enum ScreenSize { SMALL, MEDIUM_1, MEDIUM_2, LARGE }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize fetchScreenSizeInHeight(double height) {
      if (height < 600) {
        return ScreenSize.SMALL;
      } else if (height < 700 && height > 600) {
        return ScreenSize.MEDIUM_1;
      } else if (height < 800 && height > 700) {
        return ScreenSize.MEDIUM_2;
      } else {
        return ScreenSize.LARGE;
      }
    }

    double screenHeight = MediaQuery.of(context).size.height;
    ScreenSize screenSize = fetchScreenSizeInHeight(screenHeight);
    double setWidgetHeight(ScreenSize screenSize, BuildContext context,
        double small, double medium1, double medium2, double large) {
      switch (screenSize) {
        case ScreenSize.SMALL:
          return MediaQuery.of(context).size.height * small;
          break;
        case ScreenSize.MEDIUM_1:
          return MediaQuery.of(context).size.height * medium1;
          break;
        case ScreenSize.MEDIUM_2:
          return MediaQuery.of(context).size.height * medium2;
          break;
        case ScreenSize.LARGE:
          return MediaQuery.of(context).size.height * large;
          break;
      }
    }

    return Scaffold(
      body: Center(
        child: Container(
          height: setWidgetHeight(screenSize, context, 0.35, 0.3, 0.4, 0.3),
          alignment: Alignment.center,
          color: Colors.amber,
        ),
      ),
    );
  }
}
