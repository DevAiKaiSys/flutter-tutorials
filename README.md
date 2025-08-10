# Flutter Bloc Tutorials

This repository contains a collection of Flutter tutorials focused on using the `flutter_bloc` package for state management.

## Projects

This repository includes the following tutorial projects:

-   **flutter_counter**: A simple counter application demonstrating the basic usage of `flutter_bloc`.
-   **flutter_timer**: A timer application showcasing more advanced features of `flutter_bloc`.

## Getting Started

### Prerequisites

-   Flutter SDK (version 3.x.x or higher)
-   Dart SDK

### Installation

1.  Clone the repository:
    ```bash
    git clone https://github.com/your-username/flutter-tutorials.git
    ```
2.  Navigate to a project directory:
    ```bash
    cd flutter_counter
    ```
3.  Install dependencies:
    ```bash
    flutter pub get
    ```

### Running the Applications

To run any of the tutorial applications, execute the following command from the project's root directory:

```bash
flutter run
```

### Running Tests

To run the unit tests for any of the applications, use the following command:

```bash
flutter test
```

## Dependencies

This project uses the following key dependencies:

-   `flutter_bloc`: For state management.
-   `equatable`: To compare objects.

You can add them to your project using:

```bash
flutter pub add equatable flutter_bloc
```

### Development Dependencies

For development, we use:

-   `bloc_lint`: Linting rules for BLoC.
-   `bloc_test`: For testing BLoCs and Cubits.
-   `mocktail`: For creating mocks.

Add them using:

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

### Run Unit Test

on macOS install

```
brew install lcov
```

cd to project or packages

```
flutter test --coverage
genhtml coverage/lcov.info -o coverage
open coverage/index.html
```

## ติดตั้ง very_good_cli:

```
dart pub global activate very_good_cli
```

ตรวจสอบว่าใช้ shell อะไร:

```
echo $SHELL
```

สำหรับ Zsh (default บน macOS):

```
# เพิ่มใน ~/.zshrc
echo 'export PATH="$PATH:$HOME/.pub-cache/bin"' >> ~/.zshrc

# Reload shell
source ~/.zshrc
```

สำหรับ Bash:

```
# เพิ่มใน ~/.bash_profile หรือ ~/.bashrc
echo 'export PATH="$PATH:$HOME/.pub-cache/bin"' >> ~/.bash_profile

# Reload shell
source ~/.bash_profile
```

install all the dependencies:

```
very_good packages get --recursive
```

