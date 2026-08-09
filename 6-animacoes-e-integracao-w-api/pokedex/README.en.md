# Pokédex App

🇧🇷 Leia isto em [Português](README.md)

A modern and interactive mobile application built with Flutter to explore the Pokémon universe, check detailed information, search by name/number, and view complete stats.

## 📝 About the Project

The **Pokédex App** is a mobile application focused on integration with the [PokeAPI](https://pokeapi.co/) and employing Flutter development best practices. The project uses reactive state management with **MobX**, HTTP requests with **Dio**, infinite scroll pagination, along with a clean user interface featuring animations and dynamic color generation based on each Pokémon's image.

## 🖼️ Preview

<img src="assets/images/pokedex.gif" alt="App Demonstration" width="300"/>

## ✨ Features

- 🔍 **Real-Time Search:** Dynamic filtering by Pokémon name or ID.
- 📜 **Infinite Scroll:** Automatic and paginated loading of Pokémons as you navigate.
- 🎨 **Dynamic Colors:** Color extraction from Pokémon images using `palette_generator`.
- 📊 **Detailed Statistics:** View attributes (HP, Attack, Defense, etc.) with visual progress bars (`percent_indicator`).
- 🖼️ **Image Caching:** Fast and efficient image loading with `cached_network_image`.
- ⚡ **Reactive State Management:** Clean and performant data flow control using `MobX`.

## 🛠️ Technologies Used

- **[Flutter](https://flutter.dev/)** - Cross-platform UI framework
- **[Dart](https://dart.dev/)** - Programming language
- **[MobX](https://pub.dev/packages/mobx)** & **[flutter_mobx](https://pub.dev/packages/flutter_mobx)** - Reactive state management
- **[Dio](https://pub.dev/packages/dio)** - HTTP client for PokeAPI integration
- **[Cached Network Image](https://pub.dev/packages/cached_network_image)** - Display and cache remote images
- **[Percent Indicator](https://pub.dev/packages/percent_indicator)** - Visual progress indicator for statistics
- **[Palette Generator](https://pub.dev/packages/palette_generator_master)** - Extract color palettes from images

## 🚀 Getting Started

To run this project on your local machine, ensure you have Flutter installed. Then, follow these steps:

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/ludson96/mobile-w-flutter.git

    cd 6-animacoes-e-integracao-w-api/pokedex
    ```

2.  **Install dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Run the application**:
    ```bash
    flutter run
    ```
