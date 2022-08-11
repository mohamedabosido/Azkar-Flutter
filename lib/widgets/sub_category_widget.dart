import 'package:azkar/constants.dart';
import 'package:azkar/models/SubCategorey.dart';
import 'package:azkar/riverpod/favorite_notifier.dart';
import 'package:azkar/screens/app/prayers_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubCategoryWidget extends ConsumerWidget {
  final SubCategory subCategory;

  const SubCategoryWidget(
    this.subCategory, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: backgroundColor,
            blurRadius: 2,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PrayersDetailsScreen(
                    subCategory,
                    // index: index,
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    subCategory.name,
                    style: const TextStyle(
                        color: primaryTextColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${subCategory.prayers.length} دعاء',
                    style: const TextStyle(
                        color: purpleColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: Colors.grey.withOpacity(0.1),
            child: favorite.contains(subCategory)
                ? InkWell(
                    onTap: () {
                      ref
                          .read(favoriteProvider)
                          .delete(subCategory: subCategory);
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.favorite,
                          color: purpleColor,
                        ),
                        Text(
                          ' إزالة من المفضلة',
                          style: TextStyle(
                              color: purpleColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      ref.read(favoriteProvider).add(subCategory: subCategory);
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.favorite_border_outlined,
                          color: secondaryTextColor,
                        ),
                        Text(
                          ' إضافة للمفضلة',
                          style: TextStyle(
                              color: secondaryTextColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
