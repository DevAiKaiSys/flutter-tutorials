# Project Structure

Separation by Layers

```
├── lib
│   ├── core
│   │   ├── theme
│   │   │   ├── theme.dart
│   ├── business_logic_layer
│   │   ├── auth
│   │   │   ├── bloc
│   │   │   │   └── auth_bloc.dart
│   │   │   │   └── auth_event.dart
│   │   │   │   └── auth_state.dart
│   │   │   ├── models
│   ├── presentation_layer
│   │   ├── auth
│   │   │   ├── view
│   │   │   │   ├── auth_page.dart
│   │   │   │   └── view.dart*
│   │   │   ├── widgets
│   │   │   │   └── widgets.dart*
│   │   │   ├── auth.dart*
│   │   ├── init_dependencies.dart
│   │   ├── main.dart
├── packags
│   ├── data_layer
│   │   ├── core
│   │   │   ├── error
│   │   │   │   └── exceptions.dart
│   │   ├── auth
│   │   │   ├── auth_api.dart           # abstract api
│   │   │   ├── supabase_auth_api.dart    # implements api
│   ├── repository_layer
│   │   ├── core
│   │   │   ├── error
│   │   │   │   └── failures.dart
│   │   │   ├── usecase
│   │   │   │   └── usecase.dart      # abstract usecase method call
│   │   ├── auth
│   │   │   ├── usecases
│   │   │   │   └── user_sign_up.dart      # implements usecase
│   │   │   ├── auth_repository.dart   # abstract repository
│   │   │   ├── auth_repository_impl.dart  # implements repository
```

refer: Bloc Tutorials [Flutter Weather](https://bloclibrary.dev/tutorials/flutter-weather/)

# install

```
flutter pub add flutter_bloc
flutter pub add get_it
```

# add repository_layer, data_layer packages

```
dependencies:
  repository_layer:
    path: packages/repository_layer
  data_layer:
    path: packages/data_layer
```