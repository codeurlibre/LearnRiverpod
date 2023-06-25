// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/suggestion.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<Suggestion> getSuggestion() async {
    try {
      // const String api = "https://www.boredapi.com/api/activity";
      const String api = "https://jsonplaceholder.typicode.com/users/1";
      final res = await Dio().get(api);
      return Suggestion.fromJson(res.data);
    } catch (e) {
      print(e);
      throw Exception("Error getting suggestion");
    }
  }
}
