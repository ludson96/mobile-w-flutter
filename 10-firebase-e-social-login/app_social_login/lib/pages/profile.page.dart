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
  final int initialIndex;

  const ProfilePage({super.key, this.initialIndex = 0});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();

    _selectedIndex = widget.initialIndex;

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
