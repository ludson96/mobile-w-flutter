import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerItem {
  const DrawerItem(this.label, this.icon, this.selectedIcon);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
}

const List<DrawerItem> mainDrawerItems = <DrawerItem>[
  DrawerItem('Perfil', Icon(Icons.person_outline), Icon(Icons.person)),
  DrawerItem('Favoritos', Icon(Icons.favorite_outline), Icon(Icons.favorite)),
  DrawerItem('Mensagens', Icon(Icons.email_outlined), Icon(Icons.email)),
];

const List<DrawerItem> appDrawerItems = <DrawerItem>[
  DrawerItem(
    'Configurações',
    Icon(Icons.settings_outlined),
    Icon(Icons.settings),
  ),
  DrawerItem('Sobre', Icon(Icons.info_outline), Icon(Icons.info)),
  DrawerItem('Sair', Icon(Icons.exit_to_app_outlined), Icon(Icons.exit_to_app)),
];

class CustomDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const CustomDrawer({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            color: const Color(0xFFece2d3),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                if (user?.photoURL != null)
                  CircleAvatar(
                    backgroundImage: NetworkImage(user!.photoURL!),
                    radius: 40,
                  ),
                const SizedBox(height: 5),
                if (user?.displayName != null) Text(user!.displayName!),
              ],
            ),
          ),
          const SizedBox(height: 12),
          ...mainDrawerItems.asMap().entries.map((entry) {
            final int index = entry.key;
            final DrawerItem destination = entry.value;
            final bool isSelected = selectedIndex == index;

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
                  Navigator.pop(context); // Fecha o drawer primeiro
                  onDestinationSelected(index); // Aciona a ação da tela
                },
              ),
            );
          }),
          const SizedBox(height: 10),
          const Divider(color: Colors.grey),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
            child: Text(
              "Aplicativo",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 20),
          ...appDrawerItems.asMap().entries.map((entry) {
            final int index = entry.key + mainDrawerItems.length;
            final DrawerItem destination = entry.value;
            final bool isSelected = selectedIndex == index;

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
                  Navigator.pop(context); // Fecha o drawer
                  onDestinationSelected(index); // Aciona a ação
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
