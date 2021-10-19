import 'dart:io';
import 'package:colorize/colorize.dart';

final color = Colorize();

String apply(Styles style, String text) {
  return color.buildEscSeq(style) + text + color.buildEscSeq(Styles.RESET);
}

void Function(String, String) out(String prefix, Stdout out, Styles style) {
  if (stdout.supportsAnsiEscapes) {
    return (stack, msg) {
      out.write(apply(style, stack) + prefix + msg + '\n');
    };
  }
  return (stack, msg) {
    out.write(stack + " : " + prefix + msg + '\n');
  };
}

final logConfig = [
  out(' : ', stdout, Styles.DARK_GRAY),
  out(' 🔥 ', stderr, Styles.LIGHT_YELLOW),
  out(' ❌ ', stderr, Styles.LIGHT_RED),
];
