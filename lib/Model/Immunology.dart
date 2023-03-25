import 'GuidelineCard.dart';

class Immunology{

  static String option1="Guideline central";
  static String option2="bsaci";

  List<GuidelineCard> guidelineCentralGuidelines=List.empty(growable: true);
  List<GuidelineCard> bsaciGuidelines=List.empty(growable: true);
  Map<String,List<GuidelineCard>> immunoMap={};

  Immunology(){
    getGuidelineCentralGuidelines();
    getBsaciGuidelines();

    immunoMap.putIfAbsent(option1, () => guidelineCentralGuidelines);
    immunoMap.putIfAbsent(option2, () => bsaciGuidelines);

  }

  getGuidelineCentralGuidelines(){
    guidelineCentralGuidelines.add(GuidelineCard(title: "Atopic dermatitis comorbidity", url: "https://www.jaad.org/action/showPdf?pii=S0190-9622%2822%2900080-9"));
    guidelineCentralGuidelines.add(GuidelineCard(title: "Exhaled Nitic oxide in asthma treatment ", url: "https://www.atsjournals.org/doi/10.1164/rccm.202109-2093ST"));
    guidelineCentralGuidelines.add(GuidelineCard(title: "Rhinosinusitis ", url: "https://onlinelibrary.wiley.com/doi/10.1002/alr.22741"));
    guidelineCentralGuidelines.add(GuidelineCard(title: "Hypersensitivity pneumonitis in adult ", url: "https://www.atsjournals.org/doi/full/10.1164/rccm.202005-2032ST"));
    guidelineCentralGuidelines.add(GuidelineCard(title: "Classification of cough ", url: "https://journal.chestnet.org/article/S0012-3692(17)32918-5/fulltext"));
    guidelineCentralGuidelines.add(GuidelineCard(title: "Interactions Between Anti‐Infective Agents and Immunosuppressants", url: "https://onlinelibrary.wiley.com/doi/10.1111/ctr.13510"));

  }
  getBsaciGuidelines(){
    bsaciGuidelines.add(GuidelineCard(title: "Beta-lactam / Penicillin Allergy", url: "https://www.bsaci.org/wp-content/uploads/2019/12/Beta-lactam_Penicillin2015_cea12468.pdf"));
    bsaciGuidelines.add(GuidelineCard(title: "Chronic Urticaria and Angioedema", url: "https://www.bsaci.org/wp-content/uploads/2020/01/Urticaria_Angioedema2015-1.pdf"));
    bsaciGuidelines.add(GuidelineCard(title: "Anaphylaxis during General Anaesthesia", url: "https://www.bsaci.org/wp-content/uploads/2020/01/AnaphylaxisGeneralAnaesthesia2009-1.pdf"));
    bsaciGuidelines.add(GuidelineCard(title: "Cow's Milk Allergy", url: "https://www.bsaci.org/wp-content/uploads/2020/09/Milk-guideline-pdf.pdf"));
    bsaciGuidelines.add(GuidelineCard(title: "Emergency Anaphylactic Treatment", url: "https://www.bsaci.org/wp-content/uploads/2020/01/Emergencytreatmentofanaphylacticreactions2008.pdf"));
    bsaciGuidelines.add(GuidelineCard(title: "Peanut and Tree Nut Allergy", url: "https://www.bsaci.org/wp-content/uploads/2020/01/Stiefel_et_al-2017-Clinical_amp_Experimental_Allergy.pdf"));

  }


}