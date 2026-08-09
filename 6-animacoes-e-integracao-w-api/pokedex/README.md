# Pokédex App

🌍 Read this in [English](README.en.md)

Uma aplicação mobile moderna e interativa desenvolvida em Flutter para explorar o universo Pokémon, consultar informações detalhadas, buscar por nome/número e visualizar estatísticas completas.

## 📝 Sobre o Projeto

O **Pokédex App** é um aplicativo mobile focado na integração com a [PokeAPI](https://pokeapi.co/) e no uso de boas práticas de desenvolvimento Flutter. O projeto utiliza gerenciamento de estado reativo com **MobX**, requisições HTTP com **Dio**, paginação com rolagem infinita (Infinite Scroll), além de uma interface limpa com animações e geração de cores dinâmicas baseadas na imagem de cada Pokémon.

## 🖼️ Tela (Preview)

<img src="assets/images/pokedex.gif" alt="Demonstração do App" width="300"/>

## ✨ Funcionalidades

- 🔍 **Busca em Tempo Real:** Filtragem dinâmica por nome ou ID do Pokémon.
- 📜 **Infinite Scroll:** Carregamento automático e paginado de Pokémons conforme a navegação.
- 🎨 **Cores Dinâmicas:** Extração de cores das imagens dos Pokémons usando `palette_generator`.
- 📊 **Estatísticas Detalhadas:** Visualização de atributos (HP, Ataque, Defesa, etc.) com barras de progresso percentuais (`percent_indicator`).
- 🖼️ **Cache de Imagens:** Carregamento rápido e eficiente com `cached_network_image`.
- ⚡ **Gerenciamento de Estado Reativo:** Controle de fluxo de dados limpo e performático com `MobX`.

## 🛠️ Tecnologias Utilizadas

- **[Flutter](https://flutter.dev/)** - Framework UI multiplataforma
- **[Dart](https://dart.dev/)** - Linguagem de programação
- **[MobX](https://pub.dev/packages/mobx)** & **[flutter_mobx](https://pub.dev/packages/flutter_mobx)** - Gerenciamento de estado reativo
- **[Dio](https://pub.dev/packages/dio)** - Cliente HTTP para consumo da PokeAPI
- **[Cached Network Image](https://pub.dev/packages/cached_network_image)** - Exibição e cache de imagens remotas
- **[Percent Indicator](https://pub.dev/packages/percent_indicator)** - Exibição visual de estatísticas
- **[Palette Generator](https://pub.dev/packages/palette_generator_master)** - Extração de paletas de cores a partir de imagens

## 🚀 Como Executar o Projeto

Para rodar este projeto em sua máquina local, você precisará ter o Flutter instalado. Depois, siga os passos abaixo:

1.  **Clone o repositório** (se estiver usando git):
    ```bash
    git clone https://github.com/ludson96/mobile-w-flutter.git

    cd 6-animacoes-e-integracao-w-api/pokedex
    ```

2.  **Instale as dependências** com o Flutter:
    ```bash
    flutter pub get
    ```

3.  **Execute o aplicativo**:
    ```bash
    flutter run
    ```
