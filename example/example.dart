import 'package:rmwlog/config.dart' show logConfig;
import 'dart:io';
import 'package:rmwlog/init.dart';

void main() {
  // 可以使用自定义的输出函数
  logConfig[1] = (stack, prefix, msg) {
    stderr.write((stack ?? '') + " :\n" + prefix + msg + '\n');
  };
  log('version', 1.0);
  logw('警告');
  loge('奇怪的错误', Exception(1234));
}
