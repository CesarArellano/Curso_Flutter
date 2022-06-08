import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class CustomQRImage extends StatelessWidget {
  
  final ScreenshotController screenshotController;
  final String qrValue;

  const CustomQRImage({
    Key? key,
    required this.screenshotController,
    required this.qrValue,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
    final deviceWidth = MediaQuery.of(context).size.width;
    final size = (deviceWidth > 600) ? deviceWidth * 0.25 : deviceWidth * 0.65;
    
    return Screenshot(
      controller: screenshotController,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              blurRadius: 10,
              color: Colors.black12
            )
          ]
        ),
        child: QrImage(
          data: qrValue,
          size: size,
        ),
      ),
    );
  }
}