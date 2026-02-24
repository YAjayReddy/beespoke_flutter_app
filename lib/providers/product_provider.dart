import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';
import 'package:hive/hive.dart';
import '../screens/history_screen.dart';

class ProductProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Product> _products = [];
  bool _isLoading = false;
  String? _error;
  int? _selectedProductId;
  int? get selectedProductId => _selectedProductId;
  final Set<int> _likedProducts = {};
  final Box _box = Hive.box('preferences');
  List<Product> get products => _products;
  List<Product> get likedProducts =>
      products.where((product) => isLiked(product.id)).toList();
  bool get isLoading => _isLoading;
  String? get error => _error;
  ProductProvider() {
    _loadLikedProducts();
  }
  void clearSelectedProduct() {
    _selectedProductId = null;
  }
  void _loadLikedProducts() {
    final savedLikes = _box.get('likedProducts', defaultValue: []);
    _likedProducts.addAll(List<int>.from(savedLikes));
  }
  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      _products = await _apiService.fetchProducts();
      _error = null;
    } catch (e) {
      print("API ERROR: $e");
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
  void selectProduct(int id) {
    _selectedProductId = id;
    notifyListeners();
  }

  void toggleLike(int productId) {
    if (_likedProducts.contains(productId)) {
      _likedProducts.remove(productId);
    } else {
      _likedProducts.add(productId);
    }

    _box.put('likedProducts', _likedProducts.toList());

    notifyListeners();
  }

  bool isLiked(int productId) {
    return _likedProducts.contains(productId);
  }
}