<!-- # avx_premiere

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference. -->

> # AVX Premiere

> :warning: This project is a job test.

    root
    └─ src
    ....└─ Desafio_Starta_Flutter_.docx // Here you will find more details.

> ## The Project:

This is a simple application that provides a list of movies to the user and allows him to view the details and mark them as favorites.

* Prototype:

![image](https://user-images.githubusercontent.com/59848966/182155385-70d99f63-7e77-4cec-aaa4-a3ee14ae4986.png)

* Result:

![result](https://user-images.githubusercontent.com/59848966/182379158-7b4a5394-3dd2-4be6-96e3-b2825d971236.png)

> ## Features:

* List movies;
* View Details;
* Bookmark;

> ## Arch:

    root
    └─ lib
    ....├─ modules
    ........└─ home
    ............├─ bloc
    ................├─ home_bloc.dart
    ................├─ home_event.dart
    ................└─ home_state.dart
    ............├─ models
    ................├─ movie_details
    ................└─ usimilar_movie
    ....................├─ results_models.dart
    ....................└─ similar_movie_model.dart
    ............├─ pages
    ................└─ home_page.dart
    ............├─ repositories
    ................└─ home_repository.dart
    ............└─ home_module.dart
    ....├─ shared
    ........├─ core
    ........└─ widgets
    ....├─ app_module.dart
    ....├─ app_widget.dart
    ....└─ main.dart

> ## Endpoint:

api: https://api.themoviedb.org/3/movie/;

> ## Dependencies:

Flutter stable - 3.0.5;

Flutter packages:

    flutter_modular: ^5.0.3
    flutter_bloc: ^8.0.1
    meta: ^1.8.0
    dio: ^4.0.6

> ## Framework and Tools:

* vs code;

> ## License:

    MIT License

    Copyright (c) 2022 Matheus Ferreira

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
