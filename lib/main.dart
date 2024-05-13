import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:misfits/controller/joinNotifier.dart';
import 'package:misfits/screens/MyHomePage.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => JoinNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  double fontSizeResolver(double fontSize, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scaledFontSize = (fontSize / 412) * screenWidth;

    return scaledFontSize;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 892),
      minTextAdapt: true,
      ensureScreenSize: true,
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        title: 'Misfits Assesment',
        home: MyHomePage(),
      ),
    );
  }
}
