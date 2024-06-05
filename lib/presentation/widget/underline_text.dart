part of presentation_widget;

class UnderlinedText extends StatelessWidget {
  final String text;
  final double underlineOffset;
  final TextStyle textStyle;
  final Color underlineColor;

  const UnderlinedText({
    super.key,
    required this.text,
    required this.underlineOffset,
    required this.textStyle,
    required this.underlineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: textStyle,
        ),
        Container(
          margin: EdgeInsets.only(top: underlineOffset),
          width: _getTextWidth(text, textStyle) + 8,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: underlineColor,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  double _getTextWidth(String text, TextStyle style) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.width;
  }
}
