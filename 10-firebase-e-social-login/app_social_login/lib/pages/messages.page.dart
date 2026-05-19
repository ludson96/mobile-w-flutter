import 'package:app_social_login/pages/profile.page.dart';
import 'package:app_social_login/widgets/custom_drawer.widget.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawer(
        selectedIndex: 2, // Índice correspondente à página de "Mensagens"
        onDestinationSelected: (index) {
          // Como abrimos essa tela via pushReplacement, o gerenciador
          // de navegação original (ProfilePage) não está mais na pilha.
          // Portanto, precisamos voltar/redirecionar para a página principal:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ProfilePage(initialIndex: index),
            ),
          );
        },
      ),
      body: const Center(child: Text('Página de Mensagens')),
    );
  }
}
