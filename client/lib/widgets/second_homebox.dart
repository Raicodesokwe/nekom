import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class SecondHomeBox extends StatelessWidget {
  final String name;
  final IconData icon;
  const SecondHomeBox({Key? key, required this.name, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.35,
      height: size.height * 0.2,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 50,
                width: 50,
                child: Center(
                  child: Icon(
                    icon,
                    color: AppColor.greenColor,
                  ),
                ),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColor.whiteColor)),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              name,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
              topRight: Radius.circular(12)),
          color: AppColor.greenColor),
    );
  }
}
