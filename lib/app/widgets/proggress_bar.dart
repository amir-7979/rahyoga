import 'package:flutter/material.dart';

class DiagonalLinePainter extends CustomPainter {
  final Color color;

  DiagonalLinePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 2;

    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, 0),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class StripedProgressIndicator extends StatelessWidget {
  final List<Color> colors;

  const StripedProgressIndicator({required this.colors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Stack(
        children: [
          LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(colors[0]),
          ),
          CustomPaint(
            painter: DiagonalLinePainter(Colors.white),
            child: LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(colors[1]),
              value: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
