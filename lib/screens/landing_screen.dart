import 'package:flutter/material.dart';
import 'package:home_design/customs/border_box.dart';
import 'package:home_design/customs/option_button.dart';
import 'package:home_design/utils/constants.dart';
import 'package:home_design/utils/custom_function.dart';
import 'package:home_design/utils/sample_data.dart';
import 'package:home_design/utils/widget_functions.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.white,
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BorderBox(
                          width: 50,
                          hight: 50,
                          child: Icon(
                            Icons.menu,
                            color: COLOR_BLACK,
                          )),
                      BorderBox(
                          width: 50,
                          hight: 50,
                          child: Icon(Icons.settings, color: COLOR_BLACK))
                    ],
                  ),
                ),
                addVerticalSpace(padding),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    "City",
                    style: themeData.textTheme.bodyMedium,
                  ),
                ),
                addVerticalSpace(10),
                Padding(
                  padding: sidePadding,
                  child: Text(
                    "San Francisco",
                    style: themeData.textTheme.displayLarge,
                  ),
                ),
                Padding(
                  padding: sidePadding,
                  child: Divider(
                    height: 19,
                    color: COLOR_GREY,
                  ),
                ),
                addVerticalSpace(10),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ["<\$220,000", "For Sale", "3-4 Beds", ">1000 sqft"]
                        .map((filter) => ChoiceOption(text: filter))
                        .toList(),
                  ),
                ),
                addVerticalSpace(10),
                Expanded(
                  child: Padding(
                    padding: sidePadding,
                    child: ListView.builder(
                        itemCount: RE_DATA.length,
                        itemBuilder: (context, index) {
                          return RealStateItem(itemData: RE_DATA[index]);
                        }),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 20,
                width: size.width,
                child: Center(
                  child: OptionButton(
                                icon: Icons.map_rounded,
                  text: "Map View",
                  width: size.width*0.35,
                              ),
                ))
          ],
        )
      ),
    ));
  }
}

class ChoiceOption extends StatelessWidget {
  final String text;

  const ChoiceOption({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: COLOR_GREY.withAlpha(25)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: EdgeInsets.only(left: 25),
      child: Text(
        text,
        style: themeData.textTheme.headlineMedium,
      ),
    );
  }
}

class RealStateItem extends StatelessWidget {
  final dynamic itemData;

  const RealStateItem({super.key, this.itemData});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset(itemData["image"])),
              Positioned(
                  top: 15,
                  right: 15,
                  child: BorderBox(
                    hight: 50,
                    width: 50,
                    child: Icon(
                      Icons.favorite_border,
                      color: COLOR_BLACK,
                    ),
                  ))
            ],
          ),
          addVerticalSpace(15),
          Row(
            children: [
              Text("${formatCurrency(itemData["amount"])}", style: themeData.textTheme.displayLarge,),
              addHorizontalSpace(10),
              Text("${itemData["address"]}",
              style: themeData.textTheme.bodyLarge,)
            ],
          ),
          addVerticalSpace(10),
          Text("${itemData["bedrooms"]} bedrooms / ${itemData["bathrooms"]} / ${itemData["area"]} sqft",
          style: themeData.textTheme.headlineLarge,)
        ],
      ),
    );
  }
}
