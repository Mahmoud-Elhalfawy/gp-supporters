import 'GuidelineCard.dart';

class Geriatrics{
  static String option1="American Geriatrics Society";
  static String option2="AFPP";
  List<GuidelineCard> americanSocietyGuidelines=List.empty(growable: true);
  List<GuidelineCard> afppGuidelines=List.empty(growable: true);

  Map<String,List<GuidelineCard>> map={};

  Geriatrics(){
    getAmericanSocietyGuidelines();
    getAfppGuidelines();

    map.putIfAbsent(option1, () => americanSocietyGuidelines);
    map.putIfAbsent(option2, () => afppGuidelines);

  }
  getAmericanSocietyGuidelines(){
    americanSocietyGuidelines.add(GuidelineCard(title: "American Geriatrics Society ", url: "https://www.americangeriatrics.org/publications-tools"));

  }

  getAfppGuidelines(){
    afppGuidelines.add(GuidelineCard(title: "AFPP", url: "https://www.aafp.org/family-physician/patient-care/clinical-recommendations/recommendations-by-topic/geriatric-medicine-clinical-recommendations-guidelines.html"));
  }
}