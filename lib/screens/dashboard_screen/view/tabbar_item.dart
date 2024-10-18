import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/bottomBarModel.dart';

class TabbarItem extends StatelessWidget {
  final bool isSelected;
  final BottomBarModel menuItem;

  const TabbarItem({this.isSelected = false, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return menuItem.isItem
        ? SizedBox(
            child: Column(
              children: [
                AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    decoration: BoxDecoration(color: isSelected ? const Color.fromRGBO(255, 165, 0, 1) : Colors.transparent, shape: BoxShape.circle),
                    height: 38,
                    width: 38,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgPicture.asset(menuItem.imagePath),
                    )),
                const SizedBox(height: 5),
                Text(
                  menuItem.itemName,
                  style: TextStyle(
                    color: isSelected ? const Color.fromRGBO(255, 165, 0, 1) : Colors.white,
                    fontSize: 9,
                  ),
                )
              ],
            ),
          )
        : Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(menuItem.imagePath)),
                  shape: BoxShape.circle,
                ),
                height: 38,
                width: 38,
              ),
              const SizedBox(height: 2),
              Text(
                menuItem.itemName,
                style: const TextStyle(color: Colors.white, fontSize: 9),
              )
            ],
          );
  }
}
