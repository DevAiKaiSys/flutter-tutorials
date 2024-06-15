# Project Structure

Separation by Features

```
├── lib
|   ├── core
|   ├── features
│   │   ├── auth
│   │   │   ├── data
│   │   │   ├── domain
│   │   │   │   ├── bloc
│   │   │   │   │   └── auth_bloc.dart
|   │   │   |   |   └── auth_event.dart
|   │   │   |   |   └── auth_state.dart
|   │   │   |   ├── models
|   │   │   |   |   └── models.dart*
|   │   │   |   |   └── user.dart
│   │   │   ├── presentation
│   │   │   │   ├── view
│   │   │   │   |   ├── login_page.dart
│   │   │   │   |   ├── register_page.dart
|   │   │   |   |   └── view.dart*
|   │   │   |   ├── widgets
|   │   │   |   |   └── widgets.dart*
│   │   │   ├── auth.dart*
```