# install

```
flutter pub add json_annotation
dart pub add dev:build_runner
dart pub add dev:json_serializable
flutter pub add http
flutter pub add dev:test
flutter pub add mocktail
```

# Code Generation

```
dart run build_runner build
```

# Unit Test

```
flutter test --coverage
```

require command genhtml
```
genhtml coverage/lcov.info -o coverage
open coverage/index.html
```