import 'GuidelineCard.dart';

class Hepatology{
  List<GuidelineCard> aasldGuidelines=List.empty(growable: true);
  List<GuidelineCard> easlGuidelines=List.empty(growable: true);
  Map<String,List<GuidelineCard>> hepaMap={};


  Hepatology(){
    getAasldGuidelines();
    getEaslGuidelines();

    hepaMap.putIfAbsent("aasld", () => aasldGuidelines);
    hepaMap.putIfAbsent("easl", () => easlGuidelines);


  }

  getAasldGuidelines(){


    aasldGuidelines.add(GuidelineCard(title: "Hepatic encephalopathy ", url: "https://www.aasld.org/sites/default/files/2022-07/Hepatic%20Encephalopathy%20in%20Chronic%20Liver%20Disease%202014.pdf"));
    aasldGuidelines.add(GuidelineCard(title: "Hematemesis ", url: "https://aasldpubs.onlinelibrary.wiley.com/doi/epdf/10.1002/cld.1015"));
    aasldGuidelines.add(GuidelineCard(title: "Esophageal varices ", url: "https://aasldpubs.onlinelibrary.wiley.com/doi/epdf/10.1002/cld.1108"));
    aasldGuidelines.add(GuidelineCard(title: "Ascites and spontaneous bacterial peritonitis ", url: "https://aasldpubs.onlinelibrary.wiley.com/doi/epdf/10.1002/hep.31884"));
    aasldGuidelines.add(GuidelineCard(title: "Hemochromatosis", url: "https://www.aasld.org/sites/default/files/2022-07/Diagnosis%20and%20Management%20of%20Hemochromatosis%202011.pdf"));
    aasldGuidelines.add(GuidelineCard(title: "Portal hypertension", url: "https://www.aasld.org/sites/default/files/2022-04/TIPS%20Update%20Nov%202009.pdf"));
    aasldGuidelines.add(GuidelineCard(title: "HCV infection", url: "https://www.aasld.org/sites/default/files/2022-07/PracticeGuidelines-HCV-November2018.pdf"));
    aasldGuidelines.add(GuidelineCard(title: "Liver transplantation in pediatric", url: "https://www.aasld.org/sites/default/files/2022-07/Evaluation%20of%20the%20Pediatric%20Patient%20for%20Liver%20Transplantation.pdf"));
    aasldGuidelines.add(GuidelineCard(title: "Hepatocellular carcinoma", url: "https://www.aasld.org/sites/default/files/2022-06/Finn_et_al-2018-HepatologyTherapies%20for%20Advanced%20HCC%20bookmarked.pdf"));
    aasldGuidelines.add(GuidelineCard(title: "Hepatocellular carcinoma", url: "https://www.aasld.org/sites/default/files/2022-06/Finn_et_al-2018-HepatologyTherapies%20for%20Advanced%20HCC%20bookmarked.pdf"));
  }

getEaslGuidelines(){

  easlGuidelines.add(GuidelineCard(title: "Ascites, spontaneous peritonitis and hepatorenal syndrome", url: "https://www.journal-of-hepatology.eu/action/showPdf?pii=S0168-8278%2810%2900478-2"));
  easlGuidelines.add(GuidelineCard(title: "Decompensated cirrhosis", url: "https://easl.eu/wp-content/uploads/2018/10/decompensated-cirrhosis-English-report.pdf"));
  easlGuidelines.add(GuidelineCard(title: "Hepatic encephalopathy", url: "https://www.journal-of-hepatology.eu/action/showPdf?pii=S0168-8278%2822%2900346-4"));
  easlGuidelines.add(GuidelineCard(title: "Hepatorenal cirrhosis ", url: "https://easl.eu/wp-content/uploads/2018/10/Hepatorenal-Cirrhosis-English-report.pdf"));
  easlGuidelines.add(GuidelineCard(title: "Management of Primary Biliary Cholangitis", url: "http://www.journal-of-hepatology.eu/article/S0168-8278(17)30186-1/pdf"));
  easlGuidelines.add(GuidelineCard(title: "Sclerosing cholangitis", url: "https://www.journal-of-hepatology.eu/action/showPdf?pii=S0168-8278%2822%2900326-9"));
  easlGuidelines.add(GuidelineCard(title: "Haemochromatosis", url: "https://www.journal-of-hepatology.eu/action/showPdf?pii=S0168-8278%2822%2900211-2"));




}
}