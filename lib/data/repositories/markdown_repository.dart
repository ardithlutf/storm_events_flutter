import 'package:flutter/services.dart' show rootBundle;

import '../../constants.dart';

class MarkdownRepository {
  Future<String> get(String FiturId) async {
    var path = '$markdownPath$FiturId.md';
    var markdownString = await rootBundle.loadString(path);

    return markdownString;
  }
}
