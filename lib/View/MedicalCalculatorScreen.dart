import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gppsupporters/View/CardView.dart';
import 'package:link_text/link_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'LoginScreen.dart';

class MedicalCalculatorScreen extends StatefulWidget {
  const MedicalCalculatorScreen({Key? key}) : super(key: key);
  static String id="medicalCalc";

  @override
  State<MedicalCalculatorScreen> createState() => _MedicalCalculatorScreenState();
}

class _MedicalCalculatorScreenState extends State<MedicalCalculatorScreen> {

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
            : Center(
          child: Text(
            'Medical Calculators',
            style: TextStyle(color: Colors.indigo.shade900),
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
                  color: Colors.indigo.shade900,
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
                  color: Colors.indigo.shade900,
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
                        child: Image.asset('assets/img/guideline.png', fit: BoxFit.contain,)),
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



      calculators.add(CardView(title: "Global Rph ", url: 'https://globalrph.com/medcalcs/'),);



      calculators.add(CardView(title: "ASCVD risk score calculator", url: 'https://globalrph.com/medcalcs/atp-iv-estimate-10y-and-lifetime-ascvd-risk-pooled-cohort-equations/'),
      );


      calculators.add(CardView(title: "Body fluid volumes", url: 'https://globalrph.com/medcalcs/body-fluid-volumes/'),
      );



      calculators.add(CardView(title: "Body surface area", url: 'https://globalrph.com/medcalcs/body-surface-area-multi-calc-multiple-analysis/'),
      );



      calculators.add(CardView(title: "Body mass index  ", url: 'https://globalrph.com/medcalcs/body-mass-index-bmi/'),
      );



      calculators.add(CardView(title: "HAS-BLED score ", url: 'https://globalrph.com/medcalcs/bleeding-risk-has-bled-bleeding-risk-score/'),
      );



      calculators.add(CardView(title: "Calcium /hypocalcemia treatment calculators ", url: 'https://globalrph.com/medcalcs/calcium-hypocalcemia-treatment-calculatorbeta/'),
      );



      calculators.add(CardView(title: "Total iron deficit  ", url: 'https://globalrph.com/medcalcs/calculation-of-the-total-iron-deficit-equation-appears-in-cosmofer-pi/'),
      );


      calculators.add(CardView(title: "Child -Pugh score  ", url: 'https://globalrph.com/medcalcs/child-turcotte-pugh-score-prognosis-of-chronic-liver-disease/'),
      );


      calculators.add(CardView(title: "Calcium and vitamin D requirements  ", url: 'https://globalrph.com/medcalcs/calcium-and-vitamin-d-requirements/'),
      );


      calculators.add(CardView(title: "CHAD-VASC score  ", url: 'https://globalrph.com/medcalcs/chads2-vasc-score-stroke-risk-assessment-in-a-fib/'),
      );




      calculators.add(CardView(title: "CKD-EPI ", url: 'https://globalrph.com/medcalcs/chronic-kidney-disease-epidemiology-collaboration-ckd-epi-calculator/'),
      );


      calculators.add(CardView(title: "Colistin dosing calculator ", url: 'https://globalrph.com/medcalcs/colistin-dosing-calculator-beta/'),
      );



      calculators.add(CardView(title: "Creatinine clearance  ", url: 'https://globalrph.com/medcalcs/creatinine-clearance-multi-calc-2012-edition/'),
      );



      calculators.add(CardView(title: "Corrected calcium for serum albumin conc.  ", url: 'https://globalrph.com/medcalcs/corrected-calcium-calculator-correction-for-serum-albumin-conc/'),
      );


      calculators.add(CardView(title: "Diagnosis -and-management-of-chronic-heart-failure ", url: 'https://globalrph.com/medcalcs/diagnosis-and-management-of-chronic-heart-failure-in-the-adult/'),
      );


      calculators.add(CardView(title: "Digoxin dosing calculators ", url: 'https://globalrph.com/medcalcs/digoxin-dosing-calc/'),
      );


      calculators.add(CardView(title: "Digoxin steady state adjust  ", url: 'https://globalrph.com/medcalcs/digoxin-steady-state-adjust/'),
      );




      calculators.add(CardView(title: "estimate-24-hour-urine-protein-from-protein ", url: 'https://globalrph.com/medcalcs/estimate-24-hour-urine-protein-from-protein-to-scr-ratio-gender-specific/'),
      );


      calculators.add(CardView(title: "Estimation of body fat ", url: 'https://globalrph.com/medcalcs/estimation-of-total-body-fat/'),
      );


      calculators.add(CardView(title: "Free water deficit based on sodium level "
          , url: 'https://globalrph.com/medcalcs/free-water-deficit/'),
      );


      calculators.add(CardView(title: "Fractional excretion of potassium"
          , url: 'https://globalrph.com/medcalcs/fractional-excretion-of-potassium/'),
      );


      calculators.add(CardView(title: "Harris-benedict-equation-updated-basal-metabolic-rate"
          , url: 'https://globalrph.com/medcalcs/harris-benedict-equation-updated-basal-metabolic-rate/'),
      );

      calculators.add(CardView(title: "HbA1C to plasma glucose "
          , url: 'https://globalrph.com/medcalcs/hba1c-to-plasma-glucose-eag-estimated-average-glucose/'),
      );

      calculators.add(CardView(title: "Heparin dosing calculator"
          , url: 'https://globalrph.com/medcalcs/heparin-dosing-calculator-detroit-vamc/'),
      );


      calculators.add(CardView(title: "Hypokalemia estimate potassium requirement"
          , url: 'https://globalrph.com/medcalcs/hypokalemia-estimated-potassium-requirements/'),
      );


      calculators.add(CardView(title: "hypertonic-and-normal-saline-calculator"
          , url: 'https://globalrph.com/medcalcs/hypertonic-and-normal-saline-calc-original/'),
      );



      calculators.add(CardView(title: "hypertonic-saline-3% and-normal-saline-infusion-calculator"
          , url: 'https://globalrph.com/medcalcs/hypertonic-saline-3-and-normal-saline-infusion-calculator/'),
      );



      calculators.add(CardView(title: "Hypoklemia potassium dosing calculator"
          , url: 'https://globalrph.com/medcalcs/hypokalemia-potassium-dosing-calculator/'),
      );


      calculators.add(CardView(title: "ICU-drug-calculator-common-therapeutic-agents"
          , url: 'https://globalrph.com/medcalcs/icu-drug-calculator-common-therapeutic-agents/'),
      );


      calculators.add(CardView(title: "iron-deficiency-anemia-calculator"
          , url: 'https://globalrph.com/medcalcs/iron-deficiency-anemia-calculator/'),
      );


      calculators.add(CardView(title: "intravenous-cephalosporins-microbiology-indications-dosing"
          , url: 'https://globalrph.com/medcalcs/intravenous-cephalosporins-microbiology-indications-dosing/'),
      );


      calculators.add(CardView(title: "Iron deficit multi calculator"
          , url: 'https://globalrph.com/medcalcs/iron-deficit-multi-calc/'),
      );


      calculators.add(CardView(title: "JNC 8-guidelines-calculator-too"
          , url: 'https://globalrph.com/medcalcs/jnc-8-guidelines-calculator-tool/'),
      );



      calculators.add(CardView(title: "lean-body-weight-lbw-multi-calculator"
          , url: 'https://globalrph.com/medcalcs/lean-body-weight-lbw-multi-calc/'),
      );



      calculators.add(CardView(title: "Magnesium dosing "
          , url: 'https://globalrph.com/medcalcs/magnesium-dosing/'),
      );

      calculators.add(CardView(title: "NSAID collection tool"
          , url: 'https://globalrph.com/medcalcs/nsaid-selection-tool-nsaid-classification/'),
      );

      calculators.add(CardView(title: "osmolarity-calculator- TPN-removed"
          , url: 'https://globalrph.com/medcalcs/osmolarity-calculator-new-additions-and-tpn-removed/'),
      );

      calculators.add(CardView(title: "osmolality-serum-calculator"
          , url: 'https://globalrph.com/medcalcs/osmolality-serum-calculator/'),
      );


      calculators.add(CardView(title: "phosphate-dosing"
          , url: 'https://globalrph.com/medcalcs/phosphate-dosing/'),
      );


      calculators.add(CardView(title: "parenteral-iron-dosing-multi-calc"
          , url: 'https://globalrph.com/medcalcs/parenteral-iron-dosing-multi-calc/'),
      );


      calculators.add(CardView(title: "potassium-correction"
          , url: 'https://globalrph.com/medcalcs/potassium-correction-based-ph-changes/'),
      );

      calculators.add(CardView(title: "protein-requirements"
          , url: 'https://globalrph.com/medcalcs/protein-requirements-daily/'),
      );

      calculators.add(CardView(title: "pediatric-creatinine-clearance"
          , url: 'https://globalrph.com/medcalcs/pediatric-creatinine-clearance-multiple-equations/'),
      );


      calculators.add(CardView(title: "phenytoin-dosing-calculator"
          , url: 'https://globalrph.com/medcalcs/phenytoin-dosing-calculator-and-analysis/'),
      );


      calculators.add(CardView(title: "potassium-deficit-calculator"
          , url: 'https://globalrph.com/medcalcs/potassium-deficit-calculator/'),
      );

      calculators.add(CardView(title: "Resting metabolic rate "
          , url: 'https://globalrph.com/medcalcs/resting-metabolic-rate-rmr/'),
      );

      calculators.add(CardView(title: "rockall-score-for-evaluation-of-upper-gastrointestinal-bleeding"
          , url: 'https://globalrph.com/medcalcs/rockall-score-for-evaluation-of-upper-gastrointestinal-bleeding/'),
      );

      calculators.add(CardView(title: "Salazar-Corcoran-calculator"
          , url: 'https://globalrph.com/medcalcs/salazar-corcoran-calc/'),
      );

      calculators.add(CardView(title: "sodium-level-correction-for-hyperglycemia"
          , url: 'https://globalrph.com/medcalcs/sodium-level-correction-for-hyperglycemia/'),
      );

      calculators.add(CardView(title: "Serum sodium level prediction"
          , url: 'https://globalrph.com/medcalcs/serum-sodium-level-prediction-based-on-0-9ns-solution-infusion/'),
      );

      calculators.add(CardView(title: "Sodium bicarbonate deficit calculator"
          , url: 'https://globalrph.com/medcalcs/sodium-bicarbonate-deficit-calculator/'),
      );

      calculators.add(CardView(title: "total-parenteral-nutrition-TPN-calculator"
          , url: 'https://globalrph.com/medcalcs/total-parenteral-nutrition-tpn-calculator/'),
      );

      calculators.add(CardView(title: "TIMI risk score for non-STEMI"
          , url: 'https://globalrph.com/medcalcs/timi-risk-score-for-unstable-angina-nstemi/'),
      );

      calculators.add(CardView(title: "vancomycin-advanced-AUC-with-CrCl-option"
          , url: 'https://globalrph.com/medcalcs/vancomycin-advanced-auc-with-crcl-options/'),
      );

      calculators.add(CardView(title: "volume-conversions"
          , url: 'https://globalrph.com/medcalcs/volume-conversions/'),
      );

      calculators.add(CardView(title: "Warfarin dosing"
          , url: 'https://globalrph.com/medcalcs/warfarin-dosing/'),
      );

      calculators.add(CardView(title: "Weight conversions"
          , url: 'https://globalrph.com/medcalcs/weight-conversions/'),
      );

      calculators.add(CardView(title: "Weight loss targeted based on body fat percentage"
          , url: 'https://globalrph.com/medcalcs/weight-loss-target-based-on-body-fat-percentage/'),
      );



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

