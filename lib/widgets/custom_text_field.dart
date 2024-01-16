// ignore_for_file: must_be_immutable

import 'package:chat_app/config/locale/i18n.dart';
import 'package:chat_app/resource/color_manager.dart';
import 'package:chat_app/utils/app_utils/extentions.dart';
import 'package:chat_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final Color? hintColor;
  final double? hintsize;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? fillColor;
  final String? errorText;
  final String? initialValue;
  final String? title;
  final Color? titleColor;
  final String? suffixText;
  final Function(String?)? onSaved;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final bool? enabled;
  final bool? availableArabic;
  final double? borderRadius;
  final TextInputType? type;
  final TextEditingController? controller;
  final Color? cursorColor;
  final Color? textColor;
  final Color? borderColor;
  final bool isPhoneNumber;
  final bool obscureText;
  final int? linesNumber;
  EdgeInsetsGeometry? contentPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  TextAlign? textAlign;
  final TextInputAction? textInputAction;
  final bool? autofocus;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final Function(PointerDownEvent)? onTapOutside;
  final bool isRequiered;
  final bool readOnly;
  final Function()? changePasswordVisablity;
  final Widget? suffixWidget;
  final VoidCallback? onEditingComplete;

  CustomTextField({
    super.key,
    this.errorText,
    this.hintColor,
    this.hintsize,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.fillColor,
    this.borderColor,
    this.type,
    this.hintText,
    this.onSaved,
    this.enabled = true,
    this.validator,
    this.onChange,
    this.onTap,
    this.availableArabic = true,
    this.borderRadius,
    this.controller,
    this.isPhoneNumber = false,
    this.isRequiered = true,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.linesNumber = 1,
    this.textAlign,
    this.cursorColor,
    this.contentPadding,
    this.textInputAction,
    this.autofocus,
    this.inputFormatter,
    this.textColor,
    this.title,
    this.titleColor,
    this.initialValue,
    this.focusNode,
    this.readOnly = false,
    this.onSubmitted,
    this.suffixText,
    this.onTapOutside,
    this.changePasswordVisablity,
    this.suffixWidget,
    this.onEditingComplete,
  });

  @override
  State<CustomTextField> createState() => _CustomFieldsWidgetState();
}

class _CustomFieldsWidgetState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    widget.textAlign ??= Localizations.localeOf(context).languageCode == 'en'
        ? TextAlign.left
        : TextAlign.right;
    widget.contentPadding ??= const EdgeInsetsDirectional.only(
        start: 20, top: 17, bottom: 17, end: 10);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //20.verticalSpace,
        if (widget.title != null)
          CustomText(
            title: widget.title,
            size: 14,
            fontWeight: FontWeight.w600,
            color: widget.titleColor ?? ColorManager.offWhiteColor,
          ),
        if (widget.title != null) 22.verticalSpace,
        TextFormField(
          focusNode: widget.focusNode,
          autofocus: widget.autofocus ?? false,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          obscureText: widget.obscureText,
          onTapOutside: widget.onTapOutside ??
              (event) => FocusScope.of(context).unfocus(),
          maxLines: widget.linesNumber,
          enabled: widget.enabled,
          textAlign: widget.textAlign ?? TextAlign.start,
          textAlignVertical: TextAlignVertical.center,

          readOnly: widget.readOnly,
          initialValue: widget.initialValue,
          onEditingComplete: widget.onEditingComplete,
          //obscuringCharacter: '',
          validator: widget.validator ??
              (value) {
                if (widget.isRequiered) {
                  return value == "" || value == null
                      ? "${widget.title ?? ''} ${S.of(context)!.required}"
                      : null;
                }
                return null;
              },

          cursorColor: widget.cursorColor ?? ColorManager.yellowColor,
          keyboardType: widget.type ?? TextInputType.text,

          onTap: widget.onTap,
          onChanged: widget.onChange,
          onFieldSubmitted: widget.onSubmitted,
          controller: widget.controller,

          style: TextStyle(
            color: widget.hintColor ?? ColorManager.whiteColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          autocorrect: true,

          inputFormatters: widget.isPhoneNumber
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                ]
              : [],
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            prefixIconColor: ColorManager.hintColor,
            suffixIconConstraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 0,
            ),
            suffix: widget.suffixWidget,
            suffixIcon: widget.suffixIcon ??
                (widget.type == TextInputType.visiblePassword
                    ? GestureDetector(
                        onTap: widget.changePasswordVisablity,
                        child: Icon(
                          widget.obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: ColorManager.offWhiteColor.withOpacity(.5),
                        ),
                      )
                    : null),
            suffixText: widget.suffixText,
            filled: true,
            errorMaxLines: 3,
            suffixIconColor: ColorManager.blackColor,
            suffixStyle: TextStyle(
              color: ColorManager.blackColor.withOpacity(0.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            isDense: true,
            hintStyle: TextStyle(
              color: widget.hintColor ??
                  ColorManager.offWhiteColor.withOpacity(.5),
              fontSize: widget.hintsize?.sp ?? 14.sp,
              fontWeight: FontWeight.w400,
            ),
            contentPadding: widget.contentPadding,
            hintText: widget.hintText,
            fillColor: widget.fillColor ?? Colors.transparent,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
              borderSide: BorderSide(
                  color: widget.borderColor ??
                      ColorManager.offWhiteColor.withOpacity(.5)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
              borderSide: BorderSide(
                  color: widget.borderColor ??
                      ColorManager.offWhiteColor.withOpacity(.5)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
              borderSide: BorderSide(
                  color: widget.borderColor ??
                      ColorManager.offWhiteColor.withOpacity(.5)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
              borderSide: const BorderSide(color: ColorManager.redColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 20),
              borderSide:
                  BorderSide(color: ColorManager.offWhiteColor.withOpacity(.5)),
            ),
          ),
        ),
      ],
    ).verticalPadding(8);
  }
}
