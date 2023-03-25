import 'package:gppsupporters/Model/GuidelineCard.dart';

class Endocrinology{
  static String option1="Endocrine society ";

  List<GuidelineCard> endoSocietyGuidelines=List.empty(growable: true);
  Map<String,List<GuidelineCard>> endoMap={};

  Endocrinology(){
    getEndoSocietyGuidelines();

    endoMap.putIfAbsent(option1, () => endoSocietyGuidelines);

  }

  getEndoSocietyGuidelines(){
    endoSocietyGuidelines.add(GuidelineCard(title: "Congenital adrenal hyperplasia guideline", url: "https://academic.oup.com/jcem/advance-article/doi/10.1210/jc.2018-01865/5107759"));
    endoSocietyGuidelines.add(GuidelineCard(title: "Evaluation and management hypoglycemic disorder ", url: "https://doi.org/10.1210/jc.2008-1410"));
    endoSocietyGuidelines.add(GuidelineCard(title: "evaluation and treatment of hypertriglycridemia  ", url: "https://doi.org/10.1210/jc.2011-3213"));
    
  }


}
