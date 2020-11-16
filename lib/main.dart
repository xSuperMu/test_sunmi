import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sunmi_printer/flutter_sunmi_printer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'سن مي',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'إختبار الطابعة سن مي'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() async {
    SunmiPrinter.hr(); // prints a full width separator
    SunmiPrinter.text(
      'إختبار الطابعة سن مي',
      styles: SunmiStyles(align: SunmiAlign.center),
    );
    SunmiPrinter.hr();

// Test align
    SunmiPrinter.text(
      'اليسار',
      styles: SunmiStyles(bold: true, underline: true),
    );
    SunmiPrinter.text(
      'المنتصف',
      styles:
          SunmiStyles(bold: true, underline: true, align: SunmiAlign.center),
    );
    SunmiPrinter.text(
      'اليمين',
      styles: SunmiStyles(bold: true, underline: true, align: SunmiAlign.right),
    );

// Test text size
    SunmiPrinter.text('نص صغير جدا', styles: SunmiStyles(size: SunmiSize.xs));
    SunmiPrinter.text('نص متوسط', styles: SunmiStyles(size: SunmiSize.md));
    SunmiPrinter.text('نص كبير', styles: SunmiStyles(size: SunmiSize.lg));
    SunmiPrinter.text('نص كبير جدا', styles: SunmiStyles(size: SunmiSize.xl));

// Test row
    SunmiPrinter.row(
      cols: [
        SunmiCol(text: 'عمود ١', width: 4),
        SunmiCol(text: 'عمود ٢', width: 4, align: SunmiAlign.center),
        SunmiCol(text: 'عمود ٣', width: 4, align: SunmiAlign.right),
      ],
    );

// Test image
    ByteData bytes = await rootBundle.load('assets/logo.jpg');
    final buffer = bytes.buffer;
    final imgData = base64.encode(Uint8List.view(buffer));
    SunmiPrinter.image(imgData);

    SunmiPrinter.emptyLines(3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
