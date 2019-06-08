import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intent/intent.dart';

void main() {
  const MethodChannel channel = MethodChannel('intent');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Intent.platformVersion, '42');
  });
}
