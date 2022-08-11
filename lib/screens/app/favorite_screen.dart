import 'package:azkar/constants.dart';
import 'package:azkar/riverpod/favorite_notifier.dart';
import 'package:azkar/widgets/sub_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorite = ref.watch(favoriteProvider);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: const Text(
          'المفضلة',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        flexibleSpace: const Image(
          image: AssetImage('images/back.png'),
          fit: BoxFit.cover,
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/prayer_times_screen');
            },
            icon: Image.asset(
              'images/rock.png',
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: favorite.getFavorite.length,
          itemBuilder: (context, index) {
            return SubCategoryWidget(
              favorite.getFavorite[index],
            );
          },
        ),
      ),
    );
  }
}
