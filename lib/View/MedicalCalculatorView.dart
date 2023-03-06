import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:link_text/link_text.dart';
import 'package:url_launcher/url_launcher.dart';

class MedicalCalculatorView extends StatefulWidget {
  const MedicalCalculatorView({Key? key}) : super(key: key);
  static String id="medicalCalc";

  @override
  State<MedicalCalculatorView> createState() => _MedicalCalculatorViewState();
}

class _MedicalCalculatorViewState extends State<MedicalCalculatorView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

    appBar: AppBar(

      leading: Icon(Icons.menu, color: Colors.transparent,),
      title: Text('Medical Calculators', style: TextStyle(color: Colors.blue.shade900),textAlign: TextAlign.left,),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),

      actions:  [

        // Container(
        //     margin: EdgeInsets.only(right: 16),
        //     child: Icon(Icons.account_circle_rounded, color: Colors.black,)),
      ],
      backgroundColor: Colors.white,
      toolbarHeight: 70,
      elevation: 0,
    ),
      body:  SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                // padding: EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height*0.9,

                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        flex: 2,
                        child: Image.asset('assets/img/guideline.png', fit: BoxFit.contain,)),
                    Expanded(
                      flex: 6,
                      child: Container(
                        margin: EdgeInsets.only(top:16,left: 20, right: 20,bottom: 20),

                        decoration: const BoxDecoration(
                          color: Colors.white,

                          // border: Border.all(color:Colors.black, width: 2),
                          // borderRadius: BorderRadius.all(Radius.circular(8)),


                        ),

                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              GestureDetector(
                                  child:  Text(" - Global Rph ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/'),mode: LaunchMode.externalApplication);
                                                                 }
                              ),

                              SizedBox(height: 15,),


                              GestureDetector(
                                  child:  Text(" - ASCVD risk score calculator ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/atp-iv-estimate-10y-and-lifetime-ascvd-risk-pooled-cohort-equations/'), mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),



                              GestureDetector(
                                  child:  Text(" - Body fluid volumes  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/body-fluid-volumes/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),



                              GestureDetector(
                                  child:  Text(" - Body surface area  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/body-surface-area-multi-calc-multiple-analysis/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),



                              GestureDetector(
                                  child:  Text(" - Body mass index  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/body-mass-index-bmi/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),



                              GestureDetector(
                                  child:  Text(" - HAS-BLED score ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/bleeding-risk-has-bled-bleeding-risk-score/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),



                              GestureDetector(
                                  child:  Text(" - Calcium /hypocalcemia treatment calculators ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/calcium-hypocalcemia-treatment-calculatorbeta/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),



                              GestureDetector(
                                  child:  Text(" - Total iron deficit  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/calculation-of-the-total-iron-deficit-equation-appears-in-cosmofer-pi/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),



                              GestureDetector(
                                  child:  Text(" - Child -Pugh score  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/child-turcotte-pugh-score-prognosis-of-chronic-liver-disease/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),



                              GestureDetector(
                                  child:  Text(" - Calcium and vitamin D requirements  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/calcium-and-vitamin-d-requirements/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),



                              GestureDetector(
                                  child:  Text(" - CHAD-VASC score  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/chads2-vasc-score-stroke-risk-assessment-in-a-fib/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),



                              GestureDetector(
                                  child:  Text(" - CKD-EPI ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/chronic-kidney-disease-epidemiology-collaboration-ckd-epi-calculator/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),


                              GestureDetector(
                                  child:  Text(" - Colistin dosing calculator ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/colistin-dosing-calculator-beta/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),

                              GestureDetector(
                                  child:  Text(" - Creatinine clearance  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/creatinine-clearance-multi-calc-2012-edition/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),

                              GestureDetector(
                                  child:  Text(" - Corrected calcium for serum albumin conc.  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/corrected-calcium-calculator-correction-for-serum-albumin-conc/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),

                              GestureDetector(
                                  child:  Text(" - Diagnosis -and-management-of-chronic-heart-failure ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/diagnosis-and-management-of-chronic-heart-failure-in-the-adult/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),

                              GestureDetector(
                                  child:  Text(" - Digoxin dosing calculators ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/digoxin-dosing-calc/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),

                              GestureDetector(
                                  child:  Text(" - Digoxin steady state adjust  ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/digoxin-steady-state-adjust/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),

                              GestureDetector(
                                  child:  Text(" - estimate-24-hour-urine-protein-from-protein ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/estimate-24-hour-urine-protein-from-protein-to-scr-ratio-gender-specific/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),

                              GestureDetector(
                                  child:  Text(" - Estimation of body fat ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse('https://globalrph.com/medcalcs/estimation-of-total-body-fat/'),mode: LaunchMode.externalApplication);
                                  }
                              ),

                              SizedBox(height: 15,),




                            ],
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
}
