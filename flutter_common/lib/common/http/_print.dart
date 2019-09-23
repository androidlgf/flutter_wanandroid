
import 'work_config.dart';

/// 每次打印的最大长度
const _logBufferSize = 1000;

/// 输出日志
///
/// [tag]日志标签，[message]日志内容，额外数据
void log(String tag, String message, [Object data]) {
  if (!debugWork) {
    return;
  }

  final finalMessage = "$tag: $message ${data ?? ""}";

  if (finalMessage.length <= _logBufferSize) {
    print(finalMessage);
  } else {
    for (var it in _wrap(finalMessage)) {
      print(it);
    }
  }
}

/// 按换行父切割字符串为若干组
///
/// [src]原字符串
Iterable<String> _wrap(String src) sync* {
  final buffer = StringBuffer();

  for (var line in src.split('\n')) {
    for (var part in _chunked(line)) {
      if (buffer.length + part.length > _logBufferSize) {
        yield buffer.toString();
        buffer.clear();
      }

      buffer..write(part)..write('\n');
    }
  }

  if (buffer.length > 0) {
    yield buffer.toString();
  }
}

/// 按照指定大小将字符串截取成一组子字符串
///
/// [src]原字符串
Iterable<String> _chunked(String src) sync* {
  final length = src.length;

  var index = 0;
  while (index < length) {
    final end = index + _logBufferSize;
    final coercedEnd = end > length ? length : end;
    yield src.substring(index, coercedEnd);

    index = coercedEnd;
  }
}
