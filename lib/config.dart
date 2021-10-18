import 'dart:io';

void Function(String?, String, String) out(Stdout out) {
  return (stack, prefix, msg) {
    out.write((stack ?? '') + " : " + prefix + msg + '\n');
  };
}

final logConfig = [out(stdout), out(stderr)];
