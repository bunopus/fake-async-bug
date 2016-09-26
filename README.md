### This is a test repository to reproduce bug with Dart angular2 fakeAsync function

**Bug**: when using *fakeAsync* function from *angular2-2.0.0-beta.21/lib/src/testing/fake_async.dart* in tests,
TestComponentBuilder returns null instead of ComponentFixture after *createFakeAsync* call.
Probably it caused by this bug https://github.com/angular/angular/issues/5662
because if remove templateUrl and styleUrls from component - everything will work

**Steps to reproduce**: 
```bash
pub get 
pub serve

#run tests from another console
pub run test --pub-serve=8181 -p dartium
```

**Test code**                                                                 
```dart
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
```