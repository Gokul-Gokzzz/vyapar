import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vyapar/utils/colors.dart';
import 'package:vyapar/utils/text_style.dart';
import 'package:vyapar/view/menu_screen/my_business/sales/widget/verticle_divider.dart';

class DateBillNumWidget extends StatelessWidget {
  DateBillNumWidget({super.key, this.invoiceNumber, this.date});
  final String? invoiceNumber;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const VerticleDivider(),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Invoce No.",
                      style: interFontBlack(
                          color: Colorconst.cGrey, fontsize: 12.sp, context),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      children: [
                        Text(
                          invoiceNumber ?? "",
                          style: interFontBlack(
                              color: Colors.black54, fontsize: 14.sp, context),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Transform.rotate(
                            angle: -1.55,
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 12.sp,
                              color: Colors.black45,
                            ))
                      ],
                    ),
                  ],
                )),
                Container(
                  height: 30.h,
                  width: 1.w,
                  color: Colors.black12,
                ),
                SizedBox(
                  width: 13.w,
                ),
                Expanded(
                    child: InkWell(
                  onTap: () async {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: interFontBlack(
                            color: Colorconst.cGrey, fontsize: 12.sp, context),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          Text(
                            date ?? "",
                            style: interFontBlack(
                                color: Colors.black54,
                                fontsize: 14.sp,
                                context),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Transform.rotate(
                              angle: -1.55,
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 12.sp,
                                color: Colors.black45,
                              ))
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const VerticleDivider(),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Text(
                      "Firm Name:",
                      style: interFontGrey(
                          fontsize: 13.sp, color: Colorconst.cGrey, context),
                    ),
                    Text(
                      "xianinfotech LLP",
                      style: interFontBlack(fontsize: 13.sp, context),
                    ),
                  ],
                )),
                Transform.rotate(
                    angle: -1.55,
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      size: 12.sp,
                      color: Colors.black45,
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          )
        ],
      ),
    );
  }
}
