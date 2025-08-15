import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final String? helperText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool showCounter;
  final bool autocorrect;
  final bool enableSuggestions;
  final bool enableInteractiveSelection;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final double? borderWidth;
  final Color? fillColor;
  final bool filled;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final TextStyle? helperStyle;
  final TextStyle? textStyle;
  final Widget? prefix;
  final Widget? suffix;
  final bool isCollapsed;
  final bool isDense;
  final bool expands;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final ScrollPhysics? scrollPhysics;
  final bool enableIMEPersonalizedLearning;
  final bool canRequestFocus;
  final bool spellCheckConfiguration;
  final bool enableDragGesture;
  final bool enableTapToSelectAll;
  final bool enableTapToSelectAllOnLongPress;
  final bool enableTapToSelectAllOnDoubleTap;
  final bool enableTapToSelectAllOnTripleTap;
  final bool enableTapToSelectAllOnQuadrupleTap;
  final bool enableTapToSelectAllOnQuintupleTap;
  final bool enableTapToSelectAllOnSextupleTap;
  final bool enableTapToSelectAllOnSeptupleTap;
  final bool enableTapToSelectAllOnOctupleTap;
  final bool enableTapToSelectAllOnNonupleTap;
  final bool enableTapToSelectAllOnDecupleTap;

  const CustomTextField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.errorText,
    this.helperText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.showCounter = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.enableInteractiveSelection = true,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.focusNode,
    this.contentPadding,
    this.borderRadius,
    this.borderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.borderWidth,
    this.fillColor,
    this.filled = false,
    this.labelStyle,
    this.hintStyle,
    this.errorStyle,
    this.helperStyle,
    this.textStyle,
    this.prefix,
    this.suffix,
    this.isCollapsed = false,
    this.isDense = false,
    this.expands = false,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.scrollPhysics,
    this.enableIMEPersonalizedLearning = true,
    this.canRequestFocus = true,
    this.spellCheckConfiguration = true,
    this.enableDragGesture = true,
    this.enableTapToSelectAll = true,
    this.enableTapToSelectAllOnLongPress = true,
    this.enableTapToSelectAllOnDoubleTap = true,
    this.enableTapToSelectAllOnTripleTap = true,
    this.enableTapToSelectAllOnQuadrupleTap = true,
    this.enableTapToSelectAllOnQuintupleTap = true,
    this.enableTapToSelectAllOnSextupleTap = true,
    this.enableTapToSelectAllOnSeptupleTap = true,
    this.enableTapToSelectAllOnOctupleTap = true,
    this.enableTapToSelectAllOnNonupleTap = true,
    this.enableTapToSelectAllOnDecupleTap = true,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Determine border colors
    final defaultBorderColor = widget.borderColor ?? theme.colorScheme.outline;
    final focusedBorderColor = widget.focusedBorderColor ?? theme.colorScheme.primary;
    final errorBorderColor = widget.errorBorderColor ?? theme.colorScheme.error;
    
    // Determine border width
    final borderWidth = widget.borderWidth ?? 1.0;
    
    // Determine border radius
    final borderRadius = widget.borderRadius ?? 12.0;
    
    // Determine content padding
    final contentPadding = widget.contentPadding ?? const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    );
    
    // Determine fill color
    final fillColor = widget.fillColor ?? theme.colorScheme.surface;
    
    // Determine text styles
    final defaultLabelStyle = widget.labelStyle ?? theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSurface,
    );
    
    final defaultHintStyle = widget.hintStyle ?? theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSurface.withOpacity(0.6),
    );
    
    final defaultErrorStyle = widget.errorStyle ?? theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.error,
    );
    
    final defaultHelperStyle = widget.helperStyle ?? theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurface.withOpacity(0.6),
    );
    
    final defaultTextStyle = widget.textStyle ?? theme.textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSurface,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: defaultLabelStyle,
          ),
          const SizedBox(height: 8),
        ],
        
        // Text Field
        TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: widget.obscureText,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          autofocus: widget.autofocus,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          maxLength: widget.maxLength,
          autocorrect: widget.autocorrect,
          enableSuggestions: widget.enableSuggestions,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          textCapitalization: widget.textCapitalization,
          inputFormatters: widget.inputFormatters,
          validator: widget.validator,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          onTap: widget.onTap,
          // contentPadding: contentPadding,
          style: defaultTextStyle,
          textAlign: widget.textAlign,
          textAlignVertical: widget.textAlignVertical,
          expands: widget.expands,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: defaultHintStyle,
            errorText: widget.errorText,
            errorStyle: defaultErrorStyle,
            helperText: widget.helperText,
            helperStyle: defaultHelperStyle,
            counterText: widget.showCounter ? null : '',
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    color: _isFocused
                        ? focusedBorderColor
                        : theme.colorScheme.onSurface.withOpacity(0.6),
                  )
                : widget.prefix,
            suffixIcon: widget.suffixIcon,
            suffix: widget.suffix,
            isCollapsed: widget.isCollapsed,
            isDense: widget.isDense,
            filled: widget.filled,
            fillColor: fillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: defaultBorderColor,
                width: borderWidth,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: defaultBorderColor,
                width: borderWidth,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: focusedBorderColor,
                width: borderWidth + 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: errorBorderColor,
                width: borderWidth,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: errorBorderColor,
                width: borderWidth + 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: theme.colorScheme.outline.withOpacity(0.3),
                width: borderWidth,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Convenience constructors for common text field types
extension CustomTextFieldExtensions on CustomTextField {
  static CustomTextField email({
    Key? key,
    TextEditingController? controller,
    String? labelText = 'Email',
    String? hintText = 'Enter your email address',
    String? errorText,
    String? helperText,
    IconData? prefixIcon = Icons.email_outlined,
    Widget? suffixIcon,
    TextInputAction? textInputAction = TextInputAction.next,
    bool enabled = true,
    bool readOnly = false,
    bool autofocus = false,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    void Function(String)? onFieldSubmitted,
    void Function()? onTap,
    FocusNode? focusNode,
    EdgeInsetsGeometry? contentPadding,
    double? borderRadius,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    double? borderWidth,
    Color? fillColor,
    bool filled = false,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? errorStyle,
    TextStyle? helperStyle,
    TextStyle? textStyle,
    Widget? prefix,
    Widget? suffix,
    bool isCollapsed = false,
    bool isDense = false,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
  }) {
    return CustomTextField(
      key: key,
      controller: controller,
      labelText: labelText,
      hintText: hintText,
      errorText: errorText,
      helperText: helperText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      focusNode: focusNode,
      contentPadding: contentPadding,
      borderRadius: borderRadius,
      borderColor: borderColor,
      focusedBorderColor: focusedBorderColor,
      errorBorderColor: errorBorderColor,
      borderWidth: borderWidth,
      fillColor: fillColor,
      filled: filled,
      labelStyle: labelStyle,
      hintStyle: hintStyle,
      errorStyle: errorStyle,
      helperStyle: helperStyle,
      textStyle: textStyle,
      prefix: prefix,
      suffix: suffix,
      isCollapsed: isCollapsed,
      isDense: isDense,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
    );
  }

  static CustomTextField password({
    Key? key,
    TextEditingController? controller,
    String? labelText = 'Password',
    String? hintText = 'Enter your password',
    String? errorText,
    String? helperText,
    IconData? prefixIcon = Icons.lock_outlined,
    Widget? suffixIcon,
    TextInputAction? textInputAction = TextInputAction.done,
    bool enabled = true,
    bool readOnly = false,
    bool autofocus = false,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    void Function(String)? onFieldSubmitted,
    void Function()? onTap,
    FocusNode? focusNode,
    EdgeInsetsGeometry? contentPadding,
    double? borderRadius,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    double? borderWidth,
    Color? fillColor,
    bool filled = false,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? errorStyle,
    TextStyle? helperStyle,
    TextStyle? textStyle,
    Widget? prefix,
    Widget? suffix,
    bool isCollapsed = false,
    bool isDense = false,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
  }) {
    return CustomTextField(
      key: key,
      controller: controller,
      labelText: labelText,
      hintText: hintText,
      errorText: errorText,
      helperText: helperText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: textInputAction,
      obscureText: true,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      focusNode: focusNode,
      contentPadding: contentPadding,
      borderRadius: borderRadius,
      borderColor: borderColor,
      focusedBorderColor: focusedBorderColor,
      errorBorderColor: errorBorderColor,
      borderWidth: borderWidth,
      fillColor: fillColor,
      filled: filled,
      labelStyle: labelStyle,
      hintStyle: hintStyle,
      errorStyle: errorStyle,
      helperStyle: helperStyle,
      textStyle: textStyle,
      prefix: prefix,
      suffix: suffix,
      isCollapsed: isCollapsed,
      isDense: isDense,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
    );
  }

  static CustomTextField search({
    Key? key,
    TextEditingController? controller,
    String? labelText = 'Search',
    String? hintText = 'Search...',
    String? errorText,
    String? helperText,
    IconData? prefixIcon = Icons.search,
    Widget? suffixIcon,
    TextInputAction? textInputAction = TextInputAction.search,
    bool enabled = true,
    bool readOnly = false,
    bool autofocus = false,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    void Function(String)? onFieldSubmitted,
    void Function()? onTap,
    FocusNode? focusNode,
    EdgeInsetsGeometry? contentPadding,
    double? borderRadius,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    double? borderWidth,
    Color? fillColor,
    bool filled = true,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? errorStyle,
    TextStyle? helperStyle,
    TextStyle? textStyle,
    Widget? prefix,
    Widget? suffix,
    bool isCollapsed = false,
    bool isDense = false,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
  }) {
    return CustomTextField(
      key: key,
      controller: controller,
      labelText: labelText,
      hintText: hintText,
      errorText: errorText,
      helperText: helperText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      keyboardType: TextInputType.text,
      textInputAction: textInputAction,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      focusNode: focusNode,
      contentPadding: contentPadding,
      borderRadius: borderRadius,
      borderColor: borderColor,
      focusedBorderColor: focusedBorderColor,
      errorBorderColor: errorBorderColor,
      borderWidth: borderWidth,
      fillColor: fillColor,
      filled: filled,
      labelStyle: labelStyle,
      hintStyle: hintStyle,
      errorStyle: errorStyle,
      helperStyle: helperStyle,
      textStyle: textStyle,
      prefix: prefix,
      suffix: suffix,
      isCollapsed: isCollapsed,
      isDense: isDense,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
    );
  }

  static CustomTextField multiline({
    Key? key,
    TextEditingController? controller,
    String? labelText,
    String? hintText,
    String? errorText,
    String? helperText,
    IconData? prefixIcon,
    Widget? suffixIcon,
    TextInputAction? textInputAction = TextInputAction.newline,
    bool enabled = true,
    bool readOnly = false,
    bool autofocus = false,
    int? maxLines = 5,
    int? minLines = 3,
    int? maxLength,
    bool showCounter = true,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    void Function(String)? onFieldSubmitted,
    void Function()? onTap,
    FocusNode? focusNode,
    EdgeInsetsGeometry? contentPadding,
    double? borderRadius,
    Color? borderColor,
    Color? focusedBorderColor,
    Color? errorBorderColor,
    double? borderWidth,
    Color? fillColor,
    bool filled = false,
    TextStyle? labelStyle,
    TextStyle? hintStyle,
    TextStyle? errorStyle,
    TextStyle? helperStyle,
    TextStyle? textStyle,
    Widget? prefix,
    Widget? suffix,
    bool isCollapsed = false,
    bool isDense = false,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
  }) {
    return CustomTextField(
      key: key,
      controller: controller,
      labelText: labelText,
      hintText: hintText,
      errorText: errorText,
      helperText: helperText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      keyboardType: TextInputType.multiline,
      textInputAction: textInputAction,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
      showCounter: showCounter,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      focusNode: focusNode,
      contentPadding: contentPadding,
      borderRadius: borderRadius,
      borderColor: borderColor,
      focusedBorderColor: focusedBorderColor,
      errorBorderColor: errorBorderColor,
      borderWidth: borderWidth,
      fillColor: fillColor,
      filled: filled,
      labelStyle: labelStyle,
      hintStyle: hintStyle,
      errorStyle: errorStyle,
      helperStyle: helperStyle,
      textStyle: textStyle,
      prefix: prefix,
      suffix: suffix,
      isCollapsed: isCollapsed,
      isDense: isDense,
      textAlign: textAlign,
      textAlignVertical: textAlignVertical,
    );
  }
}
