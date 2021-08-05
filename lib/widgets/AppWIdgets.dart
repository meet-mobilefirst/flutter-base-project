import 'package:baseproject/platfrom-widgets/PlatformAlertDialog.dart';
import 'package:baseproject/utils/AppColors.dart';
import 'package:baseproject/utils/AppTextStyles.dart';
import 'package:baseproject/widgets/ShowCustomErrorMessage.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppWidgets {
  static Future dismissDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Future dismissDialogWithRootNavigator(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  static Future popScreen(BuildContext context) {
    Navigator.of(context).pop();
  }

  static Widget spacingWidget(double height) {
    return SizedBox(height: height);
  }

  static Widget somethingWrong({String title}) {
    return Center(
        child:
            new Text(title ?? "something want wrong...Please try again later"));
  }

  static Widget imageLoader(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes
                : null,
          ),
        );
      },
    );
  }

  //TextField Widgets
  static Widget textFieldWithUnderline({
    String hintText,
    TextStyle hintStyle,
    TextStyle inputTextStyle,
    TextEditingController controller,
    Widget prefix,
    Widget suffix,
    TextInputType textInputType,
    bool autofocus = false,
    List<TextInputFormatter> textInputFormatters,
    Function(String) onChanged,
    bool readOnly,
    Function onTap,
    Function(String) validator,
    Function(String) onSaved,
    bool isObscureText,
    int maxlines,
    bool expands,
    int minlines,
    bool showCursor,
    FocusNode focusNode,
    Color underLineColor,
    double enabledBorderWidth,
    double focusedBorderWidth,
  }) {
    return TextFormField(
      expands: expands ?? false,
      controller: controller,
      obscureText: isObscureText ?? false,
      autofocus: autofocus,
      cursorColor: AppColors.bgPrimary,
      showCursor: showCursor ?? null,
      inputFormatters: textInputFormatters,
      style: inputTextStyle ?? AppTextStyles.textFieldTextStyle(),
      keyboardType: textInputType ?? TextInputType.text,
      onTap: onTap,
      validator: validator,
      onSaved: onSaved,
      maxLines: maxlines ?? 1,
      focusNode: focusNode ?? null,
      minLines: minlines,
      onChanged: (value) {
        if (onChanged != null) return onChanged(value);
      },
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        hintText: hintText ?? '',
        hintStyle: hintStyle ?? AppTextStyles.hintTextStyle(),
        prefixIcon: prefix ?? null,
        prefixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
        suffixIcon: suffix ?? null,
        suffixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: underLineColor ?? AppColors.bgPrimary,
            width: enabledBorderWidth ?? 2,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.bgPrimary,
            width: focusedBorderWidth ?? 2,
          ),
        ),
      ),
    );
  }

  static Widget textFieldWithRectBorder({
    String hintText,
    TextEditingController controller,
    Widget prefix,
    Widget prefixIcon,
    Widget suffix,
    TextInputType textInputType,
    bool autofocus = false,
    List<TextInputFormatter> textInputFormatters,
    Function(String) onChanged,
    TextStyle hintTextStyle,
    Color enableBorderColor,
    Color focusBorderColor,
    int maxlines,
    int minlines,
    double enabledBorderRadius,
    double focusedBorderRadius,
    EdgeInsets contentPadding,
    BoxConstraints prefixConstraints,
  }) {
    return TextFormField(
      controller: controller,
      autofocus: autofocus,
      cursorColor: AppColors.bgPrimary,
      inputFormatters: textInputFormatters,
      style: AppTextStyles.textFieldTextStyle(),
      keyboardType: textInputType ?? TextInputType.text,
      maxLines: maxlines ?? 1,
      minLines: minlines,
      onChanged: (value) {
        return onChanged(value);
      },
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText ?? '',
        hintStyle: hintTextStyle ?? AppTextStyles.hintTextStyle(),
        prefix: prefix ?? null,
        prefixIcon: prefixIcon ?? null,
        prefixIconConstraints: prefixConstraints,
        contentPadding: contentPadding,
        suffixIcon: suffix ?? null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(enabledBorderRadius ?? 8),
          borderSide: BorderSide(
            color: enableBorderColor ?? AppColors.bgPrimary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(focusedBorderRadius ?? 8),
          borderSide: BorderSide(
            color: focusBorderColor ?? AppColors.bgPrimary,
          ),
        ),
      ),
    );
  }

  static Widget textFieldWithCircularBorder({
    String hintText,
    TextEditingController controller,
    Widget prefix,
    Widget prefixIcon,
    bool readOnly,
    Function onTap,
    Widget suffix,
    TextInputType textInputType,
    bool autofocus = false,
    List<TextInputFormatter> textInputFormatters,
    Function(String) onChanged,
    TextStyle hintTextStyle,
    TextStyle style,
    double radius,
    Color borderColor,
  }) {
    return TextFormField(
      controller: controller,
      autofocus: autofocus,
      cursorColor: AppColors.bgPrimary,
      inputFormatters: textInputFormatters,
      style: style ?? AppTextStyles.textFieldTextStyle(),
      keyboardType: textInputType ?? TextInputType.text,
      onChanged: (value) {
        if (onChanged != null) {
          return onChanged(value);
        }
      },
      onTap: onTap != null ? onTap : null,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText ?? '',
        hintStyle: hintTextStyle ?? AppTextStyles.hintTextStyle(),
        prefix: prefix ?? null,
        prefixIcon: prefixIcon ?? null,
        suffixIcon: suffix ?? null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 50),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.bgPrimary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 50),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.bgPrimary,
          ),
        ),
      ),
    );
  }

  ///While Using centerChildWidget give text to empty string
  static Widget buttonWidget(
    String text, {
    Function onPressed,
    Color backgroundColor,
    Color textColor,
    Widget icon,
    bool isBorder = false,
    double borderRadius,
    FontWeight fontWeight,
    double fontSize,
    double buttonPadding,
    Widget centerChildWidget,
    bool isWidgetExceptText = false,
  }) {
    return Container(
      color: Colors.transparent,
      // width: Get.width,
      child: RaisedButton(
        elevation: 0,
        onPressed: onPressed,
        disabledColor: AppColors.bgPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius ?? 8),
          ),
          side: BorderSide(
            color: isBorder ? AppColors.bgPrimary : Colors.transparent,
          ),
        ),
        color: backgroundColor ?? AppColors.bgPrimary,
        padding: EdgeInsets.symmetric(vertical: buttonPadding ?? 14),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon ?? Container(),
            Expanded(
              child: Center(
                child: AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  child: isWidgetExceptText
                      ? centerChildWidget ?? Container()
                      : Text(
                          text,
                          style: AppTextStyles.buttonTextStyle(
                              fontWeight: fontWeight ?? null,
                              textColor: textColor ?? null,
                              fontSize: fontSize),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget appButton(
      {BuildContext context,
      VoidCallback onTabClick,
      String title,
      Color buttonColor}) {
    assert(context != null, 'Please pass context in Appbutton ');
    assert(title != null, 'Please enter button name in Appbutton');
    return Container(
      decoration: new BoxDecoration(boxShadow: [
        BoxShadow(
          color: buttonColor?.withOpacity(0.1) ??
              AppColors.bgPrimary.withOpacity(0.1),
          spreadRadius: 0,
          blurRadius: 0,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ]),
      width: MediaQuery.of(context).size.width * 0.8,
      child: new RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          padding: const EdgeInsets.all(12),
          onPressed: () => onTabClick.call(),
          color: buttonColor ?? AppColors.bgPrimary,
          child: new Text(
            title,
            style: AppTextStyles.appTextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          )),
    );
  }

  static Widget appAppbar(String title,
      {double fSize, Color fColor, Color bgColor}) {
    return CupertinoNavigationBar(
      transitionBetweenRoutes: true,
      padding: EdgeInsetsDirectional.only(start: 0, top: 5),
      border: null,
      backgroundColor: bgColor ?? Colors.white,
      middle: new Text(
        title,
        style: AppTextStyles.appTextStyle(
            color: fColor ?? Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: fSize ?? 17),
      ),
    );
  }

  static Widget appBarForMainScreen(String title,
      {double fSize,
      Color fColor,
      Color bgColor,
      FontWeight fWeight,
      bool centerTitle,
      Widget bottom}) {
    return AppBar(
      backgroundColor: bgColor,
      elevation: 0,
      leading: Container(),
      leadingWidth: 0,
      title: Container(
        padding: const EdgeInsets.only(
          left: 16,
          top: 20,
        ),
        child: Text(
          title,
          style: AppTextStyles.titleTextStyle(
            color: fColor,
            fontSize: fSize,
            fontWeight: fWeight,
          ),
        ),
      ),
      bottom: bottom,
      centerTitle: centerTitle ?? null,
    );
  }

  static Widget appBarNormalWithLeadingAndAction(
    String title, {
    double fSize,
    Color fColor,
    Color bgColor,
    FontWeight fWeight,
    List<Widget> actions,
    Widget leading,
    bool centertitle,
  }) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.titleTextStyle(
          color: fColor,
          fontSize: fSize,
          fontWeight: fWeight,
        ),
      ),
      actions: actions,
      leading: leading,
      centerTitle: centertitle ?? true,
      backgroundColor: bgColor ?? AppColors.bgPrimary,
      elevation: 0,
    );
  }

  static Widget appAppbarWithLeading(String title,
      {double fSize, Color fColor, FontWeight fWeight, Widget leading}) {
    return CupertinoNavigationBar(
      padding: EdgeInsetsDirectional.only(start: 10),
      border: null,
      backgroundColor: Colors.white,
      leading: leading ?? Container(),
      middle: new Text(
        title,
        style: AppTextStyles.appTextStyle(
            color: fColor ?? Colors.black,
            fontWeight: fWeight ?? FontWeight.w600,
            fontSize: fSize ?? 17),
      ),
    );
  }

  static Widget appAppbarWithAction(
      String title, String trailing, Function voidCallback,
      {double fSize, Color fColor, GlobalKey editKey}) {
    return CupertinoNavigationBar(
      padding: EdgeInsetsDirectional.only(start: 10),
      border: null,
      backgroundColor: Colors.white,
      middle: new Text(
        title,
        style: AppTextStyles.appTextStyle(
            color: fColor ?? Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: fSize ?? 17),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: GestureDetector(
          onTap: () => voidCallback.call(),
          child: new Text(
            trailing,
            key: editKey ?? null,
            style: AppTextStyles.appTextStyle(
                color: AppColors.bgPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  static Widget appAppbarWithActionWidget(
      String title, String trailing, Widget action,
      {double fSize, Color fColor}) {
    return CupertinoNavigationBar(
      padding: EdgeInsetsDirectional.only(start: 10),
      border: null,
      backgroundColor: Colors.white,
      middle: new Text(
        title,
        style: AppTextStyles.appTextStyle(
            color: fColor ?? Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: fSize ?? 17),
      ),
      trailing:
          Padding(padding: const EdgeInsets.only(right: 10), child: action),
    );
  }

  static Widget appAppbarWithActionAndLeadingWidget(String title, Widget action,
      {double fSize, Color fColor, Widget leading}) {
    return CupertinoNavigationBar(
      padding: EdgeInsetsDirectional.only(start: 10),
      border: null,
      leading: leading ?? new Container(),
      backgroundColor: Colors.white,
      middle: new Text(
        title,
        style: AppTextStyles.appTextStyle(
            color: fColor ?? Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: fSize ?? 17),
      ),
      trailing:
          Padding(padding: const EdgeInsets.only(right: 15), child: action),
    );
  }

  static Widget imageFromNetworkWidget(String imageUrl,
      {BoxFit fit, double height, double width, Key key}) {
    return CachedNetworkImage(
      key: key,
      imageUrl: imageUrl,
      placeholder: (context, _) {
        return Container();
        //TODO: ADD PLACEHOLDER
      },
      errorWidget: (context, _, __) {
        //TODO: ADD ERROR WIDGET
        return Container();
      },
      fit: fit ?? BoxFit.fill,
      height: height,
      width: width,
    );
  }

  // static Future dialogLoadingBar({String message}) {
  //   Widget loadingWidget = Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       loadingView(),
  //       message != null ? new Text(message) : Container()
  //     ],
  //   );
  //   return Get.dialog(loadingWidget);
  // }

  static Widget loadingView({double size = 90}) {
    return SpinKitDoubleBounce(
      size: size,
      color: AppColors.bgPrimary,
    );
  }

  static Widget switchWidget(
      {@required Function(bool) onChanged,
      @required bool isSelected,
      Color activeColor}) {
    return Switch(
      onChanged: onChanged,
      value: isSelected,
      activeColor: activeColor ?? AppColors.bgPrimary,
      inactiveTrackColor: AppColors.bgPrimary.withOpacity(0.4),
      inactiveThumbColor: AppColors.bgPrimary,
      activeTrackColor: AppColors.bgPrimary.withOpacity(0.4),
    );
  }

  static void showErrorMessage(String message, {Alignment alignment}) {
    BotToast.showCustomNotification(
      animationDuration: Duration(milliseconds: 800),
      align: alignment ?? Alignment(0, 0.8),
      toastBuilder: (cancel) {
        return ShowCustomErrorMessage(
          cancelFunc: cancel,
          message: message,
        );
      },
      enableSlideOff: true,
    );
  }

  static Future showResetPassDialog(BuildContext context) {
    PlatformAlertDialog(
      title: 'Reset Password',
      content:
          'A password reset link has been sent to your registered email address. Please check your email.',
      cancelText: 'Okay',
    ).show(context);
  }

  static Future showErrorDialog(BuildContext context, String error,
      {String title}) {
    PlatformAlertDialog(
      title: title ?? 'Login',
      content: error,
      cancelText: 'Dismiss',
    ).show(context);
  }

  static Future showLogoutDialog(
      BuildContext context, VoidCallback voidCallback) {
    PlatformAlertDialog(
      title: 'Logout',
      content: 'Are you sure you want to Logout ?',
      cancelText: 'No',
      submitText: 'Logout',
      voidCallback: voidCallback,
    ).show(context);
  }

  static Future showDeleteDialog(
      BuildContext context, VoidCallback voidCallback) {
    PlatformAlertDialog(
      title: 'Delete Account',
      content: 'Are you sure you want to Delete your account ?',
      cancelText: 'No',
      submitText: 'DELETE',
      voidCallback: voidCallback,
    ).show(context);
  }

  static Future showLocationDialog(
      BuildContext context, VoidCallback voidCallback) {
    PlatformAlertDialog(
      title: 'Enable Location Services',
      content: 'Please enable Location services to fetch the current location',
      cancelText: 'Cancel',
      submitText: 'Open Settings',
      voidCallback: voidCallback,
    ).show(context);
  }

  // static void closeDialog() {
  //   if (Get.isDialogOpen) {
  //     Get.back();
  //   }
  // }
}
