import 'GuidelineCard.dart';

class Oncology{
  static String option1="NCCN";
  static String option2="BC-CANCER";
  static String option3="ASCO";
  static String option4="Hematology";
  static String option5="British society of hematology";

  List<GuidelineCard> ncnnGuidelines = List.empty(growable: true);
  List<GuidelineCard> bcCancerGuidelines = List.empty(growable: true);
  List<GuidelineCard> ascoGuidelines = List.empty(growable: true);
  List<GuidelineCard> hematologyGuidelines = List.empty(growable: true);
  List<GuidelineCard> britishSocietyGuidelines = List.empty(growable: true);

  Map<String, List<GuidelineCard>> map = {};

  Oncology() {
    getNcnnGuidelines();
    getBcCancerGuidelines();
    getAscoGuidelines();
    getHematologyGuidelines();
    getBritishSocietyGuidelines();

    map.putIfAbsent(option1, () => ncnnGuidelines);
    map.putIfAbsent(option2, () => bcCancerGuidelines);
    map.putIfAbsent(option3, () => ascoGuidelines);
    map.putIfAbsent(option4, () => hematologyGuidelines);
    map.putIfAbsent(option5, () => britishSocietyGuidelines);

  }
  getNcnnGuidelines(){
    ncnnGuidelines.add(GuidelineCard(title: "Acute Lymphoblastic Leukaemia", url: "https://www.nccn.org/professionals/physician_gls/pdf/all.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Multiple Myeloma", url: "https://www.nccn.org/professionals/physician_gls/pdf/myeloma.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Acute Myeloid Leukaemia", url: "https://www.nccn.org/professionals/physician_gls/pdf/aml.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Myelodysplastic Syndromes", url: "https://www.nccn.org/professionals/physician_gls/pdf/mds.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Ampullary Adenocarcinoma", url: "https://www.nccn.org/professionals/physician_gls/pdf/ampullary.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Myeloid/Lymphoid Neoplasms with Eosinophilia and Tyrosine Kinase Fusion Genes", url: "https://www.nccn.org/professionals/physician_gls/pdf/mlne.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Anal Carcinoma", url: "https://www.nccn.org/professionals/physician_gls/pdf/anal.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Basal Cell Skin Cancer", url: "https://www.nccn.org/professionals/physician_gls/pdf/nmsc.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Bone cancer", url: "https://www.nccn.org/professionals/physician_gls/pdf/bone.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "CNS cancers", url: "https://www.nccn.org/professionals/physician_gls/pdf/cns.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Hepatobiliary cancers", url: "https://www.nccn.org/professionals/physician_gls/pdf/hepatobiliary.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Hodgkin lymphoma ", url: "https://www.nccn.org/professionals/physician_gls/pdf/hodgkins.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Kidney cancer", url: "https://www.nccn.org/professionals/physician_gls/pdf/kidney.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Malignant Peritoneal Mesothelioma", url: "https://www.nccn.org/professionals/physician_gls/pdf/mpem.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Non-Small Cell Lung Cancer", url: "https://www.nccn.org/professionals/physician_gls/pdf/nscl.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Ovarian Cancer Continue Including Fallopian Tube Cancer and Primary Peritoneal Cancer", url: "https://www.nccn.org/professionals/physician_gls/pdf/ovarian.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Prostate cancer", url: "https://www.nccn.org/professionals/physician_gls/pdf/prostate.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Rectal cancer", url: "https://www.nccn.org/professionals/physician_gls/pdf/rectal.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Nephroblastoma", url: "https://www.nccn.org/professionals/physician_gls/pdf/wilms_tumor.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Hematopoietic call transplant", url: "https://www.nccn.org/professionals/physician_gls/pdf/hct.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Myeloproliferative Neoplasms", url: "https://www.nccn.org/professionals/physician_gls/pdf/mpn.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "B-Cell Lymphomas", url: "https://www.nccn.org/professionals/physician_gls/pdf/b-cell.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Neuroendocrine and Adrenal Tumor", url: "https://www.nccn.org/professionals/physician_gls/pdf/neuroendocrine.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Bladder Cancer", url: "https://www.nccn.org/professionals/physician_gls/pdf/bladder.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Pediatric Acute Lymphoblastic Leukemia ", url: "https://www.nccn.org/professionals/physician_gls/pdf/ped_all.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Pancreatic Adenocarcinoma", url: "https://www.nccn.org/professionals/physician_gls/pdf/pancreatic.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Cervical Cancer", url: "https://www.nccn.org/professionals/physician_gls/pdf/cervical.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Waldenström Macroglobulinemia / Lymphoplasmacytic Lymphoma", url: "https://www.nccn.org/professionals/physician_gls/pdf/waldenstroms.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Merkel Cell Carcinoma", url: "https://www.nccn.org/professionals/physician_gls/pdf/mcc.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Vulvar Cancer", url: "https://www.nccn.org/professionals/physician_gls/pdf/vulvar.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Chroic myeloid leukemia", url: "https://www.nccn.org/professionals/physician_gls/pdf/cml.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Colon cancer", url: "https://www.nccn.org/professionals/physician_gls/pdf/colon.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Dermatofibrosarcoma protuberans ", url: "https://www.nccn.org/professionals/physician_gls/pdf/dfsp.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Esophageal and Esophagogastric Junction Cancers", url: "https://www.nccn.org/professionals/physician_gls/pdf/esophageal.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Gastric cancer", url: "https://www.nccn.org/professionals/physician_gls/pdf/gastric.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Gastrointestinal stromal tumor", url: "https://www.nccn.org/professionals/physician_gls/pdf/gist.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Gestational Trophoblastic Neoplasia", url: "https://www.nccn.org/professionals/physician_gls/pdf/gtn.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Hairy Cell Leukemia", url: "https://www.nccn.org/professionals/physician_gls/pdf/hairy_cell.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Head and Neck Cancers", url: "https://www.nccn.org/professionals/physician_gls/pdf/head-and-neck.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Pediatric Aggressive Mature B-Cell Lymphomas", url: "https://www.nccn.org/professionals/physician_gls/pdf/ped_b-cell.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Histiocytic Neoplasms", url: "https://www.nccn.org/professionals/physician_gls/pdf/histiocytic_neoplasms.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Malignant Pleural Mesothelioma", url: "https://www.nccn.org/professionals/physician_gls/pdf/mpm.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Pediatric Central Nervous System Cancers", url: "https://www.nccn.org/professionals/physician_gls/pdf/ped_cns.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Uterine Neoplasms", url: "https://www.nccn.org/professionals/physician_gls/pdf/uterine.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Thyroid Carcinoma", url: "https://www.nccn.org/professionals/physician_gls/pdf/thyroid.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Thymomas and Thymic Carcinomas", url: "https://www.nccn.org/professionals/physician_gls/pdf/thymic.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Testicular Cancer", url: "https://www.nccn.org/professionals/physician_gls/pdf/testicular.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "T-Cell Lymphomas", url: "https://www.nccn.org/professionals/physician_gls/pdf/t-cell.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Pediatric Hodgkin Lymphoma", url: "https://www.nccn.org/professionals/physician_gls/pdf/ped_hodgkin.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Penile Cancer", url: "https://www.nccn.org/professionals/physician_gls/pdf/penile.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Primary Cutaneous Lymphomas", url: "https://www.nccn.org/professionals/physician_gls/pdf/primary_cutaneous.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Small Bowel Adenocarcinoma", url: "https://www.nccn.org/professionals/physician_gls/pdf/small_bowel.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Small Cell Lung Cancer", url: "https://www.nccn.org/professionals/physician_gls/pdf/sclc.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Soft Tissue Sarcoma", url: "https://www.nccn.org/professionals/physician_gls/pdf/sarcoma.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Squamous Cell Skin Cancer", url: "https://www.nccn.org/professionals/physician_gls/pdf/squamous.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Systemic Light Chain Amyloidosis", url: "https://www.nccn.org/professionals/physician_gls/pdf/amyloidosis.pdf"));
    ncnnGuidelines.add(GuidelineCard(title: "Systemic Mastocytosis", url: "https://www.nccn.org/professionals/physician_gls/pdf/mastocytosis.pdf"));
  }

  getBcCancerGuidelines(){
    bcCancerGuidelines.add(GuidelineCard(title: "Breast", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/breast"));
    bcCancerGuidelines.add(GuidelineCard(title: "Gastrointestinal tract", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/gastrointestinal"));
    bcCancerGuidelines.add(GuidelineCard(title: "Genitourinary ", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/genitourinary"));
    bcCancerGuidelines.add(GuidelineCard(title: "Gynecology", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/gynecology"));
    bcCancerGuidelines.add(GuidelineCard(title: "Head and Neck", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/head-neck"));
    bcCancerGuidelines.add(GuidelineCard(title: "immunotherapy", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/immunotherapy"));
    bcCancerGuidelines.add(GuidelineCard(title: "interim protocols", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/interim-protocols"));
    bcCancerGuidelines.add(GuidelineCard(title: "Kaposi’s-sarcoma", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/kaposis-sarcoma"));
    bcCancerGuidelines.add(GuidelineCard(title: "leukemia-bone-marrow-transplant", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/leukemia-bone-marrow-transplant"));
    bcCancerGuidelines.add(GuidelineCard(title: "Lung ", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/lung"));
    bcCancerGuidelines.add(GuidelineCard(title: "lymphoma-myeloma", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/lymphoma-myeloma"));
    bcCancerGuidelines.add(GuidelineCard(title: "miscellaneous origin", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/miscellaneous-origin"));
    bcCancerGuidelines.add(GuidelineCard(title: "neuro-oncology", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/neuro-oncology"));
    bcCancerGuidelines.add(GuidelineCard(title: "Ocular", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/ocular"));
    bcCancerGuidelines.add(GuidelineCard(title: "primary-unknown", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/primary-unknown"));
    bcCancerGuidelines.add(GuidelineCard(title: "Sarcoma", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/sarcoma"));
    bcCancerGuidelines.add(GuidelineCard(title: "skin-melanoma", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/skin-melanoma"));
    bcCancerGuidelines.add(GuidelineCard(title: "supportive care", url: "http://www.bccancer.bc.ca/health-professionals/clinical-resources/chemotherapy-protocols/supportive-care"));


  }


  getAscoGuidelines(){

    ascoGuidelines.add(GuidelineCard(title: "Breast cancer", url: "https://www.asco.org/practice-patients/guidelines/breast-cancer"));
    ascoGuidelines.add(GuidelineCard(title: "Hematologic malignancy ", url: "https://www.asco.org/practice-patients/guidelines/hematologic-malignancies"));
    ascoGuidelines.add(GuidelineCard(title: "Supportive care and treatment", url: "https://www.asco.org/practice-patients/guidelines/supportive-care-and-treatment-related-issues"));
    ascoGuidelines.add(GuidelineCard(title: "Adjuvant therapy for stage 2 colon cancer", url: "https://ascopubs.org/doi/pdf/10.1200/JCO.21.02538"));
    ascoGuidelines.add(GuidelineCard(title: "Neuro-oncology", url: "https://www.asco.org/practice-patients/guidelines/Neurooncology"));
    ascoGuidelines.add(GuidelineCard(title: "Systemic therapy of melanoma", url: "https://ascopubs.org/doi/pdf/10.1200/JCO.22.00944"));


  }
  getHematologyGuidelines(){

    hematologyGuidelines.add(GuidelineCard(title: "Venous thromboembolism", url: "https://www.hematology.org/education/clinicians/guidelines-and-quality-care/clinical-practice-guidelines/venous-thromboembolism-guidelines"));
    hematologyGuidelines.add(GuidelineCard(title: "Sickle cell disease ", url: "https://www.hematology.org/education/clinicians/guidelines-and-quality-care/clinical-practice-guidelines/sickle-cell-disease-guidelines"));
    hematologyGuidelines.add(GuidelineCard(title: "Diagnosis of von Willebrand disease", url: "https://scholar.google.com/scholar_url?url=https://ashpublications.org/bloodadvances/article-pdf/5/1/280/1808130/advancesadv2020003265c.pdf&hl=ar&sa=T&oi=ucasa&ct=ufr&ei=ZjhNY6mvIJeTy9YPgPGNKA&scisig=AAGBfm0zb-gA212tIfkrsrt_nyo_j7ZOWQ"));
    hematologyGuidelines.add(GuidelineCard(title: "Immune thrombocytopenia ", url: "https://ashpublications.org/bloodadvances/article-pdf/3/23/3829/1551404/advancesadv2019000966.pdf"));
    hematologyGuidelines.add(GuidelineCard(title: "Acute leukemia workup", url: "http://www.archivesofpathology.org/doi/pdf/10.5858/arpa.2016-0504-CP"));
    hematologyGuidelines.add(GuidelineCard(title: "Acute myeloid leukemia ", url: "https://ashpublications.org/bloodadvances/article-pdf/4/15/3528/1751528/advancesadv2020001920c.pdf"));



  }

  getBritishSocietyGuidelines(){


    britishSocietyGuidelines.add(GuidelineCard(title: "Thrombophilia ", url: "https://onlinelibrary.wiley.com/doi/epdf/10.1111/bjh.18239"));
    britishSocietyGuidelines.add(GuidelineCard(title: "Major hemorrhage ", url: "https://onlinelibrary.wiley.com/doi/epdf/10.1111/bjh.18275"));
    britishSocietyGuidelines.add(GuidelineCard(title: "laboratory diagnosis of iron deficiency in adults", url: "https://onlinelibrary.wiley.com/doi/epdf/10.1111/bjh.17900"));
    britishSocietyGuidelines.add(GuidelineCard(title: "the management of mature T- and natural killer-cell lymphomas ", url: "https://onlinelibrary.wiley.com/doi/epdf/10.1111/bjh.17951"));
    britishSocietyGuidelines.add(GuidelineCard(title: "management of iron overload in patients with haemoglobinopathies ", url: "https://onlinelibrary.wiley.com/doi/epdf/10.1111/bjh.17839"));
    britishSocietyGuidelines.add(GuidelineCard(title: "laboratory diagnosis of malaria", url: "https://onlinelibrary.wiley.com/doi/epdf/10.1111/bjh.18092"));


  }

  
}