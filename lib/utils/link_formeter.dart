// ignore_for_file: depend_on_referenced_packages

import 'package:home_glam/utils/string_extension.dart';
import 'package:path/path.dart' as p;

///Add domain for [url] : image, svga (frame, entrance effect, ...)
String formatFileUrl(String url) {
  if (url.isUrl) {
    return url;
  }
  return  url;
}

enum EUrlType { image, video, unkown }

class URLType {
  static final List<String> img = ['jpg', 'jpeg', 'jfif', 'pjpeg', 'pjp', 'png', 'svg', 'gif', 'apng', 'webp', 'avif'];

  static final List<String> video = [
    "3g2",
    "3gp",
    "aaf",
    "asf",
    "avchd",
    "avi",
    "drc",
    "flv",
    "m2v",
    "m3u8",
    "m4p",
    "m4v",
    "mkv",
    "mng",
    "mov",
    "mp2",
    "mp4",
    "mpe",
    "mpeg",
    "mpg",
    "mpv",
    "mxf",
    "nsv",
    "ogg",
    "ogv",
    "qt",
    "rm",
    "rmvb",
    "roq",
    "svi",
    "vob",
    "webm",
    "wmv",
    "yuv",
  ];

  static EUrlType getType(String url) {
    try {
      final Uri uri = Uri.parse(url);
      String extension = p.extension(uri.path).toLowerCase();
      if (extension.isEmpty) {
        return EUrlType.unkown;
      }

      extension = extension.split('.').last;
      if (img.contains(extension)) {
        return EUrlType.image;
      } else if (video.contains(extension)) {
        return EUrlType.video;
      }
    } catch (e) {
      return EUrlType.unkown;
    }
    return EUrlType.unkown;
  }
}
