import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar/utils/text_style.dart';

class BottomButton extends StatelessWidget {
  BottomButton({super.key, this.onClickSaveNew, this.onClickSave});

  final Function()? onClickSaveNew;
  final Function()? onClickSave;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * .058,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: InkWell(
                onTap: onClickSaveNew,
                child: Container(
                  color: Colors.white,
                  child: Center(
                      child: Text(
                    "Save & New",
                    style: interFontGrey(context,
                        color: Colors.black,
                        fontsize: 15,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: onClickSave,
                child: Container(
                  color: Colors.blue,
                  child: Center(
                      child: Text(
                    "Save",
                    style: interFontGrey(context,
                        color: Colors.white,
                        fontsize: 15,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              )),
            ],
          )),
          SizedBox(
            width: screenWidth * .06,
          ),
          Transform(
            transform: Matrix4.diagonal3Values(-1, 1, 1),
            alignment: Alignment.center,
            child: Icon(
              Icons.reply,
              size: 23,
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
