import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = "counter_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkmodeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Screen"),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(isDarkmodeProvider.notifier).update((state) => !state);
              },
              //icon: Icon(Icons.dark_mode_outlined)
              icon: Icon(isDarkMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined))
        ],
      ),
      body: Center(
        child: Text("valor $clickCounter ",
            style: Theme.of(context).textTheme.titleLarge),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
           // ref.read(counterProvider.notifier).state++;
            ref.read(counterProvider.notifier).update((state) => state + 1);
          },
          label: const Text("Incrementar"),
          icon: const Icon(Icons.add)),
    );
  }
}
