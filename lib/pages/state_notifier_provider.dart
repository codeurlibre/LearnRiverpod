import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/pages/counter_demo.dart';

final countProvider =
    StateNotifierProvider<CounterDemo, int>((ref) => CounterDemo());

class SateNotifierProviderPage extends ConsumerWidget {
  const SateNotifierProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          title: const Text("Sate Notifier Provider"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text(
                  " Counter is: $count",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)))),
                  onPressed: () {
                    ref.read(countProvider.notifier).increment();
                    CounterDemo().increment();
                    /*ref
                            .read(valueStateProvider.notifier)
                            .update((state) => state + 2);*/
                  },
                  child: const Text("Increment")),
            ],
          ),
        ));
  }
}
