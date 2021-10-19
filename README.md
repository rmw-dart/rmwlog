<!-- 本文件由 ./readme.make.md 自动生成，请不要直接修改此文件 -->

# rmwlog

simple log , can custom log output function

## use

```dart
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
  loge('xxx', Exception(1234));
  await Future.delayed(Duration(seconds: 1));
  log(123);
}

```
