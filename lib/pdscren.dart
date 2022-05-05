import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class Pdfviewr extends StatelessWidget {

final String path;
Pdfviewr({this.path});
  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(

      path: path,
    );
  }
}
