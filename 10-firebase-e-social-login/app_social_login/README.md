# 📱 App Social Login

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com/)
[![MobX](https://img.shields.io/badge/MobX-FF4081?style=for-the-badge&logo=mobx&logoColor=white)](https://mobx.netlify.app/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)

🌍 Read this in [English](README.en.md)

> Aplicativo Flutter focado em **autenticação social (Google & Facebook)** integrada ao **Firebase Authentication**, com gerenciamento de estado reativo em **MobX** e arquitetura desacoplada utilizando **GetIt**.

## 📝 Sobre o Projeto

O **App Social Login** é uma aplicação desenvolvida em **Flutter** voltada para demonstrar na prática a integração de **autenticação social** (Google Sign-In e Facebook Auth) utilizando o **Firebase Authentication**.

O projeto foi projetado seguindo arquitetura limpa e desacoplada no ecossistema Flutter, destacando-se por:
- **Gerenciamento de Estado Reativo** desacoplado com **MobX**.
- **Injeção de Dependências** modularizada com **GetIt**.
- **Navegação Dinâmica** através de um shell de perfil com Menu Lateral (*Drawer*).
- **Roteamento & Validação de Sessão** reativa via tela de *Splash*.
- **Notificações Push** preparadas via **Firebase Cloud Messaging (FCM)** e `flutter_local_notifications`.

## 🖼️ Tela (Preview)

Abaixo está a demonstração visual do aplicativo em execução, destacando o fluxo de login social e a navegação entre telas:

<img src="assets/images/social-login.gif" alt="Demonstração do App" width="300"/>

## ✨ Funcionalidades

- 🔑 **Login com Google:** Autenticação rápida e segura integrada ao Google Sign-In SDK.
- 📘 **Login com Facebook:** Suporte completo à autenticação social via Facebook Auth.
- 🔥 **Firebase Authentication:** Centralização e gerenciamento de sessões de usuário (`firebase_auth`).
- ⚡ **Gerenciamento de Estado Reativo (MobX):** Controle preciso de telas de carregamento (*loading*), tratamento de erros e atualização da interface em tempo real.
- 📌 **Injeção de Dependências (GetIt):** Service Locator para gerenciamento desacoplado de instâncias como serviços de notificação e autenticação.
- 🖼️ **Navegação Dinâmica (Drawer):** Interface de perfil (`ProfilePage`) com Menu Lateral (`CustomDrawer`) permitindo alternar entre Favoritos, Mensagens, Configurações e Sobre.
- 🔄 **Redirecionamento de Sessão Ativa:** Tela de *Splash* que inspeciona a sessão continuamente e redireciona automaticamente usuários logados.
- 🔔 **Notificações Push (FCM):** Infraestrutura pronta para recebimento de notificações em segundo plano e exibição local (`NotificationService`).

## 🛠️ Tecnologias e Pacotes Utilizados

| Tecnologia | Descrição / Papel no Projeto |
| :--- | :--- |
| **Flutter (SDK)** | Framework UI para desenvolvimento mobile multiplataforma. |
| **Firebase Auth** | Serviço de autenticação e gerenciamento de usuários. |
| **Google Sign-In** | Autenticação via conta Google (`google_sign_in`). |
| **Flutter Facebook Auth** | Autenticação via Facebook (`flutter_facebook_auth`). |
| **MobX / Flutter MobX** | Gerenciamento de estado reativo baseado em observables e actions. |
| **GetIt** | Service Locator para injeção de dependências. |
| **Firebase Messaging & Local Notifications** | Recebimento e gestão de notificações Push (FCM). |
| **Build Runner & MobX Codegen** | Ferramenta de geração de código dos arquivos `.g.dart`. |

## 📂 Estrutura do Projeto

```text
lib/
├── firebase_options.dart      # Configurações geradas pelo Firebase CLI
├── locator.dart               # Registro de dependências (GetIt)
├── main.dart                  # Ponto de entrada do aplicativo
├── pages/
│   ├── about.page.dart        # Tela "Sobre"
│   ├── favorites.page.dart    # Tela "Favoritos"
│   ├── messages.page.dart     # Tela "Mensagens"
│   ├── profile.page.dart      # Tela de Perfil (Shell Principal + Drawer)
│   ├── settings.page.dart     # Tela "Configurações"
│   ├── splash_screen.page.dart# Tela de Splash com validação de sessão
│   └── login/
│       ├── login.page.dart    # Interface de Login Social
│       └── store/
│           ├── login_store.dart   # Regras de negócio e estado (MobX)
│           └── login_store.g.dart # Código gerado pelo MobX
├── services/
│   └── notification_service.dart # Gerenciador de Push Notifications (FCM)
└── widgets/
    └── custom_drawer.widget.dart # Componente reutilizável do Menu Lateral
```

## 🚀 Como Executar o Projeto

### 1. Pré-requisitos
- **Flutter SDK** instalado na sua máquina (`^3.10.7` ou superior).
- Emulador Android/iOS ativo ou dispositivo físico conectado.
- Configuração do **Firebase**:
  - Arquivo `google-services.json` adicionado em `android/app/`.
  - Arquivo `GoogleService-Info.plist` adicionado em `ios/Runner/`.
  - Declaração de pacotes visíveis (`<queries>`) no `AndroidManifest.xml` para compatibilidade com Android 11+ (API 30+).

### 2. Clonar e Instalar Dependências
No terminal, navegue até a raiz do projeto e execute:

```bash
flutter pub get
```

### 3. Gerar Arquivos do MobX (Build Runner)
Como o projeto utiliza MobX, gere os arquivos compilados `.g.dart`:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Executar o Aplicativo
```bash
flutter run
```

## 📄 Licença

Projeto desenvolvido para fins educacionais e de demonstração.
