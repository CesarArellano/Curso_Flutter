import 'package:flutter/material.dart';

import 'package:screenshot/screenshot.dart' show ScreenshotController;

import 'package:focus_code/theme/app_theme.dart';
import 'package:focus_code/widgets/widgets.dart';
import 'package:focus_code/helpers/helpers.dart';
  
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
    final size = (deviceWidth > 800) ? deviceWidth * 0.35 : deviceWidth * 0.75; 
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric( horizontal: 20 ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox( height: 20 ),
              _qrTextField(),
              const SizedBox( height: 20 ),
              _buttonsContainer(),
              const SizedBox( height: 20 ),
              if( _isGeneratedQR )
                CustomQRImage(
                  screenshotController: _screenshotController,
                  qrValue: _inputQRTextCtrl.text,
                )
              else
                Image.asset(
                  'assets/images/qr_placeholder.png',
                  width: size,
                  height: size,
                )
            ],
          ),
        ),
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
        CustomButton(
          title: 'Generar código',
          onPressed: _generateCode
        ),
        const SizedBox( width: 10 ),
        CustomButton(
          title: 'Compartir código',
          onPressed: _isGeneratedQR ? () => takeScreenshot( _screenshotController ) : null,
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

}