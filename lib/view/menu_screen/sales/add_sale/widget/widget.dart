import 'package:flutter/material.dart';
import 'package:vyapar/utils/colors.dart';
import 'package:vyapar/utils/text_style.dart';
import 'package:vyapar/view/menu_screen/sales/widget/verticle_divider.dart';

class DateInvoiceWidget extends StatelessWidget {
  DateInvoiceWidget({super.key, this.invoiceNumber, this.date});
  final String? invoiceNumber;
  final String? date;

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const VerticleDivider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * .015),
            child: Row(
              children: [
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Invoce No.",
                      style: interFontBlack(context, color: Colorconst.cGrey),
                    ),
                    SizedBox(
                      height: screenHeight * .0009,
                    ),
                    Row(
                      children: [
                        Text(
                          invoiceNumber ?? "",
                          style: interFontBlack(context, color: Colors.black),
                        ),
                        SizedBox(
                          width: screenWidth * .009,
                        ),
                        Transform.rotate(
                            angle: -1.55,
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 12,
                              color: Colors.black45,
                            ))
                      ],
                    ),
                  ],
                )),
                Container(
                  height: screenHeight * .04,
                  width: 1,
                  color: Colors.black12,
                ),
                SizedBox(
                  width: screenWidth * .03,
                ),
                Flexible(
                    child: InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Date",
                        style: interFontBlack(context, color: Colorconst.cGrey),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            date ?? "9/20/2024",
                            style: interFontBlack(context, color: Colors.black),
                          ),
                          SizedBox(
                            width: screenWidth * .009,
                          ),
                          Transform.rotate(
                              angle: -1.55,
                              child: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 12,
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
            height: screenHeight * .01,
          ),
          const VerticleDivider(),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.keyboardType,
  });
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  // final Function(String?)?onChanged;
  // final Function(String?)?onFieldSubmitted;
  // final Function(PointerDownEvent)?onTapOutside;
  //final TextEditingController? controller;
  // final FormFieldValidator<String?>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      style: interFontBlack(context, fontsize: 10),
      decoration: InputDecoration(
        hintText: hintText ?? "Customer Name *",
        labelText: labelText ?? "Customer Name *",
        labelStyle: interFontGrey(context, fontsize: 15),
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colorconst.cGrey),
            borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}

class AddItemButton extends StatelessWidget {
  AddItemButton({
    super.key,
    this.onTap,
  });
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 2, color: Colorconst.cGrey)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenWidth * .01),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle,
                color: Colorconst.cBlue,
              ),
              SizedBox(
                width: screenWidth * .02,
              ),
              Text(
                "Add Items",
                style: interFontBlack(context,
                    color: Colorconst.cBlue, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: screenWidth * .01,
              ),
              Text(
                "(Optional)",
                style: interFontBlack(context, color: Colorconst.cGrey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
