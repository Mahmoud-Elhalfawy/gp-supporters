import 'package:flutter/material.dart';
import 'package:gppsupporters/Model/Cardiology.dart';
import 'package:gppsupporters/Model/Dermatology.dart';
import 'package:gppsupporters/Model/Endocrinology.dart';
import 'package:gppsupporters/Model/Endocrinology.dart';
import 'package:gppsupporters/Model/Immunology.dart';
import 'package:gppsupporters/Model/Immunology.dart';
import 'package:gppsupporters/Model/Oncology.dart';
import 'package:gppsupporters/Model/Oncology.dart';
import 'package:gppsupporters/Model/Rheumatology.dart';
import 'package:gppsupporters/View/CardView.dart';

import '../Model/CNS.dart';
import '../Model/Gastroenology.dart';
import '../Model/Geriatrics.dart';
import '../Model/GuidelineCard.dart';
import '../Model/Hepatology.dart';
import '../Model/Nephrology.dart';

class GuidelinesListScreen extends StatefulWidget {
  String type;
  String subType;

  GuidelinesListScreen({Key? key,required this.type,required this.subType}) : super(key: key);

  @override
  State<GuidelinesListScreen> createState() => _GuidelinesListScreenState();
}

class _GuidelinesListScreenState extends State<GuidelinesListScreen> {
  bool search = false;
  bool searchCriteria=true;
  String query="";
  List<CardView> calculators=List.empty(growable: true);
  List<CardView> calculatorsFiltered=List.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buildCards();
  }
  @override
  Widget build(BuildContext context) {
    if(!search){
      calculatorsFiltered=calculators;
    }
    return   Container(
      margin: const EdgeInsets.all(8),
      // padding: EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height*0.9,

      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              flex: 2,
              child:  Container(
                width: 950,
                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Flexible(
                        child: TextField(

                          onChanged: (query) {
                            search=true;
                            setState(() {
                              this.query=query;
                              if(query.isEmpty) {
                                calculatorsFiltered=calculators;
                              } else {

                                calculatorsFiltered =
                                    calculators.where((element) =>
                                        element.title.toLowerCase().contains(
                                            query.toLowerCase()))
                                        .toList();

                              }
                            });
                          },

                          // controller: _controller,
                          decoration: InputDecoration(
                            // suffixIconColor: Colors.white,
                              hintText: "Search",
                              hintStyle: TextStyle(color: Colors.grey),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.indigo.shade900,
                              ),
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 5),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              )

          ),
          Expanded(
            flex: 6,
            child: Container(

              margin: EdgeInsets.only(top:8,bottom: 20),

              decoration:  BoxDecoration(

                // border: Border.all(color:Colors.black, width: 2),
                // borderRadius: BorderRadius.all(Radius.circular(8)),


              ),

              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: calculatorsFiltered,
                ),
              ),
            ),
          ),




        ],
      ),



    );
  }

  buildCards(){


    if(widget.type=="cardiology"){
      Cardiology cardioModel=Cardiology();
      List<GuidelineCard> cards=cardioModel.cardioMap[widget.subType]!;

      for(GuidelineCard cardioCard in cards){
        calculators.add(CardView(title: cardioCard.title, url: cardioCard.url,icon: 'assets/img/cardiology.png',),);

      }
    }else if(widget.type=="hepatology"){
      Hepatology hepaModel=Hepatology();
      List<GuidelineCard> cards=hepaModel.hepaMap[widget.subType]!;

      for(GuidelineCard hepaCard in cards){
        calculators.add(CardView(title: hepaCard.title, url: hepaCard.url,icon: 'assets/img/hepatology.png',),);

      }
    }else if(widget.type=="immunology"){
      Immunology immunoModel=Immunology();
      List<GuidelineCard> cards=immunoModel.immunoMap[widget.subType]!;

      for(GuidelineCard immunoCard in cards){
        calculators.add(CardView(title: immunoCard.title, url: immunoCard.url,icon: 'assets/img/antibodies.png',),);

      }
    }else if(widget.type=="cns"){
      CNS cnsModel=CNS();
      List<GuidelineCard> cards=cnsModel.cnsMap[widget.subType]!;

      for(GuidelineCard cnsCard in cards){
        calculators.add(CardView(title: cnsCard.title, url: cnsCard.url,icon: 'assets/img/brain.png',),);

      }
    }else if(widget.type=="endocrinology"){
      Endocrinology endoModel=Endocrinology();
      List<GuidelineCard> cards=endoModel.endoMap[widget.subType]!;

      for(GuidelineCard endoCard in cards){
        calculators.add(CardView(title: endoCard.title, url: endoCard.url,icon: 'assets/img/thyroid.png',),);

      }
    }else if(widget.type=="oncology"){
      Oncology model=Oncology();
      List<GuidelineCard> cards=model.map[widget.subType]!;

      for(GuidelineCard card in cards){
        calculators.add(CardView(title: card.title, url: card.url,icon: 'assets/img/oncology.png',),);

      }
    }else if(widget.type=="dermatology"){
      Dermatology model=Dermatology();
      List<GuidelineCard> cards=model.map[widget.subType]!;

      for(GuidelineCard card in cards){
        calculators.add(CardView(title: card.title, url: card.url,icon: 'assets/img/spots.png',),);

      }
    }else if(widget.type=="rheumatology"){
      Rheumatology model=Rheumatology();
      List<GuidelineCard> cards=model.map[widget.subType]!;

      for(GuidelineCard card in cards){
        calculators.add(CardView(title: card.title, url: card.url,icon: 'assets/img/arthritis.png',),);

      }
    }else if(widget.type=="geriatrics"){
      Geriatrics model=Geriatrics();
      List<GuidelineCard> cards=model.map[widget.subType]!;

      for(GuidelineCard card in cards){
        calculators.add(CardView(title: card.title, url: card.url,icon: 'assets/img/geriatrics.png',),);

      }
    }else if(widget.type=="Gastroenterology"){
      Gastroenterology model=Gastroenterology();
      List<GuidelineCard> cards=model.map[widget.subType]!;

      for(GuidelineCard card in cards){
        calculators.add(CardView(title: card.title, url: card.url,icon: 'assets/img/gastroenterology.png',),);

      }
    }else if(widget.type=="Nephrology"){
      Nephrology model=Nephrology();
      List<GuidelineCard> cards=model.map[widget.subType]!;

      for(GuidelineCard card in cards){
        calculators.add(CardView(title: card.title, url: card.url,icon: 'assets/img/kidney.png',),);

      }
    }



  }
}


enum ConfirmAction { Cancel, Accept}
Future<ConfirmAction?> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Sign out'),
        content: const Text(
            'Are you sure you want to sign out?'),
        actions: <Widget>[
          ElevatedButton(

            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          ElevatedButton(
            child: const Text('Accept'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Accept);
            },
          )
        ],
      );
    },
  );
}
