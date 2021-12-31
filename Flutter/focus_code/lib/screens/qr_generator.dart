import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:focus_code/theme/app_theme.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
  
class QrGenerator extends StatefulWidget {
  
  const QrGenerator({Key? key}) : super(key: key);

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {

  final ScreenshotController _screenshotController = ScreenshotController();
  final TextEditingController _inputQRTextCtrl = TextEditingController();
  bool _isGeneratedQR = false;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all( 15 ),
          child: Column(
            children: [
              _qrTextField(),
              const SizedBox( height: 20 ),
              _buttonsContainer(),
              const SizedBox( height: 20 ),
              if( _isGeneratedQR )
                _QRImage(
                  screenshotController: _screenshotController,
                  inputQRTextCtrl: _inputQRTextCtrl,
                )
              else
                Image.asset(
                  'assets/images/qr_placeholder.png',
                  width: deviceWidth * 0.75,
                  height: deviceWidth * 0.75,
                )
            ],
          ),
        )
      ),
    );
  }

  Widget _qrTextField() {
    return TextField(
      controller: _inputQRTextCtrl,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: const Icon( Icons.qr_code_2 ),
        label: const Text('Ingrese el texto'),
        suffixIcon: IconButton(
          splashRadius: 22,
          icon: const Icon( Icons.clear ),
          onPressed: () {
            _inputQRTextCtrl.clear();
            setState(() => _isGeneratedQR = false);
          },
        )
      ),
    );
  }

  Widget _buttonsContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _GeneratorButton(
          title: 'Generar código',
          onPressed: _generateCode
        ),
        const SizedBox( width: 10 ),
        _GeneratorButton(
          title: 'Compartir código',
          onPressed: _isGeneratedQR ? _takeScreenshot : null,
        ),
      ],
    );
  }

  void _generateCode() {
    if( _inputQRTextCtrl.text.isNotEmpty ) {
      FocusScope.of(context).unfocus();
      return setState(() => _isGeneratedQR = true);
    }

    ScaffoldMessenger.of(context).showSnackBar( 
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Error, por favor ingrese un texto', style: TextStyle( color: Colors.white) ),
      )
    );
  }

  void _takeScreenshot() async {
    
    final imageFile = await _screenshotController.capture();
    
    if( imageFile == null ) return;

    String tempPath = (await getTemporaryDirectory()).path;
    File file = File('$tempPath/image.png');
    await file.writeAsBytes(imageFile);
    await Share.shareFiles([file.path], text: "Te comparto el código que generé con Focus Code");

  }
}


  

class _QRImage extends StatelessWidget {
  const _QRImage({
    Key? key,
    required ScreenshotController screenshotController,
    required TextEditingController inputQRTextCtrl,
  }) : _screenshotController = screenshotController, _inputQRTextCtrl = inputQRTextCtrl, super(key: key);

  final ScreenshotController _screenshotController;
  final TextEditingController _inputQRTextCtrl;

  @override
  Widget build(BuildContext context) {
    
    final deviceWidth = MediaQuery.of(context).size.width;

    return Screenshot(
      controller: _screenshotController,
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
          data: _inputQRTextCtrl.text,
          size: deviceWidth * 0.65,
        ),
      ),
    );
  }
}

class _GeneratorButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const _GeneratorButton({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: AppTheme.primaryColor,
      disabledColor: Colors.grey,
      child: Text(title, style: const TextStyle( color: Colors.white ),),
      onPressed: onPressed,
    );
  }
}