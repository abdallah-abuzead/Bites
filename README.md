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
flutter pub get 
flutter run
```

## Bites task Features:

* Splash
* Authentication
* Home
* Contacts
* Chatting
* Localization
* Routing
* Theme
* Dio
* Riverpod (to connect the reactive data of your application with the UI)
* Bloc (State Management)
* Dependency Injection
* Validation
* Error Handling

### Up-Coming Features:

* Settings
* Notifications
* History
* Pagination

### Libraries & Tools Used

* [Dio](https://github.com/flutterchina/dio)
* [Riverpod](https://github.com/rrousselGit/riverpod) (to connect the reactive data of your application with the UI - State Management)
* [Dependency Injection](https://github.com/fluttercommunity/get_it)
* [dartz](https://github.com/spebbe/dartz) (Functional programming)

### 📄 Project Folder Structure
Clean Architecture.

Here is the core folder structure that Flutter provides for each app.

```
bites/
├── android
├── assets
├── build
├── ios
├── lib
└── test
```

```
assets/
├── animations/
├── fonts/
├── images/
├── svgs/
└── translations/
```

## 🌴 Folders tree
Here is the folder structure we have been using.

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
│   └── my_app.dart
├── base_use_case/
│   └── base_use_case.dart
├── constants/
│   ├── app_assets.dart
│   ├── app_constants.dart  
│   └── app_strings.dart
├── di/
│   └── app_injections.dart
├── localization/
│   └── app_locale.dart
├── networking/
│   ├── interceptors.dart
│   │   └── token_interceptor.dart
│   ├── api_client.dart
│   ├── api_handler.dart
│   ├── end_points.dart
│   ├── dio_interceptor.dart
│   ├── exceptions.dart
│   ├── failures.dart
│   └── network_checker.dart
├── routing/
│   ├── app_router.dart
│   ├── app_router_observer.dart
│   └── routes.dart
├── theme/
│   ├── app_colors.dart
│   ├── app_font_weight.dart
│   ├── app_fonts.dart
│   ├── app_styles.dart
│   └── app_theme.dart
├── utils/
│   ├── cache_storage/
│   │   ├── cache_storage.dart
│   │   ├── secure_cache_storage.dart
│   │   └── secure_cache_storage_keys.dart
│   ├── extensions/
│   │   ├── routing_extensions.dart
│   │   ├── size_extensions.dart
│   │   └── other extensions...
│   ├── helper.dart
│   ├── validator.dart
│   ├── app_date_utils.dart
│   └── debouncer.dart
└── widgets
    ├── loaders/
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
    ├── app_error_widget.dart
    ├── rounded_cached_network_image.dart
    ├── app_text_field.dart
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
8- networking - Contains the dio instance configurations, request header, token handling, network checker, and response and error handling.
9- utils — Contains the utilities/common functions, and extensions of your application.

```

Here is the features folder structure I have been using for this project.
Each feature has the same structure and layers, so I'll explain one feature, and the others are the same.

```
features/
├── auth/
├── chat/
├── contacts/
│   ├── data/
│   │   ├── data_sources/
│   │   │   └── contacts_data_source.dart
│   │   ├── models/
│   │   │   └── contact_model.dart
│   │   └── repositories/
│   │       └── contacts_repository_impl.dart
│   ├── domain/
│   │   ├── entities/
│   │   │   └── contact.dart
│   │   ├── repositories/
│   │   │   └── contacts_repository.dart
│   │   └── use_cases/
│   │       └── get_user_contacts_use_case.dart
│   └── presentation/
│       ├── providers/
│       │   └── contacts_provider.dart
│       ├── dialogs/
│       ├── screens/
│       │   ├── contacts_screen.dart
│       │   └── other screens...
│       └── widgets/
│           ├── contact_card.dart
│           ├── contact_list.dart
│           └── image_and_ask_me_text.dart
├── nab_bar/
├── profile/
└── splash/

```


### Main

This is the starting point of the application. All the application-level configurations are defined in this file i.e., theme, routes, title, orientation, etc.

```dart
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app/app_initializer.dart';
import 'core/app/my_app.dart';
import 'core/constants/app_assets.dart';
import 'core/localization/app_locale.dart';

Future<void> main() async {
  await AppInitializer.init();
  runApp(
    EasyLocalization(
      supportedLocales: const [AppLocale.english, AppLocale.arabic],
      path: AppAssets.translations,
      startLocale: AppLocale.arabic,
      fallbackLocale: AppLocale.arabic,
      child: const ProviderScope(child: MyApp()),
    ),
  );
}

```

## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the bites task, then please feel free to submit an issue and/or pull request 🙂

Again, to note, this example can appear as over-architecture for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.



