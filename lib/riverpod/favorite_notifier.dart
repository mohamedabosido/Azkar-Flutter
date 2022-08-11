import 'package:azkar/constants.dart';
import 'package:azkar/models/SubCategorey.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteProvider = ChangeNotifierProvider((ref) => FavoriteNotifier());

class FavoriteNotifier extends ChangeNotifier {
  final List<SubCategory> _favorite = favorite;

  List<SubCategory> get getFavorite => _favorite;

  void add({required SubCategory subCategory}) {
    if (!_favorite.contains(subCategory)) {
      _favorite.add(subCategory);
      notifyListeners();
    }
  }

  void delete({required SubCategory subCategory}) {
    _favorite.remove(subCategory);
    notifyListeners();
  }
}
