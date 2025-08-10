# Flutter Bloc Tutorials

This repository contains a collection of Flutter tutorials focused on using the `flutter_bloc` package for state management.

## Projects

-   **flutter_counter**
-   **flutter_timer**
-   **flutter_infinite_list**
-   **flutter_login**
-   **flutter_todos**
-   **flutter_weather**


## Getting Started

### Prerequisites

-   Flutter SDK (version 3.x.x)
-   Dart SDK
-   Bloc

## Dependencies

This project uses the following key dependencies:

```bash
flutter pub add equatable flutter_bloc
```

### Development Dependencies

```bash
flutter pub add bloc_lint bloc_test mocktail --dev
```

For integration tests, add the following to your `pubspec.yaml`:

```
// pubspec.yaml
dev_dependencies:
 integration_test:
    sdk: flutter
```

### Run json

```
dart run build_runner build
```

## Unit Test

### Run unit tests

```bash
flutter test --coverage
```

### View coverage

```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage
open coverage/index.html
```

## Very Good CLI

### Install `very_good_cli`

```bash
dart pub global activate very_good_cli
```


### Configure PATH

**Check Shell:**
```bash
echo $SHELL
```

**Set PATH for Zsh:**
```bash
echo 'export PATH="$PATH:$HOME/.pub-cache/bin"' >> ~/.zshrc
source ~/.zshrc
```

**Set PATH for Bash:**
```bash
echo 'export PATH="$PATH:$HOME/.pub-cache/bin"' >> ~/.bash_profile
source ~/.bash_profile
```


### Install dependencies

```bash
very_good packages get --recursive
```
