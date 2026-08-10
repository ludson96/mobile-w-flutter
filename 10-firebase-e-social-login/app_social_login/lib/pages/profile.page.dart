import 'package:app_social_login/pages/about.page.dart';
import 'package:app_social_login/pages/favorites.page.dart';
import 'package:app_social_login/pages/login/login.page.dart';
import 'package:app_social_login/pages/login/store/login.store.dart';
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

  Future<void> _handleSignOut() async {
    await GetIt.I<LoginStore>().signOut();
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawer(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) async {
          if (index == 5) {
            await _handleSignOut();
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
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
        Center(
          child: ElevatedButton.icon(
            onPressed: _handleSignOut,
            icon: const Icon(Icons.exit_to_app),
            label: const Text('Sair da conta'),
          ),
        ),
      ][_selectedIndex],
    );
  }
}
