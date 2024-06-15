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
│   │   │   │   └── bottom_loader.dart
│   │   │   │   └── auth_list_item.dart
│   │   │   │   └── widgets.dart*
│   │   │   ├── auth.dart*
│   │   ├── main.dart
├── packags
│   ├── data_layer
│   │   ├── auth
│   ├── repository_layer
│   │   ├── auth
```

refer: Bloc Tutorials [Flutter Weather](https://bloclibrary.dev/tutorials/flutter-weather/)