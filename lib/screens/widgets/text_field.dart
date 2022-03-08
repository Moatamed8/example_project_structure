import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamyez/utils/ColorsUtils.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  final FocusNode focusNode;
  final String hintText;
  Function onCahnged;
  Function onSaved;
  Function onsubmited;
  bool isNumber;
  TextEditingController textEditingController;
  bool isObscure;
  Function validation;
  List<TextInputFormatter> textinputformat;
  bool hasSufficIcon;

  CustomTextField(
      {this.focusNode,
      this.hintText,
      this.isNumber = false,
      this.isObscure = false,
      this.hasSufficIcon = false,
      this.textEditingController,
      this.onCahnged,
      this.textinputformat,
      this.onsubmited,
      this.onSaved,
      this.validation});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      child: TextFormField(
        controller: widget.textEditingController,
        focusNode: widget.focusNode,
        keyboardType: widget.isNumber ? TextInputType.phone : TextInputType.url,
        onChanged: widget.onCahnged,
        onSaved: widget.onSaved,
        validator: widget.validation,
        obscureText: widget.isObscure,
        onFieldSubmitted: widget.onsubmited,
        inputFormatters: widget.textinputformat,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: ColorsUtils.blackColor),
        decoration: InputDecoration(
          suffixIcon: widget.hasSufficIcon
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.isObscure = !widget.isObscure;
                    });
                  },
                  child: Icon(
                    Icons.remove_red_eye_outlined,
                    color: widget.isObscure
                        ? ColorsUtils.bottomNavBarUnselected
                        : ColorsUtils.tamyez,
                  ),
                )
              : SizedBox(),
          filled: true,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ColorsUtils.neonFuchies),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ColorsUtils.neonFuchies),
          ),
          labelText: widget.hintText,
          errorStyle: TextStyle(color: Colors.transparent),
          labelStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: ColorsUtils.blackColor,
              fontSize: 13.sp),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ColorsUtils.borderLightGreyColor)),
          fillColor: ColorsUtils.whiteColor,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ColorsUtils.tamyez)),
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: ColorsUtils.borderLightGreyColor)),
        ),
      ),
    );
  }
}
