import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

class GuidelineOptionCard extends StatefulWidget {
  String title;
  String url;
  String img;
  GuidelineOptionCard({Key? key, required this.title, required this.url,required this.img})
      : super(key: key);

  @override
  State<GuidelineOptionCard> createState() => _GuidelineOptionCardState();
}

class _GuidelineOptionCardState extends State<GuidelineOptionCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          width: 250,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, widget.url);
            },
            child: Card(
                clipBehavior: Clip.antiAlias,

                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  side: BorderSide(
                    color: Colors.blue.shade900,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                          padding: EdgeInsets.all(8),
                          child: Image.asset(
                            widget.img,
                            height: 50,
                            width: 50,
                          )),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(

                            color: Colors.blue.shade900,

                            child: Center(
                                child: Text(
                              widget.title,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                            )))),
                  ],
                )),
          ),
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
