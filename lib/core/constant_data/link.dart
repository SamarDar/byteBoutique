

class AppLink {
  static String api = "https://task.focal-x.com/api";
  static String register = "$api/register";
  static String login = "$api/login";
  static String logout = "$api/logout";
  static String allCategories = "$api/categories";
  static String allProducts = "$api/products";
  static String allOrders = "$api/orders";

  static Map<String, String> getHeader() {
    Map<String, String> mainHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json"
    };
    return mainHeader;
  }

  static Map<String, String> getHeaderWithToken(String? token) {
    Map<String, String> mainHeader = {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token}"
    };
    print("------------Token: ${token}");
    return mainHeader;
  }
}
