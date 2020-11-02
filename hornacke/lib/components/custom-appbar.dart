import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(88.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.dark,
      title: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Horňácké",
                style: TextStyle(
                    color: Colors.white, fontFamily: "Times", fontSize: 28),
              ),
              SvgPicture.asset("assets/images/menu-burger.svg", color: Colors.white,)
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xff191919),
    );
  }
}
