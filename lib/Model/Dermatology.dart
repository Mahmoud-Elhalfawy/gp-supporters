import 'GuidelineCard.dart';

class Dermatology{
  static String option1="AAD";


  List<GuidelineCard> aadGuidelines = List.empty(growable: true);


  Map<String, List<GuidelineCard>> map = {};

  Dermatology() {
    getAadGuidelines();


    map.putIfAbsent(option1, () => aadGuidelines);


  }


  getAadGuidelines(){

    aadGuidelines.add(GuidelineCard(title: "Psoriasis management", url: "https://www.jaad.org/action/showPdf?pii=S0190-9622%2820%2932288-X"));
    aadGuidelines.add(GuidelineCard(title: "Acne treatment ", url: "https://www.jaad.org/action/showPdf?pii=S0190-9622%2815%2902614-6"));
    aadGuidelines.add(GuidelineCard(title: "Cutaneous squamous cell carcinoma", url: "https://www.jaad.org/action/showPdf?pii=S0190-9622%2817%2932530-6"));
    aadGuidelines.add(GuidelineCard(title: "Cutaneous melanoma", url: "https://www.jaad.org/action/showPdf?pii=S0190-9622%2818%2932588-X"));
    aadGuidelines.add(GuidelineCard(title: "Actinic keratosis", url: "https://www.jaad.org/action/showPdf?pii=S0190-9622%2822%2900612-0"));
    aadGuidelines.add(GuidelineCard(title: "Reconstruction after skin cancer resection", url: "https://www.jaad.org/action/showPdf?pii=S0190-9622%2821%2900505-3"));




  }
}