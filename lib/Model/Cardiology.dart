import 'GuidelineCard.dart';

class Cardiology {
  List<GuidelineCard> ahaGuidelines = List.empty(growable: true);
  List<GuidelineCard> escGuidelines = List.empty(growable: true);
  Map<String, List<GuidelineCard>> cardioMap = {};

  Cardiology() {
    getAhaGuidelines();
    getEscGuidelines();

    cardioMap.putIfAbsent("esc", () => escGuidelines);
    cardioMap.putIfAbsent("aha", () => ahaGuidelines);
  }
  getAhaGuidelines() {
    ahaGuidelines.add(GuidelineCard(
        title: "the Management of Heart Failure 1 ",
        url:
            "https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000001063"));
    ahaGuidelines.add(GuidelineCard(
        title: "the Management of Heart Failure 2",
        url:
            "https://hfsa.org/sites/default/files/2022-04/ACC-AHA-HFSA-JCF-HFGuidelines-Top10.pdf"));
    ahaGuidelines.add(GuidelineCard(
        title: "Blood pressure and the new hypertension guidelines",
        url:
            "https://www.aafp.org/content/dam/brand/aafp/pubs/afp/issues/2018/0315/p413.pdf"));
    ahaGuidelines.add(GuidelineCard(
        title: "on the Primary Prevention of Cardiovascular Disease",
        url:
            "https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000000678"));
    ahaGuidelines.add(GuidelineCard(
        title: "Infective Endocarditis in Adults Antimicrobial Therapy",
        url:
            "https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000000296"));
    ahaGuidelines.add(GuidelineCard(
        title: "the Evaluation and Diagnosis of Chest Pain",
        url:
            "https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000001029"));
    ahaGuidelines.add(GuidelineCard(
        title: "Coronary Artery Revascularization",
        url:
            "https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000001038"));
    ahaGuidelines.add(GuidelineCard(
        title: "Cardiogenic Shock ",
        url: "https://www.ahajournals.org/doi/reader/10.1161/JAHA.119.011991"));
    ahaGuidelines.add(GuidelineCard(
        title:
            "Perioperative Cardiovascular Evaluation and Management of Patients Undergoing Noncardiac Surgery",
        url:
            "https://www.ahajournals.org/doi/pdf/10.1161/CIR.0000000000000106"));
    ahaGuidelines.add(GuidelineCard(
        title: "Cardiac Amyloidosis",
        url:
            "https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000000792"));
    ahaGuidelines.add(GuidelineCard(
        title: "Update on Cardiovascular Implantable Electronic Device ",
        url:
            "https://www.ahajournals.org/doi/reader/10.1161/CIRCULATIONAHA.109.192665"));
    ahaGuidelines.add(GuidelineCard(
        title: "Cardiovascular Considerations in Caring for Pregnant Patients",
        url:
            "https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000000772"));
    ahaGuidelines.add(GuidelineCard(
        title: "the Management of Patients with Atrial Fibrillation",
        url:
            "https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000000665"));
    ahaGuidelines.add(GuidelineCard(
        title:
            "Management of Pregnancy in Patients with Complex Congenital Heart Disease",
        url:
            "https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000000603"));
    ahaGuidelines.add(GuidelineCard(
        title:
            "Management of Stroke in Patients with Stroke and Transient Ischemic Attack",
        url:
            "https://www.ahajournals.org/doi/reader/10.1161/STR.0000000000000375"));
    ahaGuidelines.add(GuidelineCard(
        title: "Management of Patients With ST-Elevation Myocardial Infarction",
        url: "https://www.ahajournals.org/doi/pdf/10.1161/circ.110.9.e82"));
    ahaGuidelines.add(GuidelineCard(
        title:
            "Cardiopulmonary Resuscitation and Emergency Cardiovascular Care",
        url:
            "https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000000918"));
    ahaGuidelines.add(GuidelineCard(
        title: "Highlights of AHA Guidelines for CPR and ECC ",
        url:
            "https://cpr.heart.org/-/media/cpr-files/cpr-guidelines-files/highlights/hghlghts_2020_ecc_guidelines_english.pdf"));
    ahaGuidelines.add(GuidelineCard(
        title:
            "Clinical Performance and Quality Measures for Cardiac Rehabilitation",
        url:
            "https://www.ahajournals.org/doi/epub/10.1161/HCQ.0000000000000099"));
    ahaGuidelines.add(GuidelineCard(
        title: "the Management of Blood Cholesterol",
        url:
            "https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000000625"));
    ahaGuidelines.add(GuidelineCard(
        title:
            "Management of Patients with Non–ST-Elevation Acute Coronary Syndromes",
        url:
            "https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000000134"));
    ahaGuidelines.add(GuidelineCard(
        title: "ST-Elevation Myocardial Infarction: Executive Summary",
        url:
            "https://www.ahajournals.org/doi/epub/10.1161/CIR.0b013e3182742c84"));
    ahaGuidelines.add(GuidelineCard(
        title:
            "2020 AHA/ACC Guideline for the Diagnosis and Treatment of Patients with Hypertrophic Cardiomyopathy",
        url:
            "https://www.ahajournals.org/doi/reader/10.1161/CIR.0000000000000937"));
  }

  getEscGuidelines() {
    escGuidelines.add(GuidelineCard(
        title: "cancer treatments and cardiovascular toxicity ",
        url:
            "https://scholar.google.com/scholar_url?url=https://academic.oup.com/eurheartj/article-pdf/37/36/2768/23748938/ehw211.pdf&hl=ar&sa=T&oi=ucasa&ct=ufr&ei=t-RJY_f5I9qTy9YPuZmDwAY&scisig=AAGBfm0bQPzu-XbCKjM3WBiGFLBTWg7bSA"));

    escGuidelines.add(GuidelineCard(
        title: "cancer treatments and cardiovascular toxicity ",
        url:
            "https://scholar.google.com/scholar_url?url=https://academic.oup.com/eurheartj/article-pdf/37/36/2768/23748938/ehw211.pdf&hl=ar&sa=T&oi=ucasa&ct=ufr&ei=t-RJY_f5I9qTy9YPuZmDwAY&scisig=AAGBfm0bQPzu-XbCKjM3WBiGFLBTWg7bSA"));
    escGuidelines.add(GuidelineCard(
        title:
            "ventricular arrhythmias and the prevention of sudden cardiac death",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/36/41/2793/23487107/ehv316.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "non-cardiac surgery: cardiovascular assessment and management",
        url:
            "http://eurheartj.oxfordjournals.org/content/35/35/2383.full-text.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "diagnosis and treatment of pulmonary hypertension",
        url:
            "https://scholar.google.com/scholar_url?url=https://academic.oup.com/eurheartj/article-pdf/37/1/67/23492708/ehv317.pdf&hl=ar&sa=T&oi=ucasa&ct=ufr&ei=neZJY_D8CKLGsQKo-JaYCQ&scisig=AAGBfm2jQS74p_BZd1piO-4cyE1vslJIcA"));
    escGuidelines.add(GuidelineCard(
        title: "cardiovascular disease prevention in clinical practice",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/37/29/2315/23748850/ehw106.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "valvular heart disease",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/38/36/2739/24596044/ehx391.pdf"));
    escGuidelines.add(GuidelineCard(
        title:
            "sports cardiology and exercise in patients with cardiovascular disease",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/42/1/17/41216544/ehaa605.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "diagnosis and treatment of acute and chronic heart failure",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/37/27/2129/23748755/ehw128.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "management of adult congenital heart disease",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/42/6/563/41216858/ehaa554.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "diagnosis and management of atrial fibrillation",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/42/5/373/40364977/ehaa612.pdf"));
    escGuidelines.add(GuidelineCard(
        title:
            "management of acute coronary syndromes in patients presenting without persistent ST-segment elevation",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/42/14/1289/41217030/ehaa575.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "the management of patients with supraventricular tachycardia",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/41/5/655/33115827/ehz467.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "diabetes, pre-diabetes, and cardiovascular diseases ",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/41/2/255/33115788/ehz486.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "diagnosis and management of chronic coronary syndromes",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/41/3/407/32651471/ehz425.pdf"));
    escGuidelines.add(GuidelineCard(
        title:
            "the management of dyslipidaemias: lipid modification to reduce cardiovascular risk",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/41/1/111/33707502/ehz455.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "management of arterial hypertension",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/39/33/3021/31148893/ehy339.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "diagnosis and management of acute pulmonary embolism",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/41/4/543/34306708/ehz405.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "myocardial revascularization",
        url:
            "https://scholar.google.com/scholar_url?url=https://academic.oup.com/eurheartj/article-pdf/40/2/87/29005222/ehy394.pdf&hl=ar&sa=T&oi=ucasa&ct=ufr&ei=ze1JY8GbBdqTy9YPuZmDwAY&scisig=AAGBfm0vubFNmsQPj5zh81qvuHcR6s2o8A"));
    escGuidelines.add(GuidelineCard(
        title: "Fourth universal definition of myocardial infarction (2018)",
        url:
            "https://scholar.google.com/scholar_url?url=https://academic.oup.com/eurheartj/advance-article-pdf/doi/10.1093/eurheartj/ehy462/37049783/ehy462.pdf&hl=ar&sa=T&oi=ucasa&ct=ufr&ei=Qu5JY7WqE430mgHekrT4BA&scisig=AAGBfm0v9tTNOBUJi_qrIXmk15-wbgwKcw"));
    escGuidelines.add(GuidelineCard(
        title: "management of cardiovascular diseases during pregnancy",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/39/34/3165/31148900/ehy340.pdf"));
    escGuidelines.add(GuidelineCard(
        title:
            "Peripheral Arterial Diseases, in collaboration with the European Society for Vascular Surgery (ESVS)",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/39/9/763/25015217/ehx095.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "diagnosis and management of syncope",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/39/21/1883/28524854/ehy037.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "dual antiplatelet therapy in coronary artery disease ",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/39/3/213/23455993/ehx419.pdf"));
    escGuidelines.add(GuidelineCard(
        title:
            "management of acute myocardial infarction in patients presenting with ST-segment elevation",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/39/2/119/23289187/ehx393.pdf"));

    escGuidelines.add(GuidelineCard(
        title: "management of infective endocarditis",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/36/44/3075/23492315/ehv319.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "diagnosis and management of pericardial diseases",
        url:
            "https://academic.oup.com/eurheartj/article-pdf/36/42/2921/33342779/ehv318.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "diagnosis and management of hypertrophic cardiomyopathy",
        url:
            "http://eurheartj.oxfordjournals.org/content/35/39/2733.full-text.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "diagnosis and treatment of aortic diseases",
        url:
            "http://eurheartj.oxfordjournals.org/content/35/41/2873.full-text.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "device therapy in heart failure",
        url:
            "http://eurheartj.oxfordjournals.org/content/31/21/2677.full.pdf"));
    escGuidelines.add(GuidelineCard(
        title:
            "The role of endomyocardial biopsy in the management of cardiovascular disease",
        url:
            "http://eurheartj.oxfordjournals.org/content/28/24/3076.full.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "b-adrenergic receptor blockers",
        url:
            "http://eurheartj.oxfordjournals.org/content/25/15/1341.full.pdf"));
    escGuidelines.add(GuidelineCard(
        title:
            "angiotensin converting enzyme inhibitors in cardiovascular disease",
        url:
            "http://eurheartj.oxfordjournals.org/content/25/16/1454.full.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "Estimation of ten-year risk of fatal cardiovascular disease ",
        url: "http://eurheartj.oxfordjournals.org/content/24/11/987.full.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "the Use of Antiplatelet Agents",
        url: "http://eurheartj.oxfordjournals.org/content/25/2/166.full.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "Medical Practice Guidelines",
        url:
            "http://eurheartj.oxfordjournals.org/content/24/21/1962.full.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "interpretation of the neonatal electrocardiogram",
        url:
            "http://eurheartj.oxfordjournals.org/content/23/17/1329.full.pdf"));
    escGuidelines.add(GuidelineCard(
        title: "management of chest pain",
        url:
            "http://eurheartj.oxfordjournals.org/content/23/15/1153.full.pdf"));
  }
}
