import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final ButtonType type;
  final ButtonSize size;
  final bool isLoading;
  final bool isFullWidth;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? elevation;
  final IconData? icon;
  final bool showShadow;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.type = ButtonType.primary,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.isFullWidth = true,
    this.padding,
    this.borderRadius,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.elevation,
    this.icon,
    this.showShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Determine colors based on type
    final colors = _getColors(theme);
    
    // Determine size properties
    final sizeProps = _getSizeProperties();
    
    // Determine padding
    final buttonPadding = padding ?? sizeProps.padding;
    
    // Determine border radius
    final buttonBorderRadius = borderRadius ?? sizeProps.borderRadius;
    
    // Determine elevation
    final buttonElevation = elevation ?? (showShadow ? sizeProps.elevation : 0);

    Widget buttonChild = child;
    
    // Add icon if provided
    if (icon != null) {
      buttonChild = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: sizeProps.iconSize),
          const SizedBox(width: 8),
          buttonChild,
        ],
      );
    }
    
    // Add loading indicator if loading
    if (isLoading) {
      buttonChild = SizedBox(
        width: sizeProps.iconSize,
        height: sizeProps.iconSize,
        child: CircularProgressIndicator(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation<Color>(colors.foregroundColor),
        ),
      );
    }

    // Build button based on type
    switch (type) {
      case ButtonType.primary:
        return _buildElevatedButton(
          context,
          colors: colors,
          sizeProps: sizeProps,
          padding: buttonPadding,
          borderRadius: buttonBorderRadius,
          elevation: buttonElevation,
          child: buttonChild,
        );
        
      case ButtonType.secondary:
        return _buildOutlinedButton(
          context,
          colors: colors,
          sizeProps: sizeProps,
          padding: buttonPadding,
          borderRadius: buttonBorderRadius,
          child: buttonChild,
        );
        
      case ButtonType.text:
        return _buildTextButton(
          context,
          colors: colors,
          sizeProps: sizeProps,
          padding: buttonPadding,
          child: buttonChild,
        );
        
      case ButtonType.icon:
        return _buildIconButton(
          context,
          colors: colors,
          sizeProps: sizeProps,
          child: buttonChild,
        );
    }
  }

  Widget _buildElevatedButton(
    BuildContext context, {
    required ButtonColors colors,
    required ButtonSizeProperties sizeProps,
    required EdgeInsetsGeometry padding,
    required double borderRadius,
    required double elevation,
    required Widget child,
  }) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: sizeProps.height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.backgroundColor,
          foregroundColor: colors.foregroundColor,
          elevation: elevation,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          textStyle: TextStyle(
            fontSize: sizeProps.fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        child: child,
      ),
    );
  }

  Widget _buildOutlinedButton(
    BuildContext context, {
    required ButtonColors colors,
    required ButtonSizeProperties sizeProps,
    required EdgeInsetsGeometry padding,
    required double borderRadius,
    required Widget child,
  }) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: sizeProps.height,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: colors.foregroundColor,
          side: BorderSide(
            color: borderColor ?? colors.borderColor,
            width: 1.5,
          ),
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          textStyle: TextStyle(
            fontSize: sizeProps.fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        child: child,
      ),
    );
  }

  Widget _buildTextButton(
    BuildContext context, {
    required ButtonColors colors,
    required ButtonSizeProperties sizeProps,
    required EdgeInsetsGeometry padding,
    required Widget child,
  }) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      height: sizeProps.height,
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          foregroundColor: colors.foregroundColor,
          padding: padding,
          textStyle: TextStyle(
            fontSize: sizeProps.fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        child: child,
      ),
    );
  }

  Widget _buildIconButton(
    BuildContext context, {
    required ButtonColors colors,
    required ButtonSizeProperties sizeProps,
    required Widget child,
  }) {
    return SizedBox(
      width: sizeProps.height,
      height: sizeProps.height,
      child: IconButton(
        onPressed: isLoading ? null : onPressed,
        icon: child,
        style: IconButton.styleFrom(
          backgroundColor: colors.backgroundColor,
          foregroundColor: colors.foregroundColor,
          elevation: elevation ?? (showShadow ? sizeProps.elevation : 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(sizeProps.borderRadius),
          ),
        ),
      ),
    );
  }

  ButtonColors _getColors(ThemeData theme) {
    final primaryColor = backgroundColor ?? theme.colorScheme.primary;
    final onPrimaryColor = foregroundColor ?? theme.colorScheme.onPrimary;
    
    switch (type) {
      case ButtonType.primary:
        return ButtonColors(
          backgroundColor: primaryColor,
          foregroundColor: onPrimaryColor,
          borderColor: primaryColor,
        );
        
      case ButtonType.secondary:
        return ButtonColors(
          backgroundColor: Colors.transparent,
          foregroundColor: primaryColor,
          borderColor: primaryColor,
        );
        
      case ButtonType.text:
        return ButtonColors(
          backgroundColor: Colors.transparent,
          foregroundColor: primaryColor,
          borderColor: Colors.transparent,
        );
        
      case ButtonType.icon:
        return ButtonColors(
          backgroundColor: primaryColor,
          foregroundColor: onPrimaryColor,
          borderColor: primaryColor,
        );
    }
  }

  ButtonSizeProperties _getSizeProperties() {
    switch (size) {
      case ButtonSize.small:
        return ButtonSizeProperties(
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          borderRadius: 8,
          fontSize: 12,
          iconSize: 16,
          elevation: 2,
        );
        
      case ButtonSize.medium:
        return ButtonSizeProperties(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          borderRadius: 12,
          fontSize: 14,
          iconSize: 20,
          elevation: 4,
        );
        
      case ButtonSize.large:
        return ButtonSizeProperties(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          borderRadius: 16,
          fontSize: 16,
          iconSize: 24,
          elevation: 8,
        );
    }
  }
}

enum ButtonType {
  primary,
  secondary,
  text,
  icon,
}

enum ButtonSize {
  small,
  medium,
  large,
}

class ButtonColors {
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;

  ButtonColors({
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
  });
}

class ButtonSizeProperties {
  final double height;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double fontSize;
  final double iconSize;
  final double elevation;

  ButtonSizeProperties({
    required this.height,
    required this.padding,
    required this.borderRadius,
    required this.fontSize,
    required this.iconSize,
    required this.elevation,
  });
}

// Convenience constructors for common button types
extension CustomButtonExtensions on CustomButton {
  static CustomButton primary({
    Key? key,
    required VoidCallback? onPressed,
    required Widget child,
    ButtonSize size = ButtonSize.medium,
    bool isLoading = false,
    bool isFullWidth = true,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    Color? backgroundColor,
    Color? foregroundColor,
    IconData? icon,
    bool showShadow = true,
  }) {
    return CustomButton(
      key: key,
      onPressed: onPressed,
      child: child,
      type: ButtonType.primary,
      size: size,
      isLoading: isLoading,
      isFullWidth: isFullWidth,
      padding: padding,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      icon: icon,
      showShadow: showShadow,
    );
  }

  static CustomButton secondary({
    Key? key,
    required VoidCallback? onPressed,
    required Widget child,
    ButtonSize size = ButtonSize.medium,
    bool isLoading = false,
    bool isFullWidth = true,
    EdgeInsetsGeometry? padding,
    double? borderRadius,
    Color? foregroundColor,
    Color? borderColor,
    IconData? icon,
  }) {
    return CustomButton(
      key: key,
      onPressed: onPressed,
      child: child,
      type: ButtonType.secondary,
      size: size,
      isLoading: isLoading,
      isFullWidth: isFullWidth,
      padding: padding,
      borderRadius: borderRadius,
      foregroundColor: foregroundColor,
      borderColor: borderColor,
      icon: icon,
      showShadow: false,
    );
  }

  static CustomButton text({
    Key? key,
    required VoidCallback? onPressed,
    required Widget child,
    ButtonSize size = ButtonSize.medium,
    bool isLoading = false,
    bool isFullWidth = true,
    EdgeInsetsGeometry? padding,
    Color? foregroundColor,
    IconData? icon,
  }) {
    return CustomButton(
      key: key,
      onPressed: onPressed,
      child: child,
      type: ButtonType.text,
      size: size,
      isLoading: isLoading,
      isFullWidth: isFullWidth,
      padding: padding,
      foregroundColor: foregroundColor,
      icon: icon,
      showShadow: false,
    );
  }

  static CustomButton icon({
    Key? key,
    required VoidCallback? onPressed,
    required Widget child,
    ButtonSize size = ButtonSize.medium,
    bool isLoading = false,
    EdgeInsetsGeometry? padding,
    Color? backgroundColor,
    Color? foregroundColor,
    double? elevation,
    bool showShadow = true,
  }) {
    return CustomButton(
      key: key,
      onPressed: onPressed,
      child: child,
      type: ButtonType.icon,
      size: size,
      isLoading: isLoading,
      isFullWidth: false,
      padding: padding,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      showShadow: showShadow,
    );
  }
}
