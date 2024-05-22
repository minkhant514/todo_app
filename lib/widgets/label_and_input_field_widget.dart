import 'package:flutter/material.dart';

import 'package:getx_tutorial/widgets/easy_text_widget.dart';

import '../const/dimens.dart';

class LabelAndInputFieldWidget extends StatelessWidget {
  final String titleText, hint;
  final bool? noted;
  final Widget? widget;
  final TextEditingController? textEditingController;

  const LabelAndInputFieldWidget({
    super.key,
    required this.titleText,
    required this.hint,
    this.textEditingController,
    this.noted,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        EasyTextWidget(
          text: titleText,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(
          height: kDefaultSpace - 14,
        ),
        Container(
          padding:
              const EdgeInsets.symmetric(vertical: k2SP, horizontal: k10SP),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kDefaultRadius),
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  readOnly: widget != null,
                  controller: textEditingController,
                  maxLines: (noted ?? false) ? 3 : 1,
                  decoration: InputDecoration(
                    focusColor: Colors.transparent,
                    hintText: hint,
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                ),
              ),
              widget ?? SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
