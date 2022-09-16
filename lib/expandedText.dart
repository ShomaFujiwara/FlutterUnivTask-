
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText(
    this.data, {
      Key? key,
      this.maxLines = 3,
      this.textOverflow = TextOverflow.fade,
    }
  ): super(key: key);

  final String data;
  final int maxLines;
  final TextOverflow textOverflow;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;  //boolは０か１

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {//constraintsはそのwidgetの高さや幅に関する情報
      final textSpan = TextSpan(text: widget.data);
      final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.ltr, maxLines: widget.maxLines);

      textPainter.layout(maxWidth: constraints.maxWidth);

      if (textPainter.didExceedMaxLines) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.data,
              overflow: widget.textOverflow,
              maxLines: _isExpanded ? null : widget.maxLines,
            ),
            const SizedBox(height: 4.0,),
            TextButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              }, 
              child: Text(
                _isExpanded ? '閉じる' : 'もっと見る'
              ),
            )
          ],
        );
      } else {
        return Text(
          widget.data,
          maxLines: widget.maxLines,
        );
      }
    });
  }
}

   