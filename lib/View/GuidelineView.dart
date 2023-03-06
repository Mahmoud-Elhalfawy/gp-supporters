import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GuidelineView extends StatefulWidget {
  const GuidelineView({Key? key}) : super(key: key);
  static String id="guideline";
  @override
  State<GuidelineView> createState() => _GuidelineViewState();
}

class _GuidelineViewState extends State<GuidelineView> {

  bool cardiology=false;
  bool aha=false;
  bool hepa1=false;
  bool hepa2=false;



  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(

        leading: Icon(Icons.menu, color: Colors.transparent,),
        title: Text('Guidelines', style: TextStyle(color: Colors.blue.shade900),textAlign: TextAlign.left,),
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
                        child: Image.asset('assets/img/guideline2.png', fit: BoxFit.contain,)),
                    Expanded(
                      flex: 7,
                      child: Container(
                        margin: EdgeInsets.only(top:16,left: 20, right: 20,bottom: 20),

                        decoration: const BoxDecoration(
                          color: Colors.white,

                          // border: Border.all(color:Colors.black, width: 2),
                          // borderRadius: BorderRadius.all(Radius.circular(8)),


                        ),

                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      child:   Text("1. Cardiology ",
                                        style: TextStyle(
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://www.escardio.org/Guidelines/Clinical-Practice-Guidelines'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  InkWell(child: Icon(cardiology?Icons.arrow_drop_up:Icons.arrow_drop_down, color: Colors.blue.shade900, size: 50,),
                                  onTap: (){
                                    setState(() {
                                      cardiology=!cardiology;
                                    });
                                  },
                                  )
                                ],
                              ),
                              cardiology?Column(

                                crossAxisAlignment: CrossAxisAlignment.stretch,

                                children: [



                                  SizedBox(height: 25,),


                                  GestureDetector(
                                      child:  Text(" - cancer treatments and cardiovascular toxicity  ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://scholar.google.com/scholar_url?url=https://academic.oup.com/eurheartj/article-pdf/37/36/2768/23748938/ehw211.pdf&hl=ar&sa=T&oi=ucasa&ct=ufr&ei=t-RJY_f5I9qTy9YPuZmDwAY&scisig=AAGBfm0bQPzu-XbCKjM3WBiGFLBTWg7bSA'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),



                                  GestureDetector(
                                      child:  Text(" - ventricular arrhythmias and the prevention of sudden cardiac death",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://academic.oup.com/eurheartj/article-pdf/36/41/2793/23487107/ehv316.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),



                                  GestureDetector(
                                      child:  Text(" - non-cardiac surgery: cardiovascular assessment and management",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('http://eurheartj.oxfordjournals.org/content/35/35/2383.full-text.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),



                                  GestureDetector(
                                      child:  Text(" - diagnosis and treatment of pulmonary hypertension",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://scholar.google.com/scholar_url?url=https://academic.oup.com/eurheartj/article-pdf/37/1/67/23492708/ehv317.pdf&hl=ar&sa=T&oi=ucasa&ct=ufr&ei=neZJY_D8CKLGsQKo-JaYCQ&scisig=AAGBfm2jQS74p_BZd1piO-4cyE1vslJIcA'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),



                                  GestureDetector(
                                      child:  Text(" - cardiovascular disease prevention in clinical practice ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://academic.oup.com/eurheartj/article-pdf/37/29/2315/23748850/ehw106.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),



                                  GestureDetector(
                                      child:  Text(" - valvular heart disease",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://academic.oup.com/eurheartj/article-pdf/38/36/2739/24596044/ehx391.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),



                                  GestureDetector(
                                      child:  Text(" - sports cardiology and exercise in patients with cardiovascular disease",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://academic.oup.com/eurheartj/article-pdf/42/1/17/41216544/ehaa605.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),



                                  GestureDetector(
                                      child:  Text(" - diagnosis and treatment of acute and chronic heart failure",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://academic.oup.com/eurheartj/article-pdf/37/27/2129/23748755/ehw128.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),



                                  GestureDetector(
                                      child:  Text(" - management of adult congenital heart disease",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://academic.oup.com/eurheartj/article-pdf/42/6/563/41216858/ehaa554.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),



                                  GestureDetector(
                                      child:  Text(" - diagnosis and management of atrial fibrillation",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://academic.oup.com/eurheartj/article-pdf/42/5/373/40364977/ehaa612.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),



                                  GestureDetector(
                                      child:  Text(" - management of acute coronary syndromes in patients presenting without persistent ST-segment elevation ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://academic.oup.com/eurheartj/article-pdf/42/14/1289/41217030/ehaa575.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),


                                  GestureDetector(
                                      child:  Text(" - the management of patients with supraventricular tachycardia",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://academic.oup.com/eurheartj/article-pdf/41/5/655/33115827/ehz467.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),

                                  GestureDetector(
                                      child:  Text(" - diabetes, pre-diabetes, and cardiovascular diseases",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://academic.oup.com/eurheartj/article-pdf/41/2/255/33115788/ehz486.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),

                                  GestureDetector(
                                      child:  Text(" - Corrected calcium for serum albumin conc.  ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://globalrph.com/medcalcs/corrected-calcium-calculator-correction-for-serum-albumin-conc/'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),

                                  GestureDetector(
                                      child:  Text(" - Diagnosis -and-management-of-chronic-heart-failure ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://globalrph.com/medcalcs/diagnosis-and-management-of-chronic-heart-failure-in-the-adult/'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),

                                  GestureDetector(
                                      child:  Text(" - Digoxin dosing calculators ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://globalrph.com/medcalcs/digoxin-dosing-calc/'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),

                                  GestureDetector(
                                      child:  Text(" - Digoxin steady state adjust  ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://globalrph.com/medcalcs/digoxin-steady-state-adjust/'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),

                                  GestureDetector(
                                      child:  Text(" - estimate-24-hour-urine-protein-from-protein ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://globalrph.com/medcalcs/estimate-24-hour-urine-protein-from-protein-to-scr-ratio-gender-specific/'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  SizedBox(height: 25,),

                                  GestureDetector(
                                      child:  Text(" - Estimation of body fat ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://globalrph.com/medcalcs/estimation-of-total-body-fat/'),mode: LaunchMode.externalApplication);
                                      }
                                  ),



                                ],
                              ):Container(),

                              const SizedBox(height: 25,),

                              const Divider(
                                color: Colors.black,
                                thickness: 3,
                                height: 5,
                              ),

                              const SizedBox(height: 25,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      child:   Text("2. AHA Guidelines ",
                                        style: TextStyle(
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://professional.heart.org/en/guidelines-and-statements'),mode: LaunchMode.externalApplication);
                                      }
                                  ),
                                  InkWell(child: Icon(aha?Icons.arrow_drop_up:Icons.arrow_drop_down, color: Colors.blue.shade900, size: 50,),
                                    onTap: (){
                                      setState(() {
                                        aha=!aha;
                                      });
                                    },
                                  )
                                ],
                              ),

                                  //--------------- 2- AHA ----------------------------

                              aha?Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,

                                children: [



                                  const SizedBox(height: 25,),


                                  GestureDetector(
                                      child:  Text(" - Management of Heart Failure 1 ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000001063'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),
                                  GestureDetector(
                                      child:  Text(" - Management of Heart Failure 2 ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://hfsa.org/sites/default/files/2022-04/ACC-AHA-HFSA-JCF-HFGuidelines-Top10.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),
                                  GestureDetector(
                                      child:  Text(" - Blood pressure and the new hypertension guidelines ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://www.aafp.org/content/dam/brand/aafp/pubs/afp/issues/2018/0315/p413.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),
                                  GestureDetector(
                                      child:  Text(" - on the Primary Prevention of Cardiovascular Disease ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000000678'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),
                                  GestureDetector(
                                      child:  Text(" - Infective Endocarditis in Adults Antimicrobial Therapy ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000000296'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),
                                  GestureDetector(
                                      child:  Text(" - the Evaluation and Diagnosis of Chest Pain ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000001029'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),
                                  GestureDetector(
                                      child:  Text(" - Coronary Artery Revascularization ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000001038'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),
                                  GestureDetector(
                                      child:  Text(" - Cardiogenic Shock ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://www.ahajournals.org/doi/reader/10.1161/JAHA.119.011991'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),
                                  GestureDetector(
                                      child:  Text(" - Perioperative Cardiovascular Evaluation and Management of Patients Undergoing Noncardiac Surgery ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://www.ahajournals.org/doi/pdf/10.1161/CIR.0000000000000106'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),
                                  GestureDetector(
                                      child:  Text(" - Cardiac Amyloidosis",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000000792'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),




                                ],
                              ):Container(),


                              const SizedBox(height: 25,),
                                  const Divider(
                                    color: Colors.black,
                                    thickness: 3,
                                    height: 5,
                                  ),

                                  const SizedBox(height: 25,),



                                  //--------------- Hepatology - AASLD Guidelines ----------------------------



                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                          child:   Text("3. Hepatology - AASLD Guidelines ",
                                            style: TextStyle(
                                                color: Colors.blue.shade900,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                decoration: TextDecoration.underline
                                            ),
                                          ),
                                          onTap: () {
                                            launchUrl(Uri.parse('https://www.aasld.org/practice-guidelines'),mode: LaunchMode.externalApplication);
                                          }
                                      ),

                                      InkWell(child: Icon(hepa1?Icons.arrow_drop_up:Icons.arrow_drop_down, color: Colors.blue.shade900, size: 50,),
                                        onTap: (){
                                          setState(() {
                                            hepa1=!hepa1;
                                          });
                                        },
                                      )
                                    ],
                                  ),

                                  const SizedBox(height: 25,),


                                  hepa1?Column(
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                  GestureDetector(
                                      child:  Text(" - Hepatic encephalopathy  ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://www.aasld.org/sites/default/files/2022-07/Hepatic%20Encephalopathy%20in%20Chronic%20Liver%20Disease%202014.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),

                                  GestureDetector(
                                      child:  Text(" - Hematemesis  ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://aasldpubs.onlinelibrary.wiley.com/doi/epdf/10.1002/cld.1015'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),

                                  GestureDetector(
                                      child:  Text(" - Esophageal varices  ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://aasldpubs.onlinelibrary.wiley.com/doi/epdf/10.1002/cld.1108'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),

                                  GestureDetector(
                                      child:  Text(" - Ascites and spontaneous bacterial peritonitis  ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://aasldpubs.onlinelibrary.wiley.com/doi/epdf/10.1002/hep.31884'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),

                                  GestureDetector(
                                      child:  Text(" - Hemochromatosis ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://www.aasld.org/sites/default/files/2022-07/Diagnosis%20and%20Management%20of%20Hemochromatosis%202011.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),

                                  GestureDetector(
                                      child:  Text(" - Portal hypertension ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://www.aasld.org/sites/default/files/2022-04/TIPS%20Update%20Nov%202009.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),

                                  GestureDetector(
                                      child:  Text(" - HCV infection ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://www.aasld.org/sites/default/files/2022-07/PracticeGuidelines-HCV-November2018.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),

                                  GestureDetector(
                                      child:  Text(" - Liver transplantation in pediatric ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://www.aasld.org/sites/default/files/2022-07/Evaluation%20of%20the%20Pediatric%20Patient%20for%20Liver%20Transplantation.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  const SizedBox(height: 25,),

                                  GestureDetector(
                                      child:  Text(" - Hepatocellular carcinoma ",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://www.aasld.org/sites/default/files/2022-06/Finn_et_al-2018-HepatologyTherapies%20for%20Advanced%20HCC%20bookmarked.pdf'),mode: LaunchMode.externalApplication);
                                      }
                                  ),
                                      const SizedBox(height: 25,),

                                    ],
                                  ):Container(),

                                  const Divider(
                                    color: Colors.black,
                                    thickness: 3,
                                    height: 5,
                                  ),

                                  const SizedBox(height: 25,),



                                  //--------------- Hepatology - EASL Guidelines ----------------------------

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      child:   Text("4. Hepatology - EASL Guidelines ",
                                        style: TextStyle(
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            decoration: TextDecoration.underline
                                        ),
                                      ),
                                      onTap: () {
                                        launchUrl(Uri.parse('https://easl.eu/publication-category/clinical-practice-guidelines/'),mode: LaunchMode.externalApplication);
                                      }
                                  ),

                                  InkWell(child: Icon(hepa2?Icons.arrow_drop_up:Icons.arrow_drop_down, color: Colors.blue.shade900, size: 50,),
                                    onTap: (){
                                      setState(() {
                                        hepa2=!hepa2;
                                      });
                                    },
                                  )
                                ],
                              ),




                                  const SizedBox(height: 25,),


                                  hepa2?Column(
                                    children: [

                                      GestureDetector(
                                          child:  Text(" - Ascites, spontaneous peritonitis and hepatorenal syndrome ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                decoration: TextDecoration.underline
                                            ),
                                          ),
                                          onTap: () {
                                            launchUrl(Uri.parse('https://www.journal-of-hepatology.eu/action/showPdf?pii=S0168-8278%2810%2900478-2'),mode: LaunchMode.externalApplication);
                                          }
                                      ),

                                      const SizedBox(height: 25,),

                                      GestureDetector(
                                          child:  Text(" - Decompensated cirrhosis ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                decoration: TextDecoration.underline
                                            ),
                                          ),
                                          onTap: () {
                                            launchUrl(Uri.parse('https://easl.eu/wp-content/uploads/2018/10/decompensated-cirrhosis-English-report.pdf'),mode: LaunchMode.externalApplication);
                                          }
                                      ),

                                      const SizedBox(height: 25,),

                                      GestureDetector(
                                          child:  Text(" - Hepatic encephalopathy ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                decoration: TextDecoration.underline
                                            ),
                                          ),
                                          onTap: () {
                                            launchUrl(Uri.parse('https://www.journal-of-hepatology.eu/action/showPdf?pii=S0168-8278%2822%2900346-4'),mode: LaunchMode.externalApplication);
                                          }
                                      ),

                                      const SizedBox(height: 25,),

                                      GestureDetector(
                                          child:  Text(" - Hepatorenal cirrhosis  ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                decoration: TextDecoration.underline
                                            ),
                                          ),
                                          onTap: () {
                                            launchUrl(Uri.parse('https://easl.eu/wp-content/uploads/2018/10/Hepatorenal-Cirrhosis-English-report.pdf'),mode: LaunchMode.externalApplication);
                                          }
                                      ),

                                      const SizedBox(height: 25,),

                                      GestureDetector(
                                          child:  Text(" - Management of Primary Biliary Cholangitis ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                decoration: TextDecoration.underline
                                            ),
                                          ),
                                          onTap: () {
                                            launchUrl(Uri.parse('http://www.journal-of-hepatology.eu/article/S0168-8278(17)30186-1/pdf'),mode: LaunchMode.externalApplication);
                                          }
                                      ),

                                      const SizedBox(height: 25,),

                                      GestureDetector(
                                          child:  Text(" - Sclerosing cholangitis ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                decoration: TextDecoration.underline
                                            ),
                                          ),
                                          onTap: () {
                                            launchUrl(Uri.parse('https://www.journal-of-hepatology.eu/action/showPdf?pii=S0168-8278%2822%2900326-9'),mode: LaunchMode.externalApplication);
                                          }
                                      ),

                                      const SizedBox(height: 25,),

                                      GestureDetector(
                                          child:  Text(" - Haemochromatosis ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                decoration: TextDecoration.underline
                                            ),
                                          ),
                                          onTap: () {
                                            launchUrl(Uri.parse('https://www.journal-of-hepatology.eu/action/showPdf?pii=S0168-8278%2822%2900211-2'),mode: LaunchMode.externalApplication);
                                          }
                                      ),

                                      const SizedBox(height: 25,),

                                    ],
                                  ):Container(),


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
