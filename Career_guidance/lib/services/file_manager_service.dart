import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileManagerService {
  FileManagerService();

  Future<Directory> _tempDirectory() async {
    return getTemporaryDirectory();
  }

  Future<void> deleteFile(File? file) async {
    if (file == null) return;
    if (await file.exists()) {
      await file.delete();
    }
  }

  Future<void> deleteOldReports() async {
    final directory = await _tempDirectory();
    final files = directory.listSync();
    for (final entity in files) {
      if (entity is File && entity.path.endsWith('.pdf')) {
        await entity.delete();
      }
    }
  }

  Future<File> savePdfBytes(List<int> bytes, {String? fileName}) async {
    final directory = await _tempDirectory();
    final name = fileName ?? 'career_report_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final file = File('${directory.path}/$name');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
