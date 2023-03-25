import 'GuidelineCard.dart';

class Rheumatology{
  static String option1="EULAR";


  List<GuidelineCard> eularGuidelines = List.empty(growable: true);


  Map<String, List<GuidelineCard>> map = {};

  Rheumatology() {
    getEularGuidelines();


    map.putIfAbsent(option1, () => eularGuidelines);


  }

  getEularGuidelines(){


    eularGuidelines.add(GuidelineCard(title: "inflammatory rheumatic and musculoskeletal diseases", url: "https://ard.bmj.com/content/annrheumdis/early/2022/05/23/annrheumdis-2022-222155.full.pdf"));
    eularGuidelines.add(GuidelineCard(title: "Rheumatoid arthritis", url: "https://ard.bmj.com/content/annrheumdis/80/1/31.full.pdf"));
    eularGuidelines.add(GuidelineCard(title: "Sjogren’s syndrome with topical and systemic therapies", url: "https://ard.bmj.com/content/annrheumdis/79/1/3.full.pdf"));
    eularGuidelines.add(GuidelineCard(title: "peripheral joint osteoarthritis", url: "https://ard.bmj.com/content/annrheumdis/76/9/1484.full.pdf"));
    eularGuidelines.add(GuidelineCard(title: "Gout management", url: "https://www.eular.org/myUploadData/files/richette_summary_good_for_print_final.pdf"));
    eularGuidelines.add(GuidelineCard(title: "Management of familial Mediterranean fever", url: "https://ard.bmj.com/content/annrheumdis/75/4/644.full.pdf"));
  
  }

}