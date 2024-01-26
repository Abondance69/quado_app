import 'package:flutter/material.dart';
/// ** Start Variables
Color background = const Color.fromARGB(255, 24, 23, 23);
String src = "https://images.pexels.com/photos/2801312/pexels-photo-2801312.jpeg?auto=compress&cs=tinysrgb&w=600";


/// * End Variables

/// ** Start Text
Text simpleText(str, [double size = 23, FontWeight fontWeight = FontWeight.normal, Color color = Colors.black]) {
  return Text(
    str,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

/// ** End Text


/// ** Start Icon
Icon simpleIcon(IconData icon, [double size = 30, Color color = const Color.fromARGB(255, 0, 15, 115)]) {
  return Icon(
    icon,
    size: size,
    color : color,
  );
}

IconButton myIconButton(IconData icon, function) {
  return IconButton(
    onPressed: () => function,
    icon: simpleIcon(icon, 30),
    style: IconButton.styleFrom(
      // ebackgroundColor: Colors.white,
    )
  );
}

/// ** End ElevatedButon
ElevatedButton buttonElevated(String text, function) {
  return ElevatedButton(
    onPressed: () => function, 
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 0, 8, 69),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      )
    ),
    child: simpleText(text, 23, FontWeight.normal, Colors.white),
  );
}