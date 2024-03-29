import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

class CardView extends StatefulWidget {
  String title;
  String url;
  String? icon;
   CardView({Key? key,required this.title,required this.url, this.icon}) : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slidable(
          // Specify a key if the Slidable is dismissible.
          // key: const ValueKey(0),

          // The child of the Slidable is what the user sees when the
          // component is not dragged.
          child: SizedBox(
            height: 100,
            child: InkWell(
              onTap: () {
                launchUrl(Uri.parse(widget.url),mode: LaunchMode.externalApplication);
              },
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(10)),
                    side: BorderSide(
                      color: Colors.blue.shade900,
                    ),
                  ),
                  child: ListTile(
                    leading: Container(
                        padding: EdgeInsets.all(8),
                        child: Image.asset(
                          widget.icon??'assets/img/document1.png',
                          height: 50,
                        )),
                    title: Text(
                        widget.title),

                  )),
            ),
          ),
        ),
        SizedBox(height: 15,)
      ],
    );
  }
}
