import 'dart:io';

void Function(String, String) out(String prefix, Stdout out) {
  return (stack, msg) {
    out.write(stack + " : " + prefix + msg + '\n');
  };
}

final logConfig = [
  out('', stdout),
  out('🔥 ', stderr),
  out('❌ ', stderr),
];
