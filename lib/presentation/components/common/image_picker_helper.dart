import 'dart:io';

import 'package:exif/exif.dart';
import 'package:fimber/fimber.dart';
import 'package:image/image.dart' as img;
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

Future<String?> getLostData(ImagePicker picker) async {
  final LostDataResponse response = await picker.retrieveLostData();
  if (response.isEmpty) {
    return '';
  }
  if (response.file != null) {
    return response.file?.path;
  }
  return null;
}

Future<List<String>?> getImagesPath(List<XFile> files) async {
  List<String?> compressedPaths =
      await Future.wait(files.map((i) => getImagePath(i)));
  return compressedPaths.map((e) => e.toString()).toList();
}

CompressFormat determineCompressionFormat(String path) {
  switch (path.split('.').last) {
    case 'webp':
      return CompressFormat.webp;
    case 'heic':
      return CompressFormat.heic;
    case 'png':
      return CompressFormat.png;
    default:
      return CompressFormat.jpeg;
  }
}

Future<XFile?> compressFile(String path) async {
  try {
    return FlutterImageCompress.compressAndGetFile(
      path,
      getCompressedPath(path),
      minWidth: 680,
      minHeight: 480,
      format: determineCompressionFormat(path),
      quality: 70,
      autoCorrectionAngle: false,
    );
  } catch (error) {
    Fimber.e('There is Error in Compressing ', ex: error);
    return null;
  }
}

Future<String?> getImagePath(XFile file) async {
  //File? compressed = await compressFile(file.path);
  final rotatedFile = await getRotatedPath(file.path);
  final leg = await file.length();
  Fimber.d(
      "Compress ============================================================");

  Fimber.d('leg $leg');
  Fimber.d('rotate ${rotatedFile?.lengthSync()}');
  return rotatedFile?.path;
}

Future<File> getRotatedPathOld(String path) async {
  return await FlutterExifRotation.rotateImage(path: path);
}

Future<File?> getRotatedPath(String path) async {
  return fixExifRotation(path);
  /*final img.Image? capturedImage = img.decodeImage(await File(path).readAsBytes());
  if(capturedImage==null){
    return null;
  }else {
    //File rotatedImage =
    //await FlutterExifRotation.rotateImage(path: path);
    return fixExifRotation(path);
    //final img.Image orientedImage = img.bakeOrientation(capturedImage);
    //return await File(path).writeAsBytes(img.encodeJpg(orientedImage));
    //return await FlutterExifRotation.rotateImage(path: path);
  }*/
}

Future<File> fixExifRotation(String imagePath) async {
  final originalFile = File(imagePath);
  final imageBytes = await originalFile.readAsBytes();

  final originalImage = img.decodeImage(imageBytes);

  final height = originalImage?.height ?? 0;
  final width = originalImage?.width ?? 0;

  // Let's check for the image size
  // This will be true also for upside-down photos but it's ok for me
  if (height >= width) {
    // I'm interested in portrait photos so
    // I'll just return here
    return originalFile;
  }

  // We'll use the exif package to read exif data
  // This is map of several exif properties
  // Let's check 'Image Orientation'
  final exifData = await readExifFromBytes(imageBytes);

  img.Image fixedImage;
  print(exifData);
  if (height < width) {
    // rotate
    if (exifData['Image Orientation']!.printable.contains('Horizontal')) {
      fixedImage = img.copyRotate(originalImage!, angle: 90);
    } else if (exifData['Image Orientation']!.printable.contains('180')) {
      fixedImage = img.copyRotate(originalImage!, angle: -90);
    } else if (exifData['Image Orientation']!.printable.contains('CCW')) {
      fixedImage = img.copyRotate(originalImage!, angle: 180);
    } else {
      fixedImage = img.copyRotate(originalImage!, angle: 0);
    }
  } else {
    fixedImage = originalImage!;
  }

  // Here you can select whether you'd like to save it as png
  // or jpg with some compression
  // I choose jpg with 100% quality
  final fixedFile = await originalFile.writeAsBytes(img.encodeJpg(fixedImage));

  return fixedFile;
}

String getCompressedPath(String path) {
  final map = path.split('.');
  final removedExtMap = map.removeLast();
  String compressedPath = '';
  map.forEach((element) {
    compressedPath = '$compressedPath.$element';
  });
  compressedPath = '${compressedPath}_compressed.$removedExtMap';
  return compressedPath;
}
