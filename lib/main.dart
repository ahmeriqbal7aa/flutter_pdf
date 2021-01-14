import 'package:flutter/material.dart';
import 'package:pdf_flutter/pdf_flutter.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/pdf.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter PDF'),
      ),
      body: Center(
        child: file != null
            ? PDF.file(file, height: 400, width: 250)
            : RaisedButton(
                onPressed: () async {
                  File pickedFile = await FilePicker.getFile(
                    type: FileType.custom,
                    allowedExtensions: ['pdf', 'doc'],
                  );
                  setState(() {
                    file = pickedFile;
                  });
                },
                child: Text('Grab a File'),
              ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////
//TODO Read Online
// child: PDF.network(
//   "http://www.africau.edu/images/default/sample.pdf",
//   height: 400,
//   width: 250,
// ),
//////////////////////////////////////////////////////////////////
//TODO Read from Assets
// child: PDF.assets(
// 'assets/sample.pdf',
// height: 400,
// width: 250,
// ),
