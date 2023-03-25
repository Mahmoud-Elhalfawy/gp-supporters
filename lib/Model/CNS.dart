import 'GuidelineCard.dart';

class CNS{

static String option1="EU-EMA";
static String option2="US-AAN";
static String option3="US-IDSA";

List<GuidelineCard> emaGuidelines=List.empty(growable: true);
List<GuidelineCard> aanGuidelines=List.empty(growable: true);
List<GuidelineCard> idsaGuidelines=List.empty(growable: true);

Map<String,List<GuidelineCard>> cnsMap={};

CNS(){
  getEmaGuidelines();
  getAanGuidelines();
  getIdsaGuidelines();

  cnsMap.putIfAbsent(option1, () => emaGuidelines);
  cnsMap.putIfAbsent(option2, () => aanGuidelines);
  cnsMap.putIfAbsent(option3, () => idsaGuidelines);

}

getEmaGuidelines(){
  emaGuidelines.add(GuidelineCard(title: "obsessive compulsive disorder", url: "https://www.ema.europa.eu/documents/scientific-guideline/guideline-clinical-investigation-medicinal-products-treatment-obsessive-compulsive-disorder_en.pdf"));
  emaGuidelines.add(GuidelineCard(title: "epileptic disorder", url: "https://www.ema.europa.eu/en/clinical-investigation-medicinal-products-treatment-epileptic-disorders"));
  emaGuidelines.add(GuidelineCard(title: "multiple sclerosis", url: "https://www.ema.europa.eu/en/clinical-investigation-medicinal-products-treatment-multiple-sclerosis"));
  emaGuidelines.add(GuidelineCard(title: "ADHD", url: "https://www.ema.europa.eu/en/clinical-investigation-medicinal-products-treatment-attention-deficit-hyperactivity-disorder-adhd"));
  emaGuidelines.add(GuidelineCard(title: "Treatment of premenstrual dysphoric disorder", url: "https://www.ema.europa.eu/documents/scientific-guideline/guideline-treatment-premenstrual-dysphoric-disorder-pmdd_en.pdf"));
  emaGuidelines.add(GuidelineCard(title: "Schizophrenia treatment ", url: "https://www.ema.europa.eu/documents/scientific-guideline/guideline-clinical-investigation-medicinal-products-including-depot-preparations-treatment_en.pdf"));


}
getAanGuidelines(){
  aanGuidelines.add(GuidelineCard(title: "stroke prevention in symptomatic intracranial atherosclerosis ", url: "https://www.aan.com/Guidelines/Home/GetGuidelineContent/1070"));
  aanGuidelines.add(GuidelineCard(title: "treatment of essential tremors ", url: "https://www.aan.com/Guidelines/Home/GetGuidelineContent/495"));
  aanGuidelines.add(GuidelineCard(title: "Non febrile seizure in child ", url: "https://n.neurology.org/content/neurology/55/5/616.full-text.pdf"));
  aanGuidelines.add(GuidelineCard(title: "Diagnosis of dementia ", url: "https://n.neurology.org/content/neurology/56/9/1143.full-text.pdf"));
  aanGuidelines.add(GuidelineCard(title: "Aducanumab in symptomatic Alzheimer", url: "https://n.neurology.org/content/neurology/98/15/619.full-text.pdf"));
  aanGuidelines.add(GuidelineCard(title: "Pediatric migraine prevention", url: "https://www.aan.com/Guidelines/home/GetGuidelineContent/978"));


}


getIdsaGuidelines(){


  idsaGuidelines.add(GuidelineCard(title: "Clostridioides difficile Infection in Adults", url: "https://www.idsociety.org/globalassets/idsa/practice-guidelines/cdi-2021-focused-update.pdf"));
  idsaGuidelines.add(GuidelineCard(title: "Diagnosis and Management of Babesiosis", url: "https://academic.oup.com/cid/advance-article-pdf/doi/10.1093/cid/ciaa1216/34600944/ciaa1216.pdf"));
  idsaGuidelines.add(GuidelineCard(title: "Vancomycin for MRSA ", url: "https://academic.oup.com/ajhp/advance-article-pdf/doi/10.1093/ajhp/zxaa036/32932598/zxaa036.pdf"));
  idsaGuidelines.add(GuidelineCard(title: "osteomyelitis in pediatric ", url: "https://www.idsociety.org/globalassets/idsa/practice-guidelines/piab027.pdf"));
  idsaGuidelines.add(GuidelineCard(title: "management health care living with HIV and HBV ", url: "https://www.idsociety.org/globalassets/idsa/practice-guidelines/management-of-healthcare-personnel-living-with-hepatitis-b-hepatitis-c-or-human-immunodeficiency-virus-in-us-healthcare-institutions.pdf"));
  idsaGuidelines.add(GuidelineCard(title: "Staphylococcus aureus disease prevention", url: "https://www.idsociety.org/globalassets/idsa/practice-guidelines/shea-neonatal-intensive-care-unit-nicu-white-paper-series-practical-approaches-to-staphylococcus-aureus-disease-prevention.pdf"));
  
}

}