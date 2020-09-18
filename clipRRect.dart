clipRect clipRRect flutter


//https://educity.app/flutter/how-to-clip-images-in-flutter


ClipRect - ClipRect prevents the child from painting outside the box. The size and location of the clipper can be customised by changing the arguments in the clipper.
ClipRRect - ClipRRect can be used to clip the child widget circular or clip the edges with a circular radius.
ClipOval - ClipOval can be used to clip the child widget in oval shape
ClipPath - ClipPath can be used to clip the child widget in custom shape using a custom Clipper defined.


1. ClipRect




ClipRect(
  child: Container(
    child: Align(
      alignment: Alignment.center,
        widthFactor: 0.4,
        heightFactor: 1.0,
        child: Image.network(
          'https://images.unsplash.com/photo-1473992243898-fa7525e652a5'
        ),
    ),
  ),
)


//The code above shows how to clip an image with a rectangular shape. You can wrap //the image widget with an Align widget to easily position the image inside the clipper.


2. ClipRRect


ClipRRect(
  borderRadius: BorderRadius.circular(300.0),
  child: Image.network(
    "https://images.unsplash.com/photo-1523285367489-d38aec03b6bd"
  ),
)


ClipRRect is used to clip the child widget with rounded corners. The extra R stands for rounded. The borderRadius property can be used to change the radius of the rounded corners.


3. ClipOval


ClipOval(
  child: Container(
    child: Image.network(
      'https://images.unsplash.com/photo-1523965671143-ac717f1cb928'
    ),
  ),
)


4. ClipPath


ClipPath(
  clipper: TriangleClipper(),
  child: Image.network(
    "https://images.unsplash.com/photo-1513775192371-1b9d33760c3f"
  ),
)


class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
      final path = Path();
      path.moveTo(size.width/2, 0.0);
      path.lineTo(size.width, size.height);
      path.lineTo(0.0, size.height);
      path.close();
      return path;
  }
  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}




// source: https://educity.app/flutter/how-to-clip-images-in-flutter
