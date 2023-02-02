import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management/components/snackbar.dart';
import 'package:flutter_provider_state_management/constants/constants.dart';
import 'package:flutter_provider_state_management/database/database_helper.dart';
import 'package:flutter_provider_state_management/models/favorites_models.dart';
import 'package:flutter_provider_state_management/models/products_models.dart';
import 'package:flutter_provider_state_management/services/api_services.dart';
import 'package:flutter_provider_state_management/utilities/network_connectivity.dart';
import 'package:provider/provider.dart';

class FavoriteProviders extends ChangeNotifier {
  ApiSevices sevices = ApiSevices.service;
  DatabaseHelper? dbHelper = DatabaseHelper();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ProductModel1> _products = [];
  List<ProductModel1> get products => _products;

  final List<ProductModel1> _favorites = [];
  List<ProductModel1> get favorites => _favorites;

  ProductModel1? _productdetails;
  ProductModel1? get productdetails => _productdetails;

  void getProducts(context) async {
    _isLoading = true;
    _products = await sevices.getProducts1();
    _isLoading = false;
    notifyListeners();
  }

  void addToFavorites(context, ProductModel1 item) async {
    _isLoading = true;
    if (_favorites.contains(item)) {
      _favorites.remove(item);
      showSnackBar(context, content: 'Remove from your favorites');
    } else {
      _favorites.add(item);
      showSnackBar(context, content: 'Added to your favorites');
    }
    _isLoading = false;
    notifyListeners();
  }

  void getProductDetails(ProductModel1 item) {
    _productdetails = null;
    _productdetails = item;
    notifyListeners();
  }
}
