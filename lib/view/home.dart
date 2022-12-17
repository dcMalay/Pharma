import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pharma/const.dart';
import 'package:pharma/provider/home.dart';
import 'package:pharma/view/add_stock/add_stock.dart';
import 'package:pharma/view/home/home.dart';
import 'package:pharma/view/orders/order.dart';
import 'package:pharma/view/settlements/settlement.dart';
import 'package:pharma/view/stock/new_stock_screen.dart';
import 'package:remixicon/remixicon.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeProviderCallBack(context).listener.selectedScreen == "Home"
          ? const HomeTab()
          : HomeProviderCallBack(context).listener.selectedScreen ==
                  "Settelment"
              ? const SettlementTab()
              : HomeProviderCallBack(context).listener.selectedScreen ==
                      "Orders"
                  ? const OrderTab()
                  : HomeProviderCallBack(context).listener.selectedScreen ==
                          "Stocks"
                      ? const NewStockScreen()
                      : HomeProviderCallBack(context).listener.selectedScreen ==
                              "Add Stock"
                          ? AddStock()
                          : Container(),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AddStock();
            },
          ));
        },
        child: const Icon(Ionicons.add),
      ),
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'Add Stock',
        color: greyColor,
        selectedColor: primaryColor,
        //  notchedShape: const CircularNotchedRectangle(),
        onTabSelected: (int index) {
          if (index == 0) {
            HomeProviderCallBack(context).notListener.changeScreen("Home");
          } else if (index == 1) {
            HomeProviderCallBack(context)
                .notListener
                .changeScreen("Settelment");
          } else if (index == 2) {
            HomeProviderCallBack(context).notListener.changeScreen("Stocks");
          } else if (index == 3) {
            HomeProviderCallBack(context).notListener.changeScreen("Orders");
          }
        },
        items: [
          FABBottomAppBarItem(iconData: Remix.home_smile_2_line, text: 'Home'),
          FABBottomAppBarItem(
              iconData: Remix.hand_coin_line, text: 'Settlement'),
          FABBottomAppBarItem(
              iconData: Remix.inbox_archive_line, text: 'Stocks'),
          FABBottomAppBarItem(
              iconData: Remix.shopping_bag_2_line, text: 'Orders'),
        ],
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class FABBottomAppBarItem {
  FABBottomAppBarItem({required this.iconData, required this.text});
  IconData iconData;
  String text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    Key? key,
    required this.items,
    required this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    required this.backgroundColor,
    required this.color,
    required this.selectedColor,
    // required this.notchedShape,
    required this.onTabSelected,
  }) : super(key: key) {
    assert(this.items.length == 2 || this.items.length == 4);
  }
  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final Color backgroundColor;
  final Color color;
  final Color selectedColor;
  // final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      // shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(
              widget.centerItemText,
              style: TextStyle(color: widget.color, fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text,
                  style: TextStyle(color: color, fontSize: 13),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
