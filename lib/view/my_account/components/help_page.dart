import 'package:flutter/material.dart';
import '../../../const.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  List<Item> _items = [
    Item(
        questionTitle: 'Where we can found our new and past orders?',
        questionAnswer:
            'Answer: Go to order section in the bottom bar there you can find your new and past orders.'),
    Item(
        questionTitle: "What's purpose of vacation mode toggle button?",
        questionAnswer:
            'Answer: you can use the vacation mode button to deactivate your acount for some time.'),
    Item(
        questionTitle: 'How to filter my stock products?',
        questionAnswer:
            'Answer: you can see a filter icon at the top bar ,after clicking on this button you will redirect to another page and there you can filter your products.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: blackColor,
          ),
          title: Text('Help', style: TextStyle(color: blackColor)),
          centerTitle: true,
          backgroundColor: Colors.white,
          // elevation: 0.0,
          shadowColor: primaryColor.withOpacity(0.1),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.all(20),
                  height: 30,
                  child: Text(
                    'FAQ',
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              ExpansionPanelList.radio(
                animationDuration: const Duration(seconds: 1),
                expandedHeaderPadding: EdgeInsets.all(10),
                dividerColor: primaryColor,
                elevation: 4,
                initialOpenPanelValue: 3,
                expansionCallback: (int index, bool isExpanded) {},
                children: _items
                    .map((item) => _buildExpansionPanelRadio(item))
                    .toList(),
              ),
            ],
          ),
        ));
  }
}

ExpansionPanelRadio _buildExpansionPanelRadio(Item item) {
  return ExpansionPanelRadio(
    value: item.questionTitle,
    // backgroundColor: Colors.lightBlueAccent,
    canTapOnHeader: true,
    headerBuilder: (BuildContext context, bool isExpanded) {
      return Container(
        child: ListTile(
          title: Text(item.questionTitle),
        ),
      );
    },
    body: ListTile(
      subtitle: Text(item.questionAnswer),
    ),
  );
}

class Item {
  final String questionTitle;
  final String questionAnswer;

  Item({required this.questionTitle, required this.questionAnswer});
}
