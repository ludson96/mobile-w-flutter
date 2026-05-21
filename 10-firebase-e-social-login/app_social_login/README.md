# 📱 App Social Login

Um aplicativo construído em **Flutter** focado em demonstrar a implementação de fluxos de **autenticação social** utilizando Firebase, combinados com um gerenciamento de estado reativo e boas práticas de injeção de dependências.

## ✨ Funcionalidades

- **Login com Google:** Autenticação rápida e segura utilizando credenciais do Google.
- **Login com Facebook:** Integração com o ecossistema do Facebook para entrada social.
- **Firebase Authentication:** Centralização e gerenciamento de sessões de usuário (`firebase_auth`).
- **Gerenciamento de Estado Reativo:** Uso do **MobX** para o controle preciso de estados da interface (como telas de carregamento durante o login).
- **Navegação Dinâmica (Drawer):** Interface shell (`ProfilePage`) com Menu Lateral (`CustomDrawer`) para fácil transição entre "Favoritos", "Mensagens", "Configurações" e "Sobre".
- **Roteamento Inteligente:** Tela de *Splash* que inspeciona a sessão de forma contínua e redireciona automaticamente usuários já logados.
- **Notificações Push:** Infraestrutura inicial utilizando `Firebase Cloud Messaging`, instanciada sob demanda com injeção de dependência via **GetIt**.

## 🛠️ Tecnologias Utilizadas

- Flutter (SDK)
- Firebase Auth
- MobX
- Google Sign-In
- Flutter Facebook Auth
- GetIt

## 🚀 Como Executar o Projeto

### 1. Pré-requisitos
- Ter o **Flutter SDK** instalado na sua máquina.
- Ter um emulador ativo ou um dispositivo físico conectado.
- Os arquivos de configuração do Firebase (`google-services.json` no Android e/ou `GoogleService-Info.plist` no iOS) devem estar configurados corretamente nas pastas nativas.

### 2. Instalação das dependências
No terminal, navegue até a raiz do projeto e execute:

```bash
flutter pub get
```

### 3. Geração de código do MobX (Build Runner)
Como o projeto usa o MobX para reatividade na camada *Store*, é necessário gerar os arquivos `.g.dart`:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Executando o aplicativo
Por fim, execute o projeto:

```bash
flutter run
```

## 📂 Estrutura Principal do Projeto
* `lib/pages/`: Contém as telas principais (Login, Profile, Messages, Splash).
* `lib/pages/login/store/`: Regras de negócio da autenticação usando MobX.
* `lib/widgets/`: Componentes visuais reaproveitáveis, como a gaveta lateral.
* `lib/services/`: Serviços como notificações via Firebase.
