import 'GuidelineCard.dart';

class BookStock{
  List<GuidelineCard> guidelines = List.empty(growable: true);
  Map<String, List<GuidelineCard>> map = {};

  BookStock() {
    getGuidelines();

    map.putIfAbsent("stock", () => guidelines);
  }

  getGuidelines(){
    guidelines.add(GuidelineCard(title: "handbook of drug administration via enteral feeding tubes 2015 (1)", url: "https://drive.google.com/file/d/1lHbewzNfN3sKGtqLLloFvi_UmnAVIopW/view?usp=sharing"));
    guidelines.add(GuidelineCard(title: "Lexi-Comp's Drug Information Handbook (17th_Edition)", url: "https://drive.google.com/file/d/11B-sygf8pSRLwU33tG9FvUkk3oe9yfT8/view?usp=sharing"));
    guidelines.add(GuidelineCard(title: "Mosby Mosbys Drug Reference for Health Professions", url: "https://drive.google.com/file/d/13iSJUs5LcJMult8AQaPWGSc-oPtf5k75/view?usp=sharing"));
    guidelines.add(GuidelineCard(title: "Stockleys Drug Interactions 2015", url: "https://drive.google.com/file/d/1i-cITBhcTwgJzqkz3R7-CgOuFVl0GAfJ/view?usp=sharing"));
    guidelines.add(GuidelineCard(title: "Briggs Drugs in Pregnancy and Lactation 10th Edition (2015) [PDF]_pharmacybr", url: "https://drive.google.com/file/d/1sRcXdi1ZXBNmiYX4i1LY6IuvYNpLVgqr/view?usp=sharing"));
    guidelines.add(GuidelineCard(title: "Caroline Ashley,Aileen Dunleavy - The Renal Drug Handbook", url: "https://drive.google.com/file/d/1zsJoOhQm1NfUu3KAkSa7QxoKTg0W2izV/view?usp=sharing"));
    guidelines.add(GuidelineCard(title: "BNF 2022", url: "https://drive.google.com/file/d/1xeVy8Kd1P4BSH_VScpWGpX7zUmzLazEG/view?usp=sharing"));
    guidelines.add(GuidelineCard(title: "Lawrence A Trissel - Handbook on Injectable Drugs - ASHP (2013)", url: "https://drive.google.com/file/d/1jhZqDMt8sDDOfRyobLWudrWD0_nrX4EM/view?usp=sharing"));



  }
}