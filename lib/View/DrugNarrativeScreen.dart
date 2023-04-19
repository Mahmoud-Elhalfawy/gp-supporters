import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/View/CardView.dart';
import 'package:link_text/link_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'LoginScreen.dart';

class DrugNarrativeScreen extends StatefulWidget {
  const DrugNarrativeScreen({Key? key}) : super(key: key);
  static String id="DrugNarrativeScreen";

  @override
  State<DrugNarrativeScreen> createState() => _DrugNarrativeScreenState();
}

class _DrugNarrativeScreenState extends State<DrugNarrativeScreen> {

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
    return  Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: search
            ? Container(
          width: 900,
          color: Colors.white,
          margin: EdgeInsets.all(5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Flexible(
                  child: TextField(

                    onChanged: (query) {
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
                          color: Colors.blue.shade900,
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
            : Center(
          child: Text(
            'Drug Narrative',
            style: TextStyle(color: Colors.blue.shade900),
            textAlign: TextAlign.left,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        actions: [
          InkWell(
            child: Container(
                margin: EdgeInsets.only(right: 16),
                child: Icon(
                  search?Icons.search_off:Icons.search,
                  color: Colors.blue.shade900,
                )),
            onTap: () {
              setState(() {
                search=!search;
              });
            },
          ),

          InkWell(
            child: Container(
                margin: EdgeInsets.only(right: 16),
                child: Icon(
                  Icons.output_sharp,
                  color: Colors.blue.shade900,
                )),
            onTap: () async{
              final auth = FirebaseAuth.instance;

              final ConfirmAction action = (await _asyncConfirmDialog(context))!;

              if(action==ConfirmAction.Accept){
                auth.signOut();
                SharedPreferences preferences = await SharedPreferences.getInstance();
                await preferences.clear();
                Navigator.pushNamedAndRemoveUntil(context, LoginScreen.id, (route) => false);}

            },
          ),
        ],
        backgroundColor: Colors.white,
        toolbarHeight: 90,
        elevation: 7,
      ),
      body:  SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(8),
                color: Colors.grey.shade200,
                // padding: EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height*0.9,

                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: Image.asset('assets/img/pharmacy.png', fit: BoxFit.contain,)),
                    Expanded(
                      flex: 5,
                      child: Container(

                        margin: EdgeInsets.only(top:16,bottom: 50),

                        decoration:  BoxDecoration(
                          color: Colors.grey.shade200,

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



              ),
            ),
          ],
        ),
      ),
    );
  }

  buildCards(){



    calculators.add(CardView(title: "PDR", url: 'https://pdr.net/',icon: "assets/img/pharmacy.png",),);
    calculators.add(CardView(title: "Drugs.com ", url: 'https://www.drugs.com/',icon: "assets/img/pharmacy.png",),);
    calculators.add(CardView(title: "Rxlist ", url: 'https://www.rxlist.com/',icon: "assets/img/pharmacy.png",),);
    calculators.add(CardView(title: "Drug bank ", url: 'https://go.drugbank.com/',icon: "assets/img/pharmacy.png",),);
    calculators.add(CardView(title: "FDA drug monograph ", url: 'https://www.fda.gov/drugs/development-approval-process-drugs/drug-approvals-and-databases',icon: "assets/img/pharmacy.png",),);
    calculators.add(CardView(title: "FDA ", url: 'https://www.fda.gov/',icon: "assets/img/pharmacy.png",),);
    calculators.add(CardView(title: "Medline plus ", url: 'https://medlineplus.gov/druginformation.html',icon: "assets/img/pharmacy.png",),);
    calculators.add(CardView(title: "Drug monographs ", url: 'https://handbook.bcehs.ca/drug-monographs/',icon: "assets/img/pharmacy.png",),);
    calculators.add(CardView(title: "emc ", url: 'https://www.medicines.org.uk/emc',icon: "assets/img/pharmacy.png",),);
    calculators.add(CardView(title: "DailyMed ", url: 'https://dailymed.nlm.nih.gov/dailymed/',icon: "assets/img/pharmacy.png",),);



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

