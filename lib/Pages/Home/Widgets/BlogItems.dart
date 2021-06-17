import 'package:flutter/material.dart';
import 'package:flutterboiler/Configs/Images.dart';
import 'package:flutterboiler/Configs/Colors.dart';

class BlogItems extends StatefulWidget {
  BlogItems({
    required this.avatar,
    required this.name,
    required this.pic,
    required this.desc,
  });

  final String avatar;
  final String name;
  final String desc;
  final String pic;

  @override
  _BlogItemsState createState() => _BlogItemsState();
}

class _BlogItemsState extends State<BlogItems> {
  @override
  void initState() {
    super.initState();
    // print(widget.avatar);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 10),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 10),
            child: Row(
              children: [
                // Image.asset(
                //   Images.logo,
                //   height: 20,
                // ),
                Image.network(
                  widget.avatar,
                  height: 20,
                ),
                SizedBox(width: 10),
                Text(
                  widget.name,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.blackTheme,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Image.network(
            widget.pic,
          ),
          SizedBox(width: 10),
          Column(
            children: [
              RichText(
                text: TextSpan(
                    text: widget.name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.blackTheme,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' ' + widget.desc,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.blackTheme,
                          fontSize: 14,
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
