import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FileHandel {
  File? file;

  Future<void> getFileFromPlatForm() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: false);
    
  }
}