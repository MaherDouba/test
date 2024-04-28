class point {
  double x;
  double y;
  point(this.x, this.y);
  //named constructor "start_point" for creating a point at (0,0)
  point.start_point()
      : x = 0,
        y = 0;      
}
void main(){
  point p =point(3.5, 2.7);
  print('random point: x=${p.x} | y=${p.y}');

  point p0 =point.start_point();
  print('sstart point : ${p0.x} | ${p0.y}');
}