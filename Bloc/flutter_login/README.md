# Project Structure & Repository

```
├── android
├── ios
├── lib
│   ├── app.dart
│   ├── authentication
│   │   ├── authentication.dart
│   │   └── bloc
│   │       ├── authentication_bloc.dart
│   │       ├── authentication_event.dart
│   │       └── authentication_state.dart
│   ├── login
│   │   ├── bloc
│   │   │   ├── login_bloc.dart
│   │   │   ├── login_event.dart
│   │   │   └── login_state.dart
│   │   ├── login.dart
│   │   ├── models
│   │   │   ├── models.dart
│   │   │   ├── password.dart
│   │   │   └── username.dart
│   │   └── view
│   │       ├── login_form.dart
│   │       ├── login_page.dart
│   │       └── view.dart
│   ├── splash
│   │   ├── splash.dart
│   │   └── view
│   │       └── splash_page.dart
│   ├── main.dart
├── packages
│   ├── authentication_repository
│   └── user_repository
└── test
```

# install

```
flutter pub add flutter_bloc
flutter pub add equatable
flutter pub add formz
```