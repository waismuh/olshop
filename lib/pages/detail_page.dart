import 'package:aostes/components/text.dart';
import 'package:aostes/pages/cart_page.dart';
import 'package:aostes/utils/constant.dart';
import 'package:flutter/material.dart';

const List<Widget> fruits = <Widget>[
  Text('S'),
  Text('M'),
  Text('L'),
  Text('XL')
];

class DetailPage extends StatefulWidget {
  final String title, name, mount, rating, image;
  const DetailPage({super.key, required this.title, required this.name, required this.mount, required this.rating, required this.image});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final List<bool> _selectedSize = <bool>[false, false, false, false];
  bool vertical = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Icon(
            Icons.favorite,
            color: ColorUI.CREAM_ACCENT,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Container(
            child: Image.asset(widget.image),
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: texth7(
                      color: ColorUI.PRIMARY_TEXT,
                      size: 18,
                      fontweight: FontWeight.bold),
                ),
                Container(
                  decoration: BoxDecoration(
                      color:
                      ColorUI.TEXT_1,
                      border: Border.all(
                          color: ColorUI
                              .TEXT_1),
                      borderRadius:
                      BorderRadius
                          .all(Radius
                          .circular(
                          5))),
                  padding: EdgeInsets
                      .symmetric(
                      vertical: 1,
                      horizontal: 3),
                  child: Row(
                    mainAxisSize:
                    MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star_border_outlined,
                        color:
                        ColorUI.WHITE,
                        size: 18,
                      ),
                      Text(
                        widget.rating,
                        style: texth7(
                          color: ColorUI
                              .WHITE,
                          size: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.mount,
              style: texth7(
                color:
                ColorUI.PRIMARY_TEXT,
                size: 18,
                  fontweight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "- Lorem ipsum, in graphical and textual context",
              style: texth7(
                  color:
                  ColorUI.PRIMARY_TEXT,
                  size: 14,
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ToggleButtons(
              direction: vertical ? Axis.vertical : Axis.horizontal,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < _selectedSize.length; i++) {
                    _selectedSize[i] = i == index;
                  }
                });
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.red[700],
              selectedColor: Colors.white,
              fillColor: Colors.red[200],
              color: Colors.red[400],
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              isSelected: _selectedSize,
              children: fruits,
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: ColorUI.WHITE,
        padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                  borderRadius:
                  BorderRadius.all(Radius.circular(8))),
              child: Icon(Icons.shopping_bag_rounded),
            ),
            Expanded(
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CartPage()),
                  );
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 20),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: ColorUI.TEXT_1,
                      border: Border.all(color: ColorUI.TEXT_1),
                      borderRadius:
                      BorderRadius.all(Radius.circular(8))),
                  child: Text("Add to Cart", textAlign: TextAlign.center,style: texth7(
                    color:
                    ColorUI.WHITE,
                    size: 14,
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
