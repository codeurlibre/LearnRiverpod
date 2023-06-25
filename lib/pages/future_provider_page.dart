import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_riverpod/models/suggestion.dart';
import 'package:learn_riverpod/services/api_service.dart';

final suggestionFutureProvider = FutureProvider<Suggestion>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getSuggestion();
});

class FutureProviderPage extends ConsumerWidget {
  const FutureProviderPage({super.key /*, required this.color*/
      });

  // final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionRef = ref.watch(suggestionFutureProvider);
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          title: const Text("Future Provider"),
        ),
        body: RefreshIndicator(
          onRefresh: () => ref.refresh(suggestionFutureProvider.future),
          child: ListView(
            children: [
              Center(
                child: suggestionRef.when(
                  data: (data) {
                return Text(

                  data.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                );
                  },
                  error: (error, stackTrace) {
                return Text(error.toString());
                  },
                  loading: () => const CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ));
  }
}
