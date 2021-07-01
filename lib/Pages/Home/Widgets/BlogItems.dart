import 'package:flutter/material.dart';
import 'package:flutterboiler/Configs/Colors.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:math';
import 'package:intl/intl.dart';

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
  bool hideText = true;
  String randomNumber = '0';

  @override
  void initState() {
    super.initState();
    randomNumber = doRandom();
    // print(widget.avatar);
  }

  doRandom() {
    var rng = new Random();
    var random = rng.nextInt(10000);
    var formatter = NumberFormat('#,##,000', 'eu');
    return formatter.format(random);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20, top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10, top: 10, left: 10),
            child: Row(
              children: [
                // Image.asset(
                //   Images.logo,
                //   height: 20,
                // ),
                Visibility(
                  visible: widget.avatar != '',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      widget.avatar,
                      height: 40,
                      loadingBuilder: (
                        BuildContext context,
                        Widget child,
                        ImageChunkEvent? loadingProgress,
                      ) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child: Container(
                            width: 40,
                            height: 40,
                            color: Theme.of(context).colorScheme.grayTitle,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.avatar == '',
                  child: Container(
                    width: 40,
                    height: 40,
                    color: Theme.of(context).colorScheme.grayTitle,
                  ),
                ),
                SizedBox(width: 10),
                Visibility(
                  visible: widget.name != '',
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.blackTheme,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.name == '',
                  child: Container(
                    height: 14,
                    width: 200,
                    color: Theme.of(context).colorScheme.grayTitle,
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.pic != '',
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Image.network(
                widget.pic,
                width: MediaQuery.of(context).size.width,
                loadingBuilder: (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                ) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      color: Theme.of(context).colorScheme.grayTitle,
                    ),
                  );
                },
              ),
            ),
          ),
          Visibility(
            visible: widget.pic == '',
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              color: Theme.of(context).colorScheme.grayTitle,
            ),
          ),
          Visibility(
            visible: widget.pic != '',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.favorite_outline),
                    SizedBox(width: 20),
                    Icon(Icons.chat_bubble_outline_sharp),
                    SizedBox(width: 20),
                    Icon(Icons.share_outlined),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.bookmark_outline),
                    SizedBox(width: 10),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: widget.pic != '',
            child: Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "$randomNumber suka",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.blackTheme,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, top: 10),
            child: RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                text: '',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.blackTheme,
                  fontSize: 14,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: widget.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' ' +
                        (widget.desc.length > 50 && hideText
                            ? widget.desc.substring(0, 43)
                            : widget.desc),
                  )
                ],
              ),
            ),
          ),
          Visibility(
            visible: hideText,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: InkWell(
                onTap: () {
                  setState(() {
                    hideText = false;
                  });
                },
                child: Text(
                  "Selengkapnya....",
                  style: TextStyle(color: Colors.black38),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
