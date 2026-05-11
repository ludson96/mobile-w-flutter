import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDraggableSheet extends StatelessWidget {
  final _draggableController = DraggableScrollableController();

  CustomDraggableSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _draggableController,
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
                GestureDetector(
                  onTap: () {
                    final size = _draggableController.size > 0.5 ? 0.08 : 0.95;

                    _draggableController.animateTo(
                      size,
                      duration: Durations.medium2,
                      curve: Curves.easeIn,
                    );
                  },
                  child: Center(
                    child: Container(
                      width: 50,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        borderRadius: BorderRadius.circular(50),
                      ),
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
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      child: Text("EM"),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Sugestões da Siri",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: .bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 80,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red[400],
                        child: const Icon(
                          CupertinoIcons.map_pin,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: .center,
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              "19 min até perto de Avenida Porto Seguro",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: .bold,
                                fontSize: 16,
                                height: 1.1,
                              ),
                              overflow: .ellipsis,
                              maxLines: 1,
                            ),
                            Text(
                              "Pegue a Avenida Sao Paulo, o trânsito está leve",
                              style: TextStyle(color: Colors.grey, height: 1.1),
                              overflow: .ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      "Favoritos",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: .bold,
                      ),
                    ),
                    Text(
                      "Mais",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: .bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 150,
                  width: double.infinity,
                  padding: const .all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.separated(
                    scrollDirection: .horizontal,
                    itemCount: 3,
                    itemBuilder: (_, index) {
                      final isLast = index == 2;

                      if (isLast) {
                        return Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey[800],
                              radius: 30,
                              child: const Icon(
                                CupertinoIcons.add,
                                color: Colors.blue,
                                size: 35,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Adicionar",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1.1,
                              ),
                            ),
                          ],
                        );
                      }

                      return Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[800],
                            radius: 30,
                            child: const Icon(
                              CupertinoIcons.home,
                              color: Colors.blue,
                              size: 35,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Casa",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              height: 1.1,
                            ),
                          ),
                          const Text(
                            "Adicionar",
                            style: TextStyle(color: Colors.grey, height: 1.1),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (_, _) {
                      return const SizedBox(width: 20);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
