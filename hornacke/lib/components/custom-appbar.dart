import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hornacke/screens/menu-screen.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final bool closable;
  @override
  final Size preferredSize;

  CustomAppBar({Key key, this.closable})
      : preferredSize = Size.fromHeight(88.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      brightness: Brightness.dark,
      automaticallyImplyLeading: false,
      elevation: closable == true ? 0 : 4,
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
              if (closable == true)
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/images/close.svg",
                    color: Colors.white,
                  ),
                  iconSize: 18,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              else
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/images/menu-burger.svg",
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return MenuScreen();
                      }),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xff191919),
    );
  }
}
