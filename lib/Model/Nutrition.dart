import 'GuidelineCard.dart';

class Nutrition{
  List<GuidelineCard> aspenGuidelines = List.empty(growable: true);
  List<GuidelineCard> espenGuidelines = List.empty(growable: true);

  static String option1="Aspen";
  static String option2="Espen";
  Map<String, List<GuidelineCard>> map = {};

  Nutrition() {
    getAspenGuidelines();
    getEspenGuidelines();
    map.putIfAbsent(option1, () => aspenGuidelines);
    map.putIfAbsent(option2, () => espenGuidelines);
  }

  getAspenGuidelines(){
    aspenGuidelines.add(GuidelineCard(title: "Aspen guidelines", url: "https://www.nutritioncare.org/clinicalguidelines/"));

  }

  getEspenGuidelines(){
    espenGuidelines.add(GuidelineCard(title: "Espen guidelines", url: "https://www.espen.org/guidelines-home/espen-guidelines"));

  }
}