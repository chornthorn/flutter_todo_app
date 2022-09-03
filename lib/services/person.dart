// inmutable
class Container {
  final double height;
  final double width;
  final String color;
  final String? child;

  Container({
    required this.height,
    required this.width,
    required this.color,
    required this.child,
  });
}

void main() {
  var p = Container(
    height: 100,
    width: 100,
    color: 'red',
    child: 'Hello world',
  );
  p.color ='blue';
  print(p.name);
}
