# [testing_app](https://codelabs.developers.google.com/codelabs/flutter-app-testing)

A new Flutter project.

```
flutter pub add provider go_router dev:test 'dev:flutter_driver:{"sdk":"flutter"}' 'dev:integration_test:{"sdk":"flutter"}'
flutter pub add provider
flutter pub add go_router
flutter pub add dev:test
flutter pub add "dev:flutter_driver:{'sdk':'flutter'}"
flutter pub add "dev:integration_test:{'sdk':'flutter'}"
```

## Run the test

```
flutter test
or
flutter test test/models/favorites_test.dart
```

### Integration tests

```
flutter test integration_test/app_test.dart
```

###

```
flutter drive --driver=test_driver/perf_driver.dart --target=integration_test/perf_test.dart --profile --no-dds
```

### Test Coverage Report

```
# Generate `coverage/lcov.info` file
flutter test --coverage
# Generate HTML report
# Note: on macOS you need to have lcov installed on your system (`brew install lcov`) to use this:
genhtml coverage/lcov.info -o coverage/html
# Open the report
open coverage/html/index.html
```
