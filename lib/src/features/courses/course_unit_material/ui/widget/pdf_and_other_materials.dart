import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../../constants/app_colors.dart';

class PdfAndOtherMaterials extends StatefulWidget {
  const PdfAndOtherMaterials({Key? key, required this.file}) : super(key: key);
  final String file;

  @override
  State<PdfAndOtherMaterials> createState() => _PdfAndOtherMaterialsState();
}

class _PdfAndOtherMaterialsState extends State<PdfAndOtherMaterials> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: 450,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.gray200,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
          color: AppColors.gray200.withOpacity(0.1),
        ),
        child: Semantics(
          explicitChildNodes: true,
          enabled: true,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 425,
                  child: SfPdfViewer.memory(
                    onPageChanged: (details) {
                      //details.newPageNumber
                    },
                    base64Decode(widget.file),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
