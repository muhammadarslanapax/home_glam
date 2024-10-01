extension NullableStringIsNullOrEmptyExtension on String? {
  /// Checks if the `String` is Blank (null, empty or only white spaces).
  bool get isBlank => this?.trim().isEmpty ?? true;

  /// Checks if the `String` is not blank (null, empty or only white spaces).
  bool get isNotBlank => isBlank == false;

  bool get isNotNullOrEmpty => this != null && this!.isNotEmpty;
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isUrl => Uri.parse(this!).isAbsolute;

  String capitalize() {
    return "${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}";
  }

  String? after(String pattern) {
    if (isBlank) {
      return this;
    }

    if (!this!.contains(pattern)) {
      return '';
    }

    final List<String> patternWords = pattern.split(' ');

    if (patternWords.isEmpty) {
      return '';
    }
    final int indexOfLastPatternWord = this!.indexOf(patternWords.last);

    if (patternWords.last.isEmpty) {
      return '';
    }

    return this!.substring(indexOfLastPatternWord + patternWords.last.length, this!.length);
  }

  bool isVideo(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".mp4") ||
        ext.endsWith(".avi") ||
        ext.endsWith(".wmv") ||
        ext.endsWith(".rmvb") ||
        ext.endsWith(".mpg") ||
        ext.endsWith(".mpeg") ||
        ext.endsWith(".3gp");
  }

  /// Checks if string is an audio file.
  bool isAudio(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".mp3") || ext.endsWith(".wav") || ext.endsWith(".wma") || ext.endsWith(".amr") || ext.endsWith(".ogg");
  }

  /// Checks if string is an image file.
  bool isImage(String filePath) {
    final ext = filePath.toLowerCase();

    return ext.endsWith(".jpg") || ext.endsWith(".jpeg") || ext.endsWith(".png") || ext.endsWith(".gif") || ext.endsWith(".bmp");
  }
}
