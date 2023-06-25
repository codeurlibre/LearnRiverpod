import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final usernameProvider = Provider<String>((ref) => "Hugues");
final countNumber = Provider<int>((ref) => 0);

/*class ProviderPage extends ConsumerWidget {
  const ProviderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(usernameProvider);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        title: Text(username),
        centerTitle: true,
      ),
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return Center(
            child: Text(
              "The value is: ${ref.watch(countNumber)}",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          );
        },
      ),
    );
  }
}*/

class ProviderPage extends ConsumerStatefulWidget {
  const ProviderPage({super.key});

  @override
  ConsumerState createState() => _ProviderPageState();
}

class _ProviderPageState extends ConsumerState<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    final username = ref.watch(usernameProvider);
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          title: const Text("Provider"),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            " Your name is: $username",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ));
  }
}
