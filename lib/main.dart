import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:myapp/views/home_page.dart'; // Certifique-se de que o caminho está correto

void main() {
  runApp(
    DevicePreview(
      builder: (context) => const MyApp(),
      enabled: true, // Altere para false em produção
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context), // Pré-visualização de idioma
      builder: DevicePreview.appBuilder, // Pré-visualização de dispositivos
    );
  }
}
