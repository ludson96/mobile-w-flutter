import 'package:app_social_login/pages/about.page.dart';
import 'package:app_social_login/pages/favorites.page.dart';
import 'package:app_social_login/pages/messages.page.dart';
import 'package:app_social_login/pages/settings.page.dart';
import 'package:app_social_login/services/firebase_notification.service.dart';
import 'package:app_social_login/widgets/custom_drawer.widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

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

    GetIt.I<FirebaseNotificationService>().initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawer(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
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
        const FavoritesPage(),
        const MessagePage(),
        const SettingsPage(),
        const AboutPage(),
        const Center(child: Text('Ação de Sair')),
      ][_selectedIndex],
    );
  }
}
