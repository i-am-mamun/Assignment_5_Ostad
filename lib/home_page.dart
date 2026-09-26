import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w500,
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _showMessage(context, 'Add a new profile item'),
            icon: const Icon(Icons.add, size: 34),
            tooltip: 'Add',
          ),
          IconButton(
            onPressed: () => _showMessage(context, 'Settings opened'),
            icon: const Icon(Icons.settings, size: 31),
            tooltip: 'Settings',
          ),
          IconButton(
            onPressed: () => _showMessage(context, 'Calling profile'),
            icon: const Icon(Icons.phone, size: 30),
            tooltip: 'Call',
            padding: const EdgeInsets.only(left: 10, right: 20),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final circleSize =
                (constraints.maxWidth * 0.46).clamp(190.0, 275.0);
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Column(
                children: [
                  _ProfileItem(
                    circleSize: circleSize,
                    caption: 'Ice cream is very delicious right?',
                    child: const _IceCreamMark(),
                  ),
                  const SizedBox(height: 62),
                  _ProfileItem(
                    circleSize: circleSize,
                    caption: 'Programming is not boring if you love it',
                    child: const Icon(
                      Icons.code,
                      size: 94,
                      color: Color(0xff17005d),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  static void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

class _ProfileItem extends StatelessWidget {
  const _ProfileItem({
    required this.circleSize,
    required this.caption,
    required this.child,
  });

  final double circleSize;
  final String caption;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: circleSize,
          height: circleSize,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Color(0xffe7d9ff),
              shape: BoxShape.circle,
            ),
            child: Center(child: child),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              caption,
              maxLines: 1,
              softWrap: false,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xff171717),
                fontSize: 26,
                height: 1.2,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _IceCreamMark extends StatelessWidget {
  const _IceCreamMark();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(118, 138),
      painter: _IceCreamPainter(),
    );
  }
}

class _IceCreamPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff17005d)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    final cone = Path()
      ..moveTo(32, 82)
      ..lineTo(60, 132)
      ..lineTo(88, 82);
    canvas.drawPath(cone, paint);

    final scoop = Path()
      ..moveTo(12, 62)
      ..cubicTo(12, 49, 21, 41, 33, 41)
      ..cubicTo(36, 25, 46, 15, 59, 15)
      ..cubicTo(74, 15, 84, 25, 87, 41)
      ..cubicTo(99, 41, 107, 50, 107, 62)
      ..cubicTo(107, 73, 99, 80, 89, 80)
      ..cubicTo(82, 80, 77, 77, 73, 73)
      ..cubicTo(65, 82, 50, 84, 40, 73)
      ..cubicTo(35, 78, 30, 80, 24, 80)
      ..cubicTo(17, 80, 12, 73, 12, 62);
    canvas.drawPath(scoop, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
