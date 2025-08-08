import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class BaseDialogPlugin {
  Future<void> alertDialogBasedOnPlatform(
    BuildContext context, {
    String? title,
    String? message,
    String? buttonText,
    Color? titleColor,
    Color? messageColor,
    Color? buttonColor,
    VoidCallback? function,
    Color? backgroundColor,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return buildDialogBasedOnPlatform(
          context,
          title,
          message,
          buttonText,
          titleColor,
          messageColor,
          buttonColor,
          function,
          backgroundColor,
        );
      },
    );
  }

  Future<void> actionDialogBasedOnPlatform(
    BuildContext context, {
    String? title,
    String? message,
    String? buttonTextLeft,
    String? buttonTextRight,
    Color? titleColor,
    Color? messageColor,
    Color? buttonColorLeft,
    Color? buttonColorRight,
    VoidCallback? leftFunction,
    VoidCallback? rightFunction,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return buildActionDialogBasedOnPlatform(
          context,
          title,
          message,
          buttonTextLeft,
          buttonTextRight,
          titleColor,
          messageColor,
          buttonColorLeft,
          buttonColorRight,
          leftFunction,
          rightFunction,
        );
      },
    );
  }
}

Widget buildDialogBasedOnPlatform(
  BuildContext context,
  String? title,
  String? message,
  String? buttonText,
  Color? titleColor,
  Color? messageColor,
  Color? buttonColor,
  VoidCallback? function,
  Color? backgroundColor,
) {
  if (Platform.isAndroid) {
    return AlertDialog(
      backgroundColor: backgroundColor ?? Colors.white,
      title: Text(
        title ?? '',
        style: TextStyle(color: titleColor ?? Colors.black),
      ),
      content: Text(
        message ?? '',
        style: TextStyle(color: messageColor ?? Colors.black),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (function != null) {
              function();
            }
            Navigator.of(context).pop();
          },
          child: Text(
            buttonText ?? 'OK',
            style: TextStyle(color: buttonColor ?? Colors.blue),
          ),
        ),
      ],
    );
  } else if (Platform.isIOS) {
    return CupertinoAlertDialog(
      title: Text(
        title ?? '',
        style: TextStyle(color: titleColor ?? Colors.black),
      ),
      content: Text(
        message ?? '',
        style: TextStyle(color: messageColor ?? Colors.black),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            if (function != null) {
              function();
            }
            Navigator.of(context).pop();
          },
          child: Text(
            buttonText ?? 'OK',
            style: TextStyle(color: buttonColor ?? Colors.blue),
          ),
        ),
      ],
    );
  }
  return SizedBox.shrink();
}

Widget buildActionDialogBasedOnPlatform(
  BuildContext context,
  String? title,
  String? message,
  String? buttonTextLeft,
  String? buttonTextRight,
  Color? titleColor,
  Color? messageColor,
  Color? buttonColorLeft,
  Color? buttonColorRight,
  VoidCallback? leftFunction,
  VoidCallback? rightFunction,
) {
  if (Platform.isAndroid) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        title ?? '',
        style: TextStyle(color: titleColor ?? Colors.black),
      ),
      content: Text(
        message ?? '',
        style: TextStyle(color: messageColor ?? Colors.black),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (leftFunction != null) {
              leftFunction;
            }
            Navigator.of(context).pop();
          },
          child: Text(
            buttonTextLeft ?? 'OK',
            style: TextStyle(color: buttonColorLeft ?? Colors.blue),
          ),
        ),
        TextButton(
          onPressed: () {
            if (rightFunction != null) {
              rightFunction;
            }
            Navigator.of(context).pop();
          },
          child: Text(
            buttonTextRight ?? 'OK',
            style: TextStyle(color: buttonColorRight ?? Colors.blue),
          ),
        ),
      ],
    );
  } else if (Platform.isIOS) {
    return CupertinoAlertDialog(
      title: Text(
        title ?? '',
        style: TextStyle(color: titleColor ?? Colors.black),
      ),
      content: Text(
        message ?? '',
        style: TextStyle(color: messageColor ?? Colors.black),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            if (leftFunction != null) {
              leftFunction;
            }
            Navigator.of(context).pop();
          },
          child: Text(
            buttonTextLeft ?? 'OK',
            style: TextStyle(color: buttonColorLeft ?? Colors.blue),
          ),
        ),
        CupertinoDialogAction(
          onPressed: () {
            if (rightFunction != null) {
              rightFunction;
            }
            Navigator.of(context).pop();
          },
          child: Text(
            buttonTextRight ?? 'OK',
            style: TextStyle(color: buttonColorRight ?? Colors.blue),
          ),
        ),
      ],
    );
  } else if (Platform.isIOS) {
    return CupertinoAlertDialog(
      title: Text(
        title ?? '',
        style: TextStyle(color: titleColor ?? Colors.black),
      ),
      content: Text(
        message ?? '',
        style: TextStyle(color: messageColor ?? Colors.black),
      ),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            if (leftFunction != null) {
              leftFunction;
            }
            Navigator.of(context).pop();
          },
          child: Text(
            buttonTextLeft ?? 'OK',
            style: TextStyle(color: buttonColorLeft ?? Colors.blue),
          ),
        ),
        CupertinoDialogAction(
          onPressed: () {
            if (rightFunction != null) {
              rightFunction;
            }
            Navigator.of(context).pop();
          },
          child: Text(
            buttonTextRight ?? 'OK',
            style: TextStyle(color: buttonColorRight ?? Colors.blue),
          ),
        ),
      ],
    );
  }
  return SizedBox.shrink();
}

class DialogStyling {
  String? title;
  String? message;
  String? buttonText;
  Color? titleColor;
  Color? messageColor;
  Color? buttonColor;
  VoidCallback? function;
  Color? backgroundColor;

  DialogStyling({
    this.title,
    this.message,
    this.buttonText,
    this.titleColor,
    this.messageColor,
    this.buttonColor,
    this.function,
    this.backgroundColor,
  });
}

class ActionDialogStyling {
  String? title;
  String? message;
  String? buttonTextLeft;
  String? buttonTextRight;
  Color? titleColor;
  Color? messageColor;
  Color? buttonColorLeft;
  Color? buttonColorRight;
  VoidCallback? leftFunction;
  VoidCallback? rightFunction;

  ActionDialogStyling({
    this.title,
    this.message,
    this.buttonTextLeft,
    this.buttonTextRight,
    this.titleColor,
    this.messageColor,
    this.buttonColorLeft,
    this.buttonColorRight,
    this.leftFunction,
    this.rightFunction,
  });
}
