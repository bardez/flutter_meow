# flutter_meow

A flutter meow project made for use case tests.

## Used Versions

- Flutter 2.6.0-0.0.pre • channel dev
- Slidy 3.2.2+1   

## Getting Started

This project is a starting point for a Flutter application. Created with slidy (https://pub.dev/packages/slidy)

## Mobx build

This project uses mobx codegen and needs some runners to create *.g.dart files to best perfomance and usability stuffs.

When you modify a controller/service/store, (using slidy)you need to run 
```slidy run mobb``` or ```slidy run mobd``` (force recreate files).

If you don't use slidy package, you can run ```flutter clean```, ```flutter pub get``` and ```flutter pub run build_runner``` to generate *.g.dart scripts.

## Runing application

```flutter run``` or debug using an IDE like Visual Studio Code, JetBrains or Android Studio.
