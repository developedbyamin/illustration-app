import 'package:flutter/material.dart';
import 'package:interntask/domain/usecases/toggle_favorite_status.dart';

class FavoriteState extends ChangeNotifier {
  bool _isFavorite = false;

  bool get isFavorite => _isFavorite;

  ToggleFavoriteStatus favoriteStatus = ToggleFavoriteStatus();
  void toggleFavorite() {
    _isFavorite = favoriteStatus.execute(_isFavorite);
    notifyListeners();
  }
}
