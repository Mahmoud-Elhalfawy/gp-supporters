import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/View/GuidelinesScreens/CNSScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/CardiologyScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/DermatologyScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/GuidelineOptionCard.dart';
import 'package:gppsupporters/View/GuidelinesScreens/HepatologyScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/ImmunologyScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/NerphologyScreen.dart';
import 'package:gppsupporters/View/GuidelinesScreens/OncologyScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Model/Geriatrics.dart';
import 'EndocrinologyScreen.dart';
import 'GastroenologyScreen.dart';
import 'GeriatricsScreen.dart';
import '../LoginScreen.dart';
import 'RheumatologyScreen.dart';

class GuidelinesOptionsScreen extends StatefulWidget {
  static String id = "guidelines options";

  const GuidelinesOptionsScreen({Key? key}) : super(key: key);

  @override
  State<GuidelinesOptionsScreen> createState() =>
      _GuidelinesOptionsScreenState();
}

class _GuidelinesOptionsScreenState extends State<GuidelinesOptionsScreen> {
  bool search = false;
  bool searchCriteria = true;
  String query = "";
  List<GuidelineOptionCard> calculators = List.empty(growable: true);
  List<GuidelineOptionCard> calculatorsFiltered = List.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buildCards();
  }

  @override
  Widget build(BuildContext context) {
    if (!search) {
      calculatorsFiltered = calculators;
    }
    return Scaffold(
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
                              this.query = query;
                              if (query.isEmpty) {
                                calculatorsFiltered = calculators;
                              } else {
                                calculatorsFiltered = calculators
                                    .where((element) => element.title
                                        .toLowerCase()
                                        .contains(query.toLowerCase()))
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
                  'Guidelines',
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
                  search ? Icons.search_off : Icons.search,
                  color: Colors.blue.shade900,
                )),
            onTap: () {
              setState(() {
                search = !search;
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
            onTap: () async {
              final auth = FirebaseAuth.instance;

              final ConfirmAction action =
                  (await _asyncConfirmDialog(context))!;

              if (action == ConfirmAction.Accept) {
                auth.signOut();
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();
                await preferences.clear();
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.id, (route) => false);
              }
            },
          ),
        ],
        backgroundColor: Colors.white,
        toolbarHeight: 90,
        elevation: 7,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(8),
                color: Colors.grey.shade200,
                // padding: EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height * 0.9,

                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.only(top: 16),
                        margin: EdgeInsets.only(top: 16, bottom: 50),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,

                          // border: Border.all(color:Colors.black, width: 2),
                          // borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
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

  buildCards() {
    calculators.add(
      GuidelineOptionCard(
        title: "Cardiology",
        url: CardiologyScreen.id,
        img: 'assets/img/cardiology.png',
      ),
    );

    calculators.add(
      GuidelineOptionCard(
        title: "Hepatology",
        url: HepatologyScreen.id,
        img: 'assets/img/hepatology.png',
      ),
    );

    calculators.add(
      GuidelineOptionCard(
        title: "Oncology & Hematology",
        url: OncologyScreen.id,
        img: 'assets/img/oncology.png',
      ),
    );

    calculators.add(
      GuidelineOptionCard(
        title: "Immunology",
        url: ImmunologyScreen.id,
        img: 'assets/img/antibodies.png',
      ),
    );

    calculators.add(
      GuidelineOptionCard(
        title: "CNS",
        url: CNSScreen.id,
        img: 'assets/img/brain.png',
      ),
    );

    calculators.add(
      GuidelineOptionCard(
        title: "Endocrinology",
        url: EndocrinologyScreen.id,
        img: 'assets/img/thyroid.png',
      ),
    );

    calculators.add(
      GuidelineOptionCard(
        title: "Dermatology ",
        url: DermatologyScreen.id,
        img: 'assets/img/spots.png',
      ),
    );
    calculators.add(
      GuidelineOptionCard(
        title: "Rheumatology",
        url: RheumatologyScreen.id,
        img: 'assets/img/arthritis.png',
      ),
    );
    calculators.add(
      GuidelineOptionCard(
        title: "Geriatrics",
        url: GeriatricsScreen.id,
        img: 'assets/img/geriatrics.png',
      ),
    );
    calculators.add(
      GuidelineOptionCard(
        title: "Gastroenterology",
        url: GastroenterologyScreen.id,
        img: 'assets/img/gastroenterology.png',
      ),
    );
    calculators.add(
      GuidelineOptionCard(
        title: "Nephrology",
        url: NephrologyScreen.id,
        img: 'assets/img/kidney.png',
      ),
    );
  }
}

enum ConfirmAction { Cancel, Accept }

Future<ConfirmAction?> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Sign out'),
        content: const Text('Are you sure you want to sign out?'),
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
