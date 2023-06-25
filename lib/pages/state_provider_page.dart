// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/user.dart';

final valueStateProvider = StateProvider<int>((ref) => 0);
final colorProvider = StateProvider<Color>((ref) => Colors.purple);
final userProvider = StateNotifierProvider<UserNotifier, User>(
    (ref) => UserNotifier(/*User(name: "", age: 0)*/));

class StateProviderPage extends ConsumerWidget {
  const StateProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueStateProvider);
    final colorChange = ref.watch(colorProvider);
    final user = ref.watch(userProvider);
    ref.listen(valueStateProvider, (previous, next) {
      if (next == 10) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "value is $next",
          ),
        ));
      } else if (next == 0) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("value is $next")));
      }
    });
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: colorChange,
        title: Text(user.name),
        actions: [
          GestureDetector(
            onTap: () => ref.refresh(valueStateProvider),
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onSubmitted: (value) {
                    ref.watch(userProvider.notifier).updateName(value);
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  onSubmitted: (value) {
                    ref
                        .watch(userProvider.notifier)
                        .updateAge(int.parse(value));
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  user.age.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "The value is: $value",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(colorChange),
                        foregroundColor: MaterialStateProperty.all(
                            colorChange == Colors.purple
                                ? Colors.white
                                : Colors.black),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                    onPressed: () {
                      ref.read(valueStateProvider.notifier).state++;
                      /*ref
                          .read(valueStateProvider.notifier)
                          .update((state) => state + 2);*/
                    },
                    child: const Text("Increment")),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(colorChange),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                    onPressed: () {
                      ref.read(colorProvider.notifier).update((state) =>
                          state == Colors.purple ? Colors.blue : Colors.purple);
                    },
                    child: const Text("Update color"))
              ],
            ),
          );
        },
      ),
    );
  }
}
