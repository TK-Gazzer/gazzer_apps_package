import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gazzer_apps/src/ui_kit/extensions/context.dart';
import 'package:gazzer_apps/src/ui_kit/l10n/ui_l10n.dart';
import 'package:gazzer_apps/src/ui_kit/resources/app_const.dart';
import 'package:gazzer_apps/src/ui_kit/theme/app_colors.dart';
import 'package:gazzer_apps/src/ui_kit/widgets/helper_widgets/adaptive_progress_indicator.dart';
import 'package:intl/intl.dart' as intl;

export 'package:flutter/services.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({
    super.key,
    required this.controller,
    this.enabled = true,
    this.isLoading = false,
    this.hintText,
    this.label,
    this.style,
    this.hintStyle,
    this.onChange,
    this.onSubmitting,
    this.onSaved,
    this.validator,
    this.suffix,
    this.suffixWidget,
    this.prefix,
    this.height,
    this.width,
    this.isPassword = false,
    this.borderRadius,
    this.bgColor,
    this.isFilled = true,
    this.inputFormatters,
    this.padding,
    this.iconsConstraints,
    this.isValid,
    this.showBorder = true,
    this.maxLines,
    this.isOutLinedBorder = true,
    this.autofocus = false,
    this.focusNode,
    this.showMaxLegnth = false,
    this.prefixOnTap,
    this.prefixColor,
    this.autofillHints,
    this.keyboardType,
    this.max = 255,
    this.disabledColor,
    this.borderColor,
    this.autovalidateMode,
    this.action = TextInputAction.next,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? label;
  final TextStyle? style;
  final bool enabled;
  final bool isLoading;
  final Function(String)? onChange;
  final Function(String?)? onSubmitting;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? suffixWidget;
  final Widget? prefix;
  final double? height;
  final double? width;
  final double? borderRadius;
  final bool isPassword;
  final bool isFilled;
  final Color? bgColor;
  final Color? disabledColor;
  final Color? borderColor;

  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? padding;
  final BoxConstraints? iconsConstraints;
  final bool? isValid;
  final bool showBorder;
  final TextStyle? hintStyle;
  final int? maxLines;
  final TextInputType? keyboardType;
  final bool isOutLinedBorder;
  final VoidCallback? prefixOnTap;
  final Color? prefixColor;
  final List<String>? autofillHints;
  final int max;
  final TextInputAction action;
  final AutovalidateMode? autovalidateMode;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool showMaxLegnth;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  late ValueNotifier<bool> isObscure;
  late InputBorder focusedBorder;
  late InputBorder errorBorder;

  /// Direction of the typed text, null means follow the app direction.
  TextDirection? _textDirection;

  @override
  void initState() {
    isObscure = ValueNotifier<bool>(widget.isPassword);
    _textDirection = _directionOf(widget.controller.text);
    widget.controller.addListener(_onTextChanged);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MainTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onTextChanged);
      widget.controller.addListener(_onTextChanged);
      _textDirection = _directionOf(widget.controller.text);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    isObscure.dispose();
    super.dispose();
  }

  TextDirection? _directionOf(String text) {
    if (intl.Bidi.startsWithRtl(text)) return TextDirection.rtl;
    if (intl.Bidi.startsWithLtr(text)) return TextDirection.ltr;
    return null;
  }

  void _onTextChanged() {
    final direction = _directionOf(widget.controller.text);
    if (direction == _textDirection || !mounted) return;
    setState(() => _textDirection = direction);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;
    final iconContraints = widget.iconsConstraints ?? const BoxConstraints(minHeight: 25, maxHeight: 40, maxWidth: 40, minWidth: 25);
    return Material(
      color: Colors.transparent,
      child: ValueListenableBuilder(
        valueListenable: isObscure,
        builder: (context, value, child) {
          return TextFormField(
            autofocus: widget.autofocus,
            maxLines: widget.maxLines ?? 1,
            cursorColor: Co.purple,
            controller: widget.controller,
            textDirection: _textDirection,
            enabled: widget.enabled,
            style: widget.style ?? context.style14400.copyWith(fontWeight: FontWeight.w500),
            validator: widget.validator,
            onChanged: widget.onChange,
            autofillHints: widget.autofillHints,
            onSaved: widget.onSaved,
            onFieldSubmitted: widget.onSubmitting,
            obscureText: value,
            maxLength: widget.max,
            focusNode: widget.focusNode,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            textInputAction: widget.action,
            inputFormatters: widget.inputFormatters,
            keyboardType: widget.keyboardType ?? TextInputType.emailAddress,
            autovalidateMode: widget.autovalidateMode,
            decoration: InputDecoration(
              errorStyle: context.style14400.copyWith(color: Co.red),
              errorMaxLines: 5,
              hintMaxLines: 5,
              contentPadding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              isDense: true,
              counterText: widget.showMaxLegnth ? null : '',
              hint: widget.hintText == null
                  ? null
                  : Text(
                      widget.hintText!,
                      style: widget.hintStyle ?? context.style16400.copyWith(color: context.isDarkMode ? Co.lightGrey : Co.darkGrey),
                      maxLines: 1,
                    ),
              helperMaxLines: 1,
              // helperMaxLines: 5,
              labelStyle: context.style16400.copyWith(color: Co.darkGrey),

              labelText: widget.label,
              prefixIcon: widget.prefix == null
                  ? null
                  : Padding(
                      padding: EdgeInsets.only(right: UiL10n.isAr(context) ? 0 : 5, left: UiL10n.isAr(context) ? 5 : 0),
                      child: MaterialButton(
                        minWidth: 20,
                        onPressed: widget.prefixOnTap,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        shape: RoundedRectangleBorder(borderRadius: AppConst.defaultInnerBorderRadius),
                        color: widget.prefixColor,
                        child: widget.prefix,
                      ),
                    ),
              suffixIconConstraints: iconContraints,
              suffixIcon: Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: getSiffixIcon(value)),
              suffix: widget.suffixWidget,
              filled: widget.isFilled || widget.bgColor != null,
              fillColor: widget.bgColor ?? (isDarkMode ? Co.darkModeSubLayer : Co.lightModeSubLayer),
              enabled: widget.enabled,

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 24),
                borderSide: BorderSide(
                  width: widget.showBorder ? 1 : 0,
                  color: widget.borderColor ?? (isDarkMode ? Co.darkModeSubLayer : Co.lightModeSubLayer),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 24),
                borderSide: const BorderSide(color: Co.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 24),
                borderSide: BorderSide(width: widget.showBorder ? 1 : 0, color: widget.borderColor ?? Co.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 24),
                borderSide: BorderSide(
                  width: widget.showBorder ? 1 : 0,
                  color: widget.borderColor ?? (isDarkMode ? Co.darkModeSubLayer : Co.lightModeSubLayer),
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: widget.showBorder ? 1 : 0,
                  color: widget.borderColor ?? (isDarkMode ? Co.darkModeSubLayer : Co.lightModeSubLayer),
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 24),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget? getSiffixIcon(value) {
    if (widget.suffix != null) return widget.suffix;
    if (widget.isLoading) return const AdaptiveProgressIndicator();
    if (widget.isPassword) {
      return InkWell(
        onTap: () => isObscure.value = !value,
        child: Icon(value ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill, color: Co.darkGrey, size: 20),
      );
    }
    return null;
  }
}
