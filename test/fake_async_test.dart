@TestOn('dartium')
import "package:test/test.dart";
import 'package:angular2/src/testing/fake_async.dart';
import 'package:angular2/src/testing/internal.dart';
import 'package:fake_async_bug/my-component.dart';


void main() {

  group('My component', () {
    TestComponentBuilder tcb;

    setUp(() async {
      await inject([TestComponentBuilder], (_tcb) {
        tcb = _tcb;
      });
    });

    test('can do stuff', fakeAsync(() {
      var cmpFixture = tcb.createFakeAsync(MyComponent);
      //cmpFixture always null so there will be exception
      var debugEl = cmpFixture.debugElement;
      expect(true, true);
    }));
  });
}