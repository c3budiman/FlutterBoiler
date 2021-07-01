import 'package:flutter/material.dart';

class DrawerItems extends StatefulWidget {
  DrawerItems({
    required this.title,
    required this.icon,
    required this.color,
    Function? this.onTap,
  });

  final String title;
  final Color color;
  final IconData icon;
  final onTap;

  @override
  _DrawerItemsState createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.white,
              width: 0.4,
            ),
          ),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10),
            Icon(
              widget.icon,
              // size: 20,
              color: widget.color,
            ),
            SizedBox(width: 20),
            Text(
              widget.title,
              style: TextStyle(
                color: widget.color,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
