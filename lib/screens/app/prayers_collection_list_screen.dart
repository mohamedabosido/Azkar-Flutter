import 'package:azkar/constants.dart';
import 'package:azkar/models/Category.dart';
import 'package:azkar/riverpod/favorite_notifier.dart';
import 'package:azkar/widgets/sub_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrayersCollectionListScreen extends ConsumerWidget {
  final Category category;

  const PrayersCollectionListScreen(this.category, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(favoriteProvider);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text(
            category.name,
            style: const TextStyle(
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
              onPressed: () {},
              icon: Image.asset(
                'images/search.png',
                width: 25,
                height: 25,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${category.subCategory.length} ذكر',
                style: const TextStyle(
                  fontSize: 16,
                  color: secondaryTextColor,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: category.subCategory.length,
                  itemBuilder: (context, index) {
                    return SubCategoryWidget(
                      category.subCategory[index],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
