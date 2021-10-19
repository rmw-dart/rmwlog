import 'dart:io';
import 'package:rmwlog/init.dart';

// import if you need custom output function
import 'package:rmwlog/config.dart' show logConfig;

void main() async {
  // can use custom output function
  logConfig[1] = (stack, msg) {
    stderr.write(stack + " :\n💀" + msg + '\n');
  };

  log('version', 1.0);
  logw('warning');
  for (var i = 0; i < 3; ++i) {
    loge('something happended', Exception(i));
  }
  await Future.delayed(Duration(seconds: 1));
  log(123);
}
