import 'package:flutter/foundation.dart';
import 'package:food_delivery_app/screen/home/models/order.dart';

class MyProvider extends ChangeNotifier {
  int currentIndex = 0;
  String activeScreen = 'home';

  var orders = [Order(), Order(), Order(), Order(), Order(), Order()];

  updateOrderStatus(int index, String status) {
    orders[index].status = status;
    notifyListeners();
  }

  String getActiveScreen() => activeScreen;

  updateScreen(String screen) {
    activeScreen = screen;
  }

  int getCurrentIndex() => currentIndex;

  updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
