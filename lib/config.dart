import 'dart:io';
import 'package:colorize/colorize.dart';

final buildEscSeq = Colorize().buildEscSeq;

var _pre = '';

void Function(String, String) out(String prefix, Stdout out, Styles style) {
  late final String Function(String) color;
  if (stdout.supportsAnsiEscapes) {
    color = (text) => buildEscSeq(style) + text + buildEscSeq(Styles.RESET);
  } else {
    color = (text) => text;
  }
  return (stack, msg) {
    late final String tip;
    if (stack == _pre) {
      tip = '\t';
    } else {
      _pre = stack;
      tip = color(stack + prefix);
    }
    out.write(tip + msg + '\n');
  };
}

final logConfig = [
  out(' : ', stdout, Styles.DARK_GRAY),
  out(' 🔥 ', stderr, Styles.LIGHT_YELLOW),
  out(' ❌ ', stderr, Styles.LIGHT_RED),
];
