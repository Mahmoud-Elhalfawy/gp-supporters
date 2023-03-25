import 'GuidelineCard.dart';

class Gastroenterology{
  static String option1="ACG";
  static String option2="ECCO";
  List<GuidelineCard> acgGuidelines=List.empty(growable: true);
  List<GuidelineCard> eccoGuidelines=List.empty(growable: true);

  Map<String,List<GuidelineCard>> map={};

  Gastroenterology(){
    getAcgGuidelines();
    getEccoGuidelines();

    map.putIfAbsent(option1, () => acgGuidelines);
    map.putIfAbsent(option2, () => eccoGuidelines);

  }
  getAcgGuidelines(){
    acgGuidelines.add(GuidelineCard(title: "Gastroparesis", url: "https://journals.lww.com/ajg/Fulltext/2022/08000/ACG_Clinical_Guideline__Gastroparesis.15.aspx?context=FeaturedArticles&collectionId=2"));
    acgGuidelines.add(GuidelineCard(title: "Management of Anticoagulants and Antiplatelets During Acute Gastrointestinal Bleeding and the Periendoscopic Period", url: "https://journals.lww.com/ajg/Fulltext/2022/04000/American_College_of_Gastroenterology_Canadian.16.aspx?context=FeaturedArticles&collectionId=2"));
    acgGuidelines.add(GuidelineCard(title: "Upper Gastrointestinal and Ulcer Bleeding", url: "https://journals.lww.com/ajg/Fulltext/2021/05000/ACG_Clinical_Guideline__Upper_Gastrointestinal_and.14.aspx?context=FeaturedArticles&collectionId=2"));
    acgGuidelines.add(GuidelineCard(title: "upper ulcerative colitis", url: "https://journals.lww.com/ajg/Fulltext/2019/03000/ACG_Clinical_Guideline__Ulcerative_Colitis_in.10.aspx?context=FeaturedArticles&collectionId=2"));
    acgGuidelines.add(GuidelineCard(title: "chronic pancreatitis ", url: "https://journals.lww.com/ajg/Fulltext/2020/03000/ACG_Clinical_Guideline__Chronic_Pancreatitis.9.aspx?context=FeaturedArticles&collectionId=2"));
    acgGuidelines.add(GuidelineCard(title: "Benign anorectal disorder ", url: "https://journals.lww.com/ajg/Fulltext/2021/10000/ACG_Clinical_Guidelines__Management_of_Benign.13.aspx?context=FeaturedArticles&collectionId=2"));


  }

  getEccoGuidelines(){
    eccoGuidelines.add(GuidelineCard(title: "Ulcerative colitis ", url: "https://academic.oup.com/ecco-jcc/article-pdf/16/1/2/42324015/jjab178.pdf"));
    eccoGuidelines.add(GuidelineCard(title: "Crohn’s disease ", url: "https://academic.oup.com/ecco-jcc/article-pdf/11/1/3/26359570/jjw168.pdf"));
    eccoGuidelines.add(GuidelineCard(title: "Extra -intestinal Manifestations in Inflammatory Bowel Disease", url: "https://academic.oup.com/ecco-jcc/article-pdf/10/3/239/26359526/jjv213.pdf"));
    eccoGuidelines.add(GuidelineCard(title: "Management of Iron Deficiency and Anaemia in Inflammatory Bowel Diseases ", url: "https://academic.oup.com/ecco-jcc/article-pdf/9/3/211/26359797/jju009.pdf"));
    eccoGuidelines.add(GuidelineCard(title: "Management pediatric Crohn’s disease", url: "https://academic.oup.com/ecco-jcc/article-pdf/8/10/1179/26359816/8-10-1179.pdf"));
    eccoGuidelines.add(GuidelineCard(title: "Histopathology of Inflammatory Bowel Diseases", url: "https://academic.oup.com/ecco-jcc/article-pdf/7/10/827/26359670/7-10-827.pdf"));

  }
}