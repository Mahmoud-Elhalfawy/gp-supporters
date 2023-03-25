import 'GuidelineCard.dart';

class Nephrology{
  static String option1="KDIGO";
  static String option2="KDOQI";
  static String option3="ERBP";
  static String option4="Guideline central Nephrology";

  List<GuidelineCard> kdigoGuidelines=List.empty(growable: true);
  List<GuidelineCard> kdoqiGuidelines=List.empty(growable: true);
  List<GuidelineCard> erbpGuidelines=List.empty(growable: true);
  List<GuidelineCard> centralGuidelines=List.empty(growable: true);

  Map<String,List<GuidelineCard>> map={};

  Nephrology(){
    getKdigoGuidelines();
    getKdoqiGuidelines();
    getErbpGuidelines();
    getCentralGuidelines();
    map.putIfAbsent(option1, () => kdigoGuidelines);
    map.putIfAbsent(option2, () => kdoqiGuidelines);
    map.putIfAbsent(option3, () => erbpGuidelines);
    map.putIfAbsent(option4, () => centralGuidelines);

  }


  getKdigoGuidelines(){

    kdigoGuidelines.add(GuidelineCard(title: "CKD evaluation and management ", url: "https://kdigo.org/guidelines/ckd-evaluation-and-management/"));
    kdigoGuidelines.add(GuidelineCard(title: "Glomerular disease", url: "https://kdigo.org/guidelines/gd/"));
    kdigoGuidelines.add(GuidelineCard(title: "AKI management ", url: "https://kdigo.org/guidelines/acute-kidney-injury/"));


  }
  getKdoqiGuidelines(){

    kdoqiGuidelines.add(GuidelineCard(title: "Acute renal failure", url: "https://www.kidney.org/sites/default/files/PIIS027263861300471X.pdf"));
    kdoqiGuidelines.add(GuidelineCard(title: "Chronic kidney disease", url: "http://www.ajkd.org/article/S0272-6386(14)00491-0/pdf"));
    kdoqiGuidelines.add(GuidelineCard(title: "Glomerulonephritis", url: "http://www.ajkd.org/article/S0272-6386(13)00903-7/pdf"));

  }
  getErbpGuidelines(){
    
    
    erbpGuidelines.add(GuidelineCard(title: "ERBP guidelines ", url: "https://www.era-online.org/en/erbp/"));
  }
  getCentralGuidelines(){


    centralGuidelines.add(GuidelineCard(title: "Central Nephrology guideline ", url: "https://www.guidelinecentral.com/guidelines/specialty/nephrology/"));

  }

}