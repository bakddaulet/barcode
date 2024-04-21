import 'package:barcode/core/injection/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await initDepencies();

  runApp(BarCodeApp());
}
