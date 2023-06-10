import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = "snack_screen";

  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text("Hola mundo"),
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Estas seguro?"),
        content: const Text(
            "Nostrud laborum aliquip esse sit nisi esse nulla laborum. Magna eu eiusmod qui aliqua est culpa fugiat est aute qui velit veniam. Laboris elit ex mollit ut veniam incididunt elit deserunt culpa nostrud."),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text("Cancelar")),
          FilledButton(
              onPressed: () => context.pop(), child: const Text("Aceptar"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Snackbars y Dialogos")),
      body: Center(
        child: Column(children: [
          
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      "Est dolore fugiat nostrud occaecat elit minim. Elit velit veniam ad dolor nostrud sit tempor. Cupidatat tempor elit irure sit qui quis irure. Eiusmod duis esse qui irure culpa duis nostrud deserunt enim cillum ea.")
                ]);
              },
              child: const Text("Licencias usadas")),
          FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text("Mostrar dialogo")),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => showCustomSnackbar(context),
          label: const Text("Mostrar Snackbar"),
          icon: const Icon(Icons.remove_red_eye_outlined)),
    );
  }
}
