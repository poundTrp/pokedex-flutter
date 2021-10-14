# pokedex_flutter

A Pokemon Flutter project.

**Owner Code:** Theerapat piriyadontham

## Pre-requisites / External dependencies

1. [Flutter](https://flutter.dev/docs/get-started/install) version 2.2.2
2. [Dart sdk](https://dart.dev/get-dart) - The Flutter SDK includes the full Dart SDK. So if you have Flutter installed, you might not need to explicitly download the Dart SDK.
3. [Git]()

## IDE Installation
1. [Android studio](https://developer.android.com/) ^version 4.2.2

   Note: You must install [Oracle JDK](https://www.oracle.com/in/java/technologies/javase/javase-jdk8-downloads.html) before installing Android Studio.


## Project setup
#### 1. Open Android studio

#### 2. Clone the code from Repository
You can choose checkout project from version control option and enter repository url to clone the repo

![alt text](https://www.mathworks.com/help/supportpkg/android/ug/android_landing_check_update.png)

Alternatively, you can also clone it using git bash
```sh
git clone https://github.com/poundTrp/pokedex-flutter.git
```
#### 3. Checkout to branch
```sh
git checkout master
```
#### 4. Package installation

Use the package manager [pubspec.yaml]() to install package dependencies. 

```bash
flutter pub get
```
Alternatively, you can also use the Pub get dependencies option in the Android Studio to install all the dev dependencies.

#### 6. Configure AVD
Click on this icon in top right of the IDE

![](https://www.tektutorialshub.com/wp-content/uploads/2018/08/Open-AVD-Manager-in-Android-Studio.png)
Choose a device from the list and click on Next

#### 5. Run the project
Click on Run ![alt text](https://i.stack.imgur.com/CSKBM.png)

## Branching strategy
**Trunk based development** is being used as a Git branching strategy.

A source-control branching model, where developers collaborate on code in a single branch called ‘trunk’ *, resist any pressure to create other long-lived development branches. They therefore avoid merge hell, do not break the build. Reade more about trunk based development [here](https://trunkbaseddevelopment.com/)

Branch names to be created in this pattern - **feature/<new_feature>** for feature


## Unit Testing
The built-in flutter_test library is being used for unit testing and widget testing in this project
Read more about it [here](https://api.flutter.dev/flutter/flutter_test/flutter_test-library.html)

```sh
flutter test
```

To get the coverage Run
```sh
flutter test --coverage
```
This will generate a coverage/lcov.info file. Now run the following command to convert it to HTML format.
```sh
genhtml -o coverage coverage/lcov.info
```

Note: You must have lcov installed. You can install by running the following command
      ```
      brew install lcov
      ```
      
Now open the index.html file to view the code coverage
