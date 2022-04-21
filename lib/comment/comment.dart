// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentBox extends StatelessWidget {
  Widget? child;
  dynamic? sendMessageComment;
  var formKey;
  var commetController;
  Widget? sendWidget;
  Color? textColor;
  Color? backgroundColor;
  String? errorText;
  String? hintText;
  CommentBox(
      {Key? key,
      this.child,
      this.sendMessageComment,
      this.formKey,
      this.commetController,
      this.sendWidget,
      this.textColor,
      this.backgroundColor,
      this.errorText,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: child!),
        Divider(height: 1.h,),
        _sendMessage(context),
      ],
    );
  }

  _sendMessage(BuildContext context) {
    return ListTile(
      title: Form(
          key: formKey,
          child: TextFormField(
            cursorHeight: MediaQuery.of(context).viewPadding.bottom,    
            maxLines: 4,
            minLines: 1,
            controller: commetController,

            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              hintText: hintText,
              focusColor: textColor,
              filled: true,
              fillColor: textColor,
            ),
            validator: (value) {
              value!.isEmpty ? errorText : null;
            },
          )),
        trailing: IconButton(
          onPressed: sendMessageComment,
          icon: sendWidget!,
          iconSize: 40,
        )
    );
  }
}
