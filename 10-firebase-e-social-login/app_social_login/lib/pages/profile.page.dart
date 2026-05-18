import 'package:app_social_login/services/firebase_notification.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ExampleDestination {
  const ExampleDestination(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination('Perfil', Icon(Icons.person_outline), Icon(Icons.person)),
  ExampleDestination(
    'Favoritos',
    Icon(Icons.favorite_outline),
    Icon(Icons.favorite),
  ),
  ExampleDestination(
    'Mensagens',
    Icon(Icons.email_outlined),
    Icon(Icons.email),
  ),
];

const List<ExampleDestination> destinationsApps = <ExampleDestination>[
  ExampleDestination(
    'Configurações',
    Icon(Icons.settings_outlined),
    Icon(Icons.settings),
  ),
  ExampleDestination('Sobre', Icon(Icons.info_outline), Icon(Icons.info)),
  ExampleDestination(
    'Sair',
    Icon(Icons.exit_to_app_outlined),
    Icon(Icons.exit_to_app),
  ),
];

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Iniciamos com 1, pois é o índice correspondente à página de 'Profile' na sua lista 'destinations'
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();

    FirebaseNotificationService().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: .stretch,
          children: <Widget>[
            Container(
              color: const Color(0xFFece2d3),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      FirebaseAuth.instance.currentUser!.photoURL!,
                    ),
                    radius: 40,
                  ),
                  const SizedBox(height: 5),
                  Text(FirebaseAuth.instance.currentUser!.displayName!),
                ],
              ),
            ),
            const SizedBox(height: 12),
            ...destinations.asMap().entries.map((entry) {
              final int index = entry.key;
              final ExampleDestination destination = entry.value;
              final bool isSelected = _selectedIndex == index;

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 2.0,
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  selected: isSelected,
                  selectedTileColor: Colors.blue,
                  leading: isSelected
                      ? destination.selectedIcon
                      : destination.icon,
                  title: Text(
                    destination.label,
                    style: TextStyle(
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                    Navigator.pop(context);
                  },
                ),
              );
            }),
            const SizedBox(height: 10),
            const Divider(color: Colors.grey),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 2.0,
              ),
              child: Text("Aplicativo", style: TextStyle(fontWeight: .w500)),
            ),
            const SizedBox(height: 20),
            ...destinationsApps.asMap().entries.map((entry) {
              final int index = entry.key + destinations.length;
              final ExampleDestination destination = entry.value;
              final bool isSelected = _selectedIndex == index;

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 2.0,
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  selected: isSelected,
                  selectedTileColor: Colors.blue,
                  leading: isSelected
                      ? destination.selectedIcon
                      : destination.icon,
                  title: Text(
                    destination.label,
                    style: TextStyle(
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                    Navigator.pop(context);
                  },
                ),
              );
            }),
          ],
        ),
      ),
      // Exibe um Widget diferente com base no índice atual selecionado no Drawer
      body: <Widget>[
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (FirebaseAuth.instance.currentUser != null)
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    FirebaseAuth.instance.currentUser!.photoURL!,
                  ),
                  radius: 80,
                ),
              const SizedBox(height: 20),
              if (FirebaseAuth.instance.currentUser != null)
                Text(FirebaseAuth.instance.currentUser!.displayName!),
              const SizedBox(height: 20),
            ],
          ),
        ),
        const Center(child: Text('Página de Favoritos')),
        const Center(child: Text('Página de Mensagens')),
        const Center(child: Text('Página de Configurações')),
        const Center(child: Text('Página Sobre')),
        const Center(child: Text('Ação de Sair')),
      ][_selectedIndex],
    );
  }
}
