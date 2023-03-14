import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'CardView.dart';
import 'LoginScreen.dart';

class DDIScreen extends StatefulWidget {

  static String id="DDI screen";
  const DDIScreen({Key? key}) : super(key: key);

  @override
  State<DDIScreen> createState() => _DDIScreenState();
}

class _DDIScreenState extends State<DDIScreen> {
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
            'DDI',
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
            onTap: () {
              final auth = FirebaseAuth.instance;

              auth.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, LoginScreen.id, (route) => false);
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
                margin: const EdgeInsets.only(top: 8),
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
                        child: Image.asset('assets/img/drug.png', fit: BoxFit.contain,)),
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



    calculators.add(CardView(title: "UpToDate", url: 'https://doctorabad.com/UpToDate/d/di.htm'),);



    calculators.add(CardView(title: "Medscape", url: 'https://reference.medscape.com/drug-interactionchecker'),
    );


    calculators.add(CardView(title: "Drugs.com ", url: 'https://www.drugs.com/drug_interactions.html'),
    );



    calculators.add(CardView(title: "WebMD", url: 'https://www.webmd.com/interaction-checker/default.htm'),
    );



    calculators.add(CardView(title: "Lexicomp", url: 'https://www.wolterskluwer.com/en/solutions/lexicomp/resources/lexicomp-user-academy/drug-interactions-analysis'),
    );


  }
}
