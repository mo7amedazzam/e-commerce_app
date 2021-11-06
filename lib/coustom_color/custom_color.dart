import 'package:flutter/cupertino.dart';

class Custom_Color extends StatelessWidget {
  // Color color1 =  Color(0xFF6A1B9A);
  // Color color2 =  Color(0xFFCE93DB);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
          Color(0xFF6A1B9A),
          Color(0xFFCE93DB),
          ]
        )
      ),
    );
  }
}
