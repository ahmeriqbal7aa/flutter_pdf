import 'package:flutter/material.dart';
// import 'package:pdf_flutter/pdf_flutter.dart';
// import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

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
  final doc = pw.Document();
  //TODO Create PDF document
  void generatePdf() async {
    // ================== Create a doc ========================== //
    doc.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('This is dummy PDF document',
                style: pw.TextStyle(fontSize: 50.0)),
          ); // Center
        },
      ),
    ); // Page
    // =============== Write doc in a file ======================== //
    final output = await getExternalStorageDirectory();
    // File outputFile = File(output.path + '/example.pdf');
    // also we can write above line of code as see below
    String pathToWrite = output.path + '/example.pdf';
    File outputFile = File(pathToWrite);
    outputFile.writeAsBytesSync(doc.save());

    // ======== print "outputFile" to view path where file is saved ====== //
    // print(outputFile);
    // also we can write as see below
    // ======== print "pathToWrite" to view path where file is saved ====== //
    print(pathToWrite);
    print('Saved');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter PDF'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: generatePdf,
              child: Text('Generate PDF'),
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////
//TODO Read Online
/*child: PDF.network(
  "http://www.africau.edu/images/default/sample.pdf",
  height: 400,
  width: 250,
),*/
//////////////////////////////////////////////////////////////////
//TODO Read from Assets
/*child: PDF.assets(
'assets/sample.pdf',
height: 400,
width: 250,
),*/
///////////////////////////////////////////////////////////////////
//TODO Read from File(External Storage)
/*class _HomePageState extends State<HomePage> {
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
}*/
