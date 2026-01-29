class ApiEndPoint {
  static const String baseUrl = 'https://ecommerce.routemisr.com/';
  static const String login = 'api/v1/auth/signin';
  static const String register = 'api/v1/auth/signup';
  static const String allCategories = 'api/v1/categories';
  static const String brands = 'api/v1/brands';
  static const String products = 'api/v1/products';
  static const String cart = 'api/v1/cart';
  static const String user = 'api/v1/addresses';
  static const String favorite = 'api/v1/wishlist';
  static const String deleteCartItem = 'api/v1/cart/{productId}';
  static const String deleteFavoriteItem = 'api/v1/wishlist/{productId}';
}
