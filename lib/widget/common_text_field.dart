import 'package:flutter/material.dart';
import '../../const/app_color.dart';

enum TextFieldType {
  search,
}

class CustomTextField extends StatelessWidget {
  final TextFieldType textFieldType;
  final TextEditingController? textEditingController;
  final Widget? clearTextWidget;
  final String? Function(String?)? validator;
  final bool obscureText;
  //final Widget? suffixIcon;
  const CustomTextField({
    Key? key,
    this.validator,
    this.textEditingController,
    required this.textFieldType,
    this.clearTextWidget,
    this.obscureText = false,
    //this.suffixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: decoration,
      child: TextFormField(
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Colors.black,
        ),
        textAlignVertical: TextAlignVertical.center,
        textInputAction: textInputAction,
        //keyboardType: textInputType,
        obscureText: obscureText,
        controller: textEditingController,
        validator:
            validator ?? (val) => val!.trim().isEmpty ? "field required" : null,
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          hintStyle: TextStyle(color: Colors.black38),
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.only(top: 10, left: 15),
          prefixIcon: prefixIcon,
          hintText: hintText,
        ),
      ),
    );
  }

  Decoration? get decoration {
    switch (textFieldType) {
      case TextFieldType.search:
        return BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5),
        ]);
    }
  }

  TextInputAction? get textInputAction {
    switch (textFieldType) {
      case TextFieldType.search:
        return TextInputAction.next;
      default:
        return null;
    }
  }

  Widget? get prefixIcon {
    switch (textFieldType) {
      case TextFieldType.search:
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Icon(
            Icons.search,
            color: Colors.grey,
            size: 21,
          ),
        );
      default:
        return null;
    }
  }

  String? get hintText {
    switch (textFieldType) {
      case TextFieldType.search:
        return "Search...";
      default:
        return null;
    }
  }
}
