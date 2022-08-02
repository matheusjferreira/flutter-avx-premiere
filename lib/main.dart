import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ByteData data = await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
