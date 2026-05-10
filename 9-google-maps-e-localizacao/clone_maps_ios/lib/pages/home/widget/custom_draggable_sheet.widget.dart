import 'package:flutter/material.dart';

class CustomDraggableSheet extends StatelessWidget {
  const CustomDraggableSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0.08,
      maxChildSize: 0.95,
      initialChildSize: 0.4,
      snapSizes: const [0.4],
      snap: true,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color(0xFF121212),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            padding: const .all(15),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Center(
                  child: Container(
                    width: 50,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: .zero,
                            hintText: "Buscar no App Maps",
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[900],
                            border: OutlineInputBorder(
                              borderRadius: .circular(10),
                              borderSide: .none,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                          ),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    CircleAvatar(child: Text("EM")),
                    SizedBox(height: 15),
                    Text(
                      "Sugestões da Siri",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: .bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
