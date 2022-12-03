import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
  String selectedScreen = 'Home';
  void changeScreen(String screen) {
    selectedScreen = screen;
    notifyListeners();
  }
}

class HomeProviderCallBack {
  final BuildContext context;

  HomeProviderCallBack(this.context);
  HomeProvider get listener => Provider.of<HomeProvider>(context, listen: true);
  HomeProvider get notListener =>
      Provider.of<HomeProvider>(context, listen: false);
}
