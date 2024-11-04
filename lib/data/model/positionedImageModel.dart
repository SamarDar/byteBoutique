class PositionedImageModel {
  final String imagePath;
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;

  PositionedImageModel({
    required this.imagePath,
    this.top,
    this.left,
    this.bottom,
    this.right,
  });
}