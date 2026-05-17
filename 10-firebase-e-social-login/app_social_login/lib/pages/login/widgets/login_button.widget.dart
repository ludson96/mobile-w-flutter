import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String? pathImage;
  final IconData? icon;
  final String text;
  final void Function()? onPressed;
  final bool isLoading;

  const LoginButton({
    super.key,
    this.pathImage,
    this.icon,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Fazendo dessa forma eu impeço que o usuário possa clicar uma segunda vez enquanto está carregando.
      onTap: isLoading ? null : onPressed,
      borderRadius: .circular(55),
      child: Container(
        height: 60,
        padding: const .symmetric(horizontal: 20),
        decoration: BoxDecoration(
          border: .all(color: Colors.grey),
          borderRadius: .circular(55),
        ),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Row(
                children: [
                  if (pathImage != null) Image.asset(pathImage!, width: 25),
                  if (icon != null) Icon(icon!),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Align(
                      alignment: .center,
                      child: Text(
                        text,
                        style: TextStyle(
                          fontWeight: .w600,
                          color: Colors.green[800],
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
