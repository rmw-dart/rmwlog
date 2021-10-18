import 'dart:io';
import 'package:rmwlog/init.dart';

// import if you need custom output function
import 'package:rmwlog/config.dart' show logConfig;

void main() {
  // can use custom output function
  logConfig[1] = (stack, prefix, msg) {
    stderr.write((stack ?? '') + " :\n" + prefix + msg + '\n');
  };
  log('version', 1.0);
  logw('警告');
  loge('奇怪的错误', Exception(1234));
}
