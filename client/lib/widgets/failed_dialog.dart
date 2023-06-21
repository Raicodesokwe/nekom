import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class FailedDialog extends StatelessWidget {
  final String message;
  const FailedDialog({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AlertDialog(
      backgroundColor: AppColor.whiteColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.cancel_outlined,
            size: 75,
            color: Colors.red,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            message,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              height: 50,
              width: size.width * 0.5,
              child: Center(
                child: Text(
                  'Ok',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              decoration: BoxDecoration(
                  color: AppColor.blackColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20))),
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }
}
