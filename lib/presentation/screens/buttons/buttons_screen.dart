import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = "buttons_screen";

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons Screen"),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Wrap(
            spacing: 10,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {}, child: const Text("Elevated Button")),

              const ElevatedButton(
                  onPressed: null, child: Text("Elevated Button disabled")),

              ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.access_alarm_rounded),
                  label: const Text("Elevated Icon")),

              FilledButton(
                onPressed: () {},
                child: const Text("Filled"),
              ),

              FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.access_time_sharp),
                  label: const Text("Filled Icon")),

              OutlinedButton(
                  onPressed: () {}, child: const Text("Outline button")),

              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.wysiwyg),
                label: const Text("Outline Icon"),
              ),

              TextButton(onPressed: () {}, child: const Text("Text")),

              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add_business),
                  label: const Text("Text Icon")),

                const CustomButton(),




              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.face_4_rounded)),

              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.face_4_rounded),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: const MaterialStatePropertyAll(Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text("Custom Button", style: TextStyle(color:Colors.white))
            ),
        ),
      ),
    );
  }
}