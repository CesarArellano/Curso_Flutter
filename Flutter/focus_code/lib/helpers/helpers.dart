import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

void takeScreenshot(ScreenshotController controller) async {
  final imageFile = await controller.capture();
  
  if( imageFile == null ) return;

  String tempPath = (await getTemporaryDirectory()).path;
  File file = File('$tempPath/image.png');
  await file.writeAsBytes(imageFile);
  await Share.shareXFiles([XFile(file.path)], text: "Te comparto el código que generé con Focus Code");
}

void shareContent(String content) async {
  await Share.share(content);
}