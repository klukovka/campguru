import 'package:flutter/material.dart';

enum MessageSide { left, right }

class MessageContainer extends StatelessWidget {
  final bool isLast;
  final Color background;
  final MessageSide side;
  final Widget child;

  const MessageContainer({
    Key? key,
    required this.isLast,
    required this.background,
    this.side = MessageSide.right,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _MessageShapePainter(
        background: background,
        isLast: isLast,
        side: side,
      ),
      child: child,
    );
  }
}

class _MessageShapePainter extends CustomPainter {
  static const _borderRadius = 12.0;
  final MessageSide side;
  final bool isLast;
  final Color background;

  const _MessageShapePainter({
    required this.isLast,
    required this.background,
    required this.side,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = background
      ..style = PaintingStyle.fill;

    late Path path;
    switch (side) {
      case MessageSide.left:
        path = _getLeftMessagePath(size);
        break;
      case MessageSide.right:
        path = _getRightMessagePath(size);
        break;
    }

    canvas.drawPath(path, paint);
  }

  Path _getRightMessagePath(Size size) {
    Path path = Path();
    if (isLast) {
      path.moveTo(size.width + _borderRadius, size.height);
    } else {
      path.moveTo(size.width - _borderRadius, size.height);
    }
    path.lineTo(_borderRadius, size.height);
    path.arcToPoint(
      Offset(0, size.height - _borderRadius),
      radius: const Radius.circular(_borderRadius),
    );
    path.lineTo(0, _borderRadius);
    path.arcToPoint(
      const Offset(_borderRadius, 0),
      radius: const Radius.circular(_borderRadius),
    );
    path.lineTo(size.width - _borderRadius, 0);
    path.arcToPoint(
      Offset(size.width, _borderRadius),
      radius: const Radius.circular(_borderRadius),
    );
    if (isLast) {
      path.lineTo(size.width, size.height - _borderRadius - 2);
      path.arcToPoint(
        Offset(size.width + _borderRadius, size.height - 2),
        radius: const Radius.circular(_borderRadius),
        clockwise: false,
      );
      path.lineTo(size.width + _borderRadius, size.height);
    } else {
      path.lineTo(size.width, size.height - _borderRadius);
      path.arcToPoint(
        Offset(size.width - _borderRadius, size.height),
        radius: const Radius.circular(_borderRadius),
      );
    }
    return path;
  }

  Path _getLeftMessagePath(Size size) {
    Path path = Path();
    if (isLast) {
      path.moveTo(-_borderRadius, size.height);
    } else {
      path.moveTo(_borderRadius, size.height);
    }
    path.lineTo(size.width - _borderRadius, size.height);
    path.arcToPoint(
      Offset(size.width, size.height - _borderRadius),
      radius: const Radius.circular(_borderRadius),
      clockwise: false,
    );
    path.lineTo(size.width, _borderRadius);
    path.arcToPoint(
      Offset(size.width - _borderRadius, 0),
      radius: const Radius.circular(_borderRadius),
      clockwise: false,
    );
    path.lineTo(_borderRadius, 0);
    path.arcToPoint(
      const Offset(0, _borderRadius),
      radius: const Radius.circular(_borderRadius),
      clockwise: false,
    );
    if (isLast) {
      path.lineTo(0, size.height - _borderRadius - 2);
      path.arcToPoint(
        Offset(-_borderRadius, size.height - 2),
        radius: const Radius.circular(_borderRadius),
      );
      path.lineTo(-_borderRadius, size.height);
    } else {
      path.lineTo(0, size.height - _borderRadius);
      path.arcToPoint(
        Offset(_borderRadius, size.height),
        radius: const Radius.circular(_borderRadius),
        clockwise: false,
      );
    }
    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
