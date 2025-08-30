# This branch is still under development

# Bites


## ✨ Description
Bites task created in Flutter using riverpod and a clean architecture structure.
Bites supports Android and iOS platforms with a responsive and adaptive design, catering to tablets and iPads, as well as the web in the future.
It introduces services for helping students in their daily lives and studies.

## Getting Started

Bites contain the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, app theme, constants, and required dependencies to create a new project. By using boilerplate code as a standard initializer, we can have the same patterns in all the projects that will inherit it. This will also help in reducing setup & development time by allowing you to use the same code pattern and avoid re-writing from scratch.

## 📱 Screenshots of the application

<div>
    <img src="https://github.com/user-attachments/assets/dfa1d8a3-9c4a-471e-9659-bce825382900" width="30%">
    <img src="https://github.com/user-attachments/assets/5f3d2850-a640-4437-829e-36ec1accc96c" width="30%">
    <img src="https://github.com/user-attachments/assets/c1637efa-79b0-4767-8f6f-80fdc370b651" width="30%">
    <img src="https://github.com/user-attachments/assets/e24ec55f-2493-4f27-b421-83ad1bd0fc24" width="30%">
    <img src="https://github.com/user-attachments/assets/f67de03f-d661-45a7-98b0-e9e7e277e8d8" width="30%">

</div>

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/abdallah-abuzead/Bites.git
```

**Step 2:**

Go to the project root and execute the following commands in the console to get the required dependencies:

```
dart pub global activate melos
melos bootstrap

flutter pub get 
cd apps/smoue_care    // Navigate to the app you want to run
flutter run
```

## LDM Mobile Manager Features:

* Splash
* Authentication
* Home
* Visits Reservations
* Health Tips
* Books
* Search
* Caching data
* News & News Letters & Scientific News
* Promotions
* Branches
* feedback
* Lab Tests & Services
* Routing
* Theme
* Dio
* Cubit (to connect the reactive data of your application with the UI)
* Bloc (State Management)
* Dependency Injection
* Validation
* Error Handling

### Up-Coming Features:

* Localization
* Pagination
* Settings
* Notifications
* Online Payment

### Libraries & Tools Used

* [Dio](https://github.com/flutterchina/dio)
* [Cubit](https://github.com/felangel/bloc) (to connect the reactive data of your application with the UI)
* [Bloc](https://github.com/felangel/bloc) (State Management)
* [Dependency Injection](https://github.com/fluttercommunity/get_it)
* [dartz](https://github.com/spebbe/dartz) (Functional programming)
* [melos](https://github.com/invertase/melos) (monorepo management)
* [drift](https://github.com/simolus3/drift) (local database)

### 📄 Project Folder Structure
Monorepo structure.
This project uses a monorepo structure to manage multiple apps and packages in a single repository. The main directory contains the apps and packages, along with configuration files for managing dependencies and scripts.

```
ldm_mobile_manager
├── .github/
├── apps
│   ├── smoue_care
│   ├── apps_2
│   └── additional apps...
├── packages
│   ├── ldm_mobile_manager_kit
│   └── other package...
├── melos.yaml
├── pubspec.yaml
└── README.md
```

1- .github directory contains GitHub Actions workflows for CI/CD
2- The apps directory contains the Flutter applications
3- The packages directory contains shared packages that can be used across multiple apps.
4- melos.yaml file is used to manage dependencies and scripts for the monorepo
5- pubspec.yaml file is used to define the dependencies for the entire project.

### 📄 App Folder Structure
Here is the core folder structure that Flutter provides for each app.

```
flutter-app/
├── android
├── assets
├── build
├── ios
├── lib
└── test
```

```
assets/
├── fonts/
├── icons/
├── images/
├── translations/
└── lottie/
```

## 🌴 Folders tree
Here is the folder structure we have been using in each app.

```
lib/
├── core/
├── features/
└── main.dart
```

Now, let's dive into the lib folder, which has the main code for each app.

```
core/
├── app/
│   ├── app_initializer.dart
│   ├── app_root_provider.dart
│   └── my_app.dart
├── di/
│   └── app_injections.dart
├── localization/
│   └── app_locale.dart
├── routing/
│   └── app_router.dart
│   └── app_router_observer.dart
│   └── routes.dart
├── theme/
│   └── app_theme.dart
│   └── app_colors.dart
│   └── app_styles.dart
├── constants/
│   ├── app_assets.dart
│   ├── app_constants.dart  
│   └── app_strings.dart
└── widgets
    ├── input_fields/
    │   ├── app_rounded_text_field.dart
    │   └── input_label.dart
    ├── loading/
    │   ├── loading_dialog.dart
    │   ├── loading_progress.dart
    │   └── loading_widget.dart
    ├── notifiers/
    │   ├── snackbar_message.dart
    │   └── toast.dart
    ├── app_button.dart
    ├── app_dialog.dart
    ├── app_drop_down_menu.dart
    ├── app_text.dart
    ├── change_language_widget.dart
    ├── circle_cached_network_image.dart
    ├── custom_app_bar.dart
    ├── error_widget.dart
    ├── rounded_cached_network_image.dart
    └── validation_error.dart
           
```

```
1- app - Contains all needed initializations of services and settings for the app. 
2- di - includes all injected instances used in the app. 
3- localization - Contains all app-supported locals, and switches between them. 
4- routing — This file contains all the navigation and routing methods for your application.
5- theme - Contains the app theme, colors, and styles.
6- constants - All the application-level constants are defined in this directory within their respective files. This directory contains the constants for `icons paths`, `images paths`, and `strings`.
7- widgets — Contains the common widgets for your applications. For example, Button, TextField, etc.
```

Here is the features folder structure I have been using for this project.
Each feature has the same structure and layers, so I'll explain one feature, and the others are the same.

```
features/
├── auth/
├── health_tips/
│   ├── data/
│   │   ├── data_sources/
│   │   ├── models/
│   │   └── repositories/
│   ├── domain/
│   │   ├── entities/
│   │   ├── repositories/
│   │   └── use_cases/
│   └── presentation/
│       ├── cubits/
│       ├── dialogs/
│       ├── screens/
│       │   ├── health_tips_screen.dart
│       │   └── other screens...
│       └── widgets/
│           └── health_tips_card.dart
├── home/
└── visits/

```

Now, regarding the ldm_mobile_manager_kit file structure, it is a shared package that contains all the common code that can be used in all the apps. It has the same structure as the features folder, but it contains only the common code that can be used in all the apps.

```
ldm_mobile_manager_kit/
├── lib/
│   ├── core/
│   │   ├── app_config/
│   │   │   ├── app_config.dart
│   │   ├── bloc/
│   │   │   └── bloc_observer.dart
│   │   ├── cache_storage/
│   │   │   ├── cache_storage.dart
│   │   │   ├── secure_cache_storage.dart
│   │   │   └── secure_cache_storage_keys.dart
│   │   ├── constants/
│   │   │   ├── enums.dart
│   │   │   ├── ldm_constants.dart
│   │   │   └── ldm_strings.dart
│   │   ├── di/
│   │   │   └── ldm_injections.dart
│   │   ├── networking/
│   │   │   ├── api_client.dart
│   │   │   ├── api_handler.dart
│   │   │   ├── end_points.dart
│   │   │   ├── dio_interceptor.dart
│   │   │   ├── exceptions.dart
│   │   │   ├── failures.dart
│   │   │   └── network_checker.dart
│   │   ├── utils/
│   │   │   ├── extensions/
│   │   │   │   ├── date_time_extensions.dart
│   │   │   │   └── other extensions...
│   │   │   ├── validator.dart
│   │   │   ├── app_date_utils.dart
│   │   │   └── debouncer.dart
│   │   data/
│   │   ├── data_sources/
│   │   │   ├── ldm_locale_data_source.dart
│   │   │   └── ldm_remote_data_source.dart
│   │   ├── database/
│   │   │   ├── converters/
│   │   │   │   ├── string_list_converter.dart
│   │   │   │   └── other converters...
│   │   │   ├── tables/
│   │   │   │   ├── book_table.dart
│   │   │   │   └── other tables...
│   │   │   ├── database.dart
│   │   │   └── database.g.dart
│   │   ├── models/
│   │   │   ├── requests/
│   │   │   ├── token.dart
│   │   │   └── other files...
│   │   └── repository/
│   │   features/
│   │   ├── about_lab_details/
│   │   ├── books/
│   │   │   ├── books_cubit.dart
│   │   │   ├── books_state.dart
│   │   │   └── books_state.freezed.dart
│   │   ├── branches/
│   │   └── other features/
│   └── ldm_mobile_manager_kit.dart
└── test/
```

```
- network - Contains the dio instance configurations, request header, token handling, network checker, and response and error handling.
- utils — Contains the utilities/common functions, and extensions of your application.
```

### Main

This is the starting point of the application. All the application-level configurations are defined in this file i.e., theme, routes, title, orientation, etc.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ldm_mobile_manager_kit/features/health_tips/health_tips_cubit.dart';
import 'package:smou_care/core/app/app_initializer.dart';
import 'package:smou_care/features/health_tips/presentation/screens/health_tips_screen.dart';

import 'core/di/app_injections.dart';

Future<void> main() async {
  await AppInitializer.initSettingsAndServices();
  runApp(const MyApp());
}
```

## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the LDM Mobile Manager, then please feel free to submit an issue and/or pull request 🙂

Again, to note, this example can appear as over-architecture for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.



[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)
