import 'package:stack_trace/stack_trace.dart';
import '../config.dart';
import 'dart:io';

typedef VarArgsCallback = void Function(
    List<dynamic> args, Map<String, dynamic> kwargs);

class VarArgsFunction {
  final VarArgsCallback callback;
  static final _offset = 'Symbol("'.length;

  VarArgsFunction(this.callback);

  void call() => callback([], {});

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return callback(
      invocation.positionalArguments,
      invocation.namedArguments.map(
        (_k, v) {
          var k = _k.toString();
          return MapEntry(k.substring(_offset, k.length - 2), v);
        },
      ),
    );
  }
}

String toString(i) {
  if (i is String) return i;
  return i.toString();
}

final depth = Platform.script.toString().endsWith('.dart') ? 2 : 3;
final depth_1 = depth + 1;

VarArgsFunction _logger(void Function(String, String) write) {
  return VarArgsFunction((args, kwds) {
    final List<String> li = [];
    late final Frame f;

    final frames = Trace.current().frames;
    if (frames.length > depth_1) {
      f = frames[depth];
    } else {
      f = frames.last;
    }
    final stack = "${f.location} ${f.member}";

    for (var i in args) {
      li.add(toString(i));
    }

    for (var i in kwds.entries) {
      li.add("${i.key} : ${toString(i.value)}");
    }

    write(stack, li.join(' '));
  });
}

dynamic log = _logger(logConfig[0]);
dynamic logw = _logger(logConfig[1]);
dynamic loge = _logger(logConfig[2]);
