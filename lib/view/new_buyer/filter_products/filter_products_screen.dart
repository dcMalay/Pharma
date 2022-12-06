import 'package:flutter/material.dart';
import 'package:pharma/const.dart';

class FilterProductsScreen extends StatefulWidget {
  const FilterProductsScreen({super.key, required this.isSeller});
  final bool isSeller;
  @override
  State<FilterProductsScreen> createState() => _FilterProductsScreenState();
}

class _FilterProductsScreenState extends State<FilterProductsScreen> {
  bool isClicked = false;
  var _dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: blackColor,
              )),
          automaticallyImplyLeading: false,
          elevation: 1,
          centerTitle: true,
          backgroundColor: Colors.white,
          // leading: InkWell(
          //   onTap: () {},
          //   child: Icon(
          //     Icons.menu,
          //     color: primaryColor,
          //     size: 30,
          //   ),
          // ),
          title: Text(
            'Filter products',
            style: TextStyle(color: blackColor),
          )),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FILTER BY PRICE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Min-00',
                        fillColor: Colors.grey,
                        border: OutlineInputBorder()),
                  ),
                )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Max-5k',
                          fillColor: Colors.grey,
                          border: OutlineInputBorder()),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'FILTER BY EXPIRY',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButton(
              borderRadius: BorderRadius.circular(6),
              value: _dropDownValue,
              hint: const Text('less than 3 months'),
              items: [
                DropdownMenuItem<String>(
                    value: 'less than 3 months',
                    child: Text('less than 3 months')),
                DropdownMenuItem<String>(
                    value: 'less than 6 months',
                    child: Text('less than 6 months')),
              ],
              onChanged: (items) {},
            ),
            SizedBox(
              height: 10,
            ),
            widget.isSeller
                ? Container()
                : Text(
                    'FILTER BY ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            widget.isSeller
                ? Container()
                : Divider(
                    color: Colors.grey,
                  ),
            widget.isSeller
                ? Container()
                : ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    leading: Checkbox(
                        value: isClicked,
                        onChanged: (v) {
                          setState(() {
                            isClicked = v!;
                          });
                        }),
                    title: Text(
                      'New Items',
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Text(
                      '(13)',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
            widget.isSeller
                ? Container()
                : ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    leading: Checkbox(value: false, onChanged: (v) {}),
                    title: Text(
                      'Best Selling',
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Text(
                      '(35)',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
            widget.isSeller
                ? Container()
                : ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    leading: Checkbox(value: false, onChanged: (v) {}),
                    title: Text(
                      'Discount Items',
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Text(
                      '(59)',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
            SizedBox(
              height: 10,
            ),
            Text(
              'FILTER BY TYPE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'Strip',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'Bottle',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'Tube',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'Vial',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'PFS',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Text(
              'LOCATION',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Kolkata',
                  fillColor: Colors.grey,
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Pincode - 700 001',
                  fillColor: Colors.grey,
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'DISCOUNT TYPE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Search ...',
                  fillColor: Colors.grey,
                  border: OutlineInputBorder()),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'All',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'Discount PTR Only',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'Same Product Bonus',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'Same Product Bonus & Discount',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'Different Product Bonus & DisCount',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'CATEGORY',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Search ...',
                  fillColor: Colors.grey,
                  border: OutlineInputBorder()),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'All Category',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Text(
                '(13)',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'Ethical',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Text(
                '(13)',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'Generic',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Text(
                '(13)',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'OTC',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Text(
                '(13)',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'Ayurvedic',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Text(
                '(13)',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'Surgical',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Text(
                '(13)',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'Critical Care',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Text(
                '(13)',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Checkbox(value: false, onChanged: (v) {}),
              title: Text(
                'Others',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Text(
                '(13)',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
