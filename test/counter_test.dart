import 'package:flutter_test/flutter_test.dart';
import 'package:parctice2_app/blocs/helpers.dart';

void main() {
  group('Counter Test', () {
    late Helpers helper;
    setUpAll(() => helper = Helpers());
    test('Checking Initial Value', () => expect(helper.count, 0));
    test('Checking Increament Value', () {
      helper.onIncreament();
      expect(helper.count, 1);
      helper.onIncreament();
      expect(helper.count, 2);
    });

    test('Checking Decreament Value', () {
      helper.onDeccreament();
      expect(helper.count, 1);
      helper.onIncreament();
      expect(helper.count, 2);
    });
  });
}
