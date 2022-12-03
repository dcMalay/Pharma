import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pharma/const.dart';
import 'package:pharma/provider/cart.dart';
import 'package:pharma/query/buyer/global.dart';
import 'package:pharma/view/buyer/cart/cart.dart';
import 'package:pharma/view/buyer/home/components/cart_button.dart';
import 'package:pharma/view/buyer/home/list_products.dart';
import 'package:pharma/view/buyer/home/model.dart';
import 'package:pharma/view/buyer/home/search_products.dart';
import 'package:pharma/view/buyer/main/login.dart';

class BuyerHomePage extends StatefulWidget {
  const BuyerHomePage({Key? key}) : super(key: key);

  @override
  State<BuyerHomePage> createState() => _BuyerHomePageState();
}

class _BuyerHomePageState extends State<BuyerHomePage> {
  AllCategoriesModel? tabList;
  bool isLogedin = false;
  @override
  void initState() {
    BuyerGlobalHandler.checkLogedin().then((value) {
      setState(() {
        isLogedin = value;
      });
    });
    CartProviderCallBack(context).notListener.getCartMethodProvider(context);
    tabList = AllCategoriesModel.fromJson(js);
    super.initState();
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList!.result!.length,
      child: Scaffold(
          floatingActionButton: !isLogedin
              ? FloatingActionButton.extended(
                  backgroundColor: primaryColor,
                  label: Text("Login"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return BuyerLogin();
                      },
                    ));
                  },
                )
              : FloatingActionButton.extended(
                  backgroundColor: primaryColor,
                  label: Text("Logout"),
                  onPressed: () {
                    BuyerGlobalHandler.logout();
                  },
                ),
          appBar: AppBar(
            shadowColor: primaryColor.withOpacity(0.1),
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "PharmaBag",
              style: TextStyle(color: Colors.black),
            ),
            bottom: TabBar(
                onTap: (value) {},
                // padding: const EdgeInsets.all(5),
                isScrollable: true,
                unselectedLabelColor: Colors.black,
                indicator: BoxDecoration(
                  // borderRadius: BorderRadius.circular(5),
                  color: primaryColor,
                ),
                labelColor: Colors.white,
                tabs: tabList!.result!.map((e) {
                  return Tab(
                    text: e.name,
                  );
                }).toList()),
            actions: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SearchProduct(
                          isCategorySearch: false,
                        );
                      },
                    ));
                  },
                  child: Container(
                    width: 40,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: primaryColor.withOpacity(0.1)),
                    child: Center(
                      child: Icon(
                        Icons.search,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              CartButton()
            ],
          ),
          // body: ta,
          body: TabBarView(
            children: tabList!.result!
                .asMap()
                .map((key, value) {
                  return MapEntry(
                    key,
                    GridView.builder(
                        padding: const EdgeInsets.all(20.0),
                        itemCount: value.list!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          var ds = value.list![index];
                          var name = value.name;
                          return Card(
                              shadowColor: primaryColor.withOpacity(0.1),
                              elevation: 10,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return BuyerProductList(
                                          categoryName: name,
                                          subCategoryName: ds,
                                        );
                                      },
                                    ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                      ds.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  )));
                        }),
                  );
                })
                .values
                .toList(),
          )),
    );
  }
}
