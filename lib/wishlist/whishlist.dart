import 'package:flutter/material.dart';

import 'views/wishlist_app.dart';
class Wishlist extends StatelessWidget {
  const Wishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return const WishlistApp(title: "Board Games Wishlist",);
  }
}
