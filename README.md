<!-- 本文件由 ./readme.make.md 自动生成，请不要直接修改此文件 -->

# rmwlog

http get or post with timeout ( default 60 seconds )

## use

```dart
import 'package:rmwlog/init.dart';

void main() async {
  final r = await rmwlog.get('https://www.qq.com/robots.txt');

  print(r.statusCode);
  print(await r.text());
  print('done');
}

```
