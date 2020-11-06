import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hornacke/screens/menu-screen.dart';

class DetailAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  DetailAppBar({
    Key key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/images/back_arrow.svg",
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            "assets/images/menu-burger.svg",
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return MenuScreen();
              }),
            );
          },
        )
      ],
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Horňácké",
              style: TextStyle(fontFamily: "Times", fontSize: 28),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
