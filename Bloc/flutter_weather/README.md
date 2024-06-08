# Project Structure

```
flutter_weather
|-- lib/
  |-- search/
  |-- settings/
  |-- theme/
    |-- cubit/
      |-- theme_cubit.dart
  |-- weather/
    |-- cubit/
      |-- weather_cubit.dart
      |-- weather_state.dart
  |-- main.dart
|-- packages/
  |-- open_meteo_api/
    |-- lib/
      |-- src/
        |-- models/
          |-- location.dart
          |-- location.g.dart
          |-- weather.dart
          |-- weather.g.dart
          |-- models.dart
        |-- open_meteo_api_client.dart
      |-- open_meteo_api.dart
    |-- test/
  |-- weather_repository/
    |-- lib/
      |-- src/
        |-- models/
          |-- models.dart
          |-- weather.dart
    |-- test/
|-- test/
```

# install

```
flutter pub add equatable
flutter pub add json_annotation
dart pub add dev:build_runner
dart pub add dev:json_serializable
flutter pub add hydrated_bloc

flutter pub add dev:bloc_test
flutter pub add mocktail

flutter pub add flutter_bloc
flutter pub add path_provider
```

# Code Generation

```
dart run build_runner build
```

# Unit Test

```
flutter test -r expanded
```