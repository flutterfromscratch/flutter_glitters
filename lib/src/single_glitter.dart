import 'package:flutter/widgets.dart';

import 'consts.dart';
import 'painter.dart';

/// A widget to draw a single static glitter-like shape.
///
/// A single glitter with the [color] is displayed at the [aspectRatio] to
/// fit the [size].
/// Unlike [Glitters], this has the fixed [opacity] and does not animate.
class SingleGlitter extends StatelessWidget {
  const SingleGlitter({
    Key key,
    @required this.size,
    double aspectRatio,
    Color color,
    double opacity,
  })  : assert(size != null && size > 0.0),
        assert(aspectRatio == null || aspectRatio > 0.0),
        assert(opacity == null || (opacity > 0.0 && opacity <= 1.0)),
        aspectRatio = aspectRatio ?? 1.0,
        color = color ?? kDefaultColor,
        opacity = opacity ?? 1.0,
        super(key: key);

  /// The widget is fitted into this [size].
  /// When the [aspectRatio] is not `1.0`, either the width or the height of
  /// the widget becomes smaller than the size.
  final double size;

  /// The aspect ratio (a ratio of width to height) of the widget.
  final double aspectRatio;

  /// The opacity of the main parts of the widget.
  final double opacity;

  /// The main color of the widget.
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size * aspectRatio, size),
      painter: GlitterPainter(
        squareSize: size,
        offset: Offset.zero,
        aspectRatio: aspectRatio,
        color: color,
        opacity: opacity,
      ),
    );
  }
}
