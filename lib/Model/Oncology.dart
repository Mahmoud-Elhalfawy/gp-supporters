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
    ncnnGuidelines.add(GuidelineCard(title:"NCCN Guidelines",url:"https://www.nccn.org/guidelines/category_1"));
    ncnnGuidelines.add(GuidelineCard(title:"Acute Lymphoblastic Leukaemia",url:"https://drive.google.com/file/d/1zrU7AymsvWg_Z0EakrGzESlfc6IfAAKQ/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Multiple Myeloma",url:"https://drive.google.com/file/d/1X9W1DdtpCPCLarhYIPPVde_BBPtmgp9c/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Acute Myeloid Leukaemia",url:"https://drive.google.com/file/d/1VDMqXcBhgDagUvrXHAitKT63VoE2H1CZ/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Myelodysplastic Syndromes",url:"https://drive.google.com/file/d/1wFy-AX2MSIbj7i_oxn2g8dkB7RA1wgcB/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Ampullary Adenocarcinoma",url:"https://drive.google.com/file/d/1TOMWWR_6lGFpKpzjjE9oXXrjjPMs2ar4/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Myeloid/Lymphoid Neoplasms with Eosinophilia and Tyrosine Kinase Fusion Genes",url:"https://drive.google.com/file/d/1_QWpYfCmocYENbgn3dfS13XMwqsnSL97/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Anal Carcinoma",url:"https://drive.google.com/file/d/1p8bYBePqK5fmxMnPBG-B015F2HxtzvYB/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Basal Cell Skin Cancer",url:"https://drive.google.com/file/d/1lmZa3YMXTAPRJIBMGX55MDdnFnIOJ5ip/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Bone cancer",url:"https://drive.google.com/file/d/1Yfsi8596b1JkHv9puhccPXITO11gygA5/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"CNS cancers",url:"https://drive.google.com/file/d/1Drip7jMoHGAREwmjZakR6EFg_s7X3vYw/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Hepatobiliary cancers",url:"https://drive.google.com/file/d/1Ol1BCcRIcDO2nbwyqLTJ62_sghaVe8h7/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Hodgkin lymphoma ",url:"https://drive.google.com/file/d/1QHOxUJPEPs1GjLdYlGOqPAfx5RtjnAas/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Kidney cancer",url:"https://drive.google.com/file/d/1Xhd_uwza-rNiFwQMkdlYYCbOKRNJREy4/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Malignant Peritoneal Mesothelioma",url:"https://drive.google.com/file/d/1t0enM7Pvo3ODMUxFqej46bRtegwN4H3G/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Non-Small Cell Lung Cancer",url:"https://drive.google.com/file/d/1y9PGdErR6JiLoGauCwH0wGELIuJ75-58/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Ovarian Cancer Continue Including Fallopian Tube Cancer and Primary Peritoneal Cancer",url:"https://drive.google.com/file/d/1C7HOgV9fN3SjWYC0oQxZ4UrRiFL1cgjF/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Prostate cancer",url:"https://drive.google.com/file/d/1gFcQvfvXUXsjuIM_BlRjKm9xqAiQGVYZ/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Rectal cancer",url:"https://drive.google.com/file/d/1_A3dig3D-4dLWLtdlrrzZB7TDY27-7MN/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Nephroblastoma",url:"https://drive.google.com/file/d/1yCpABFqL4w_Da56dkHnLQCdtXLZh4ZZF/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Hematopoietic call transplant",url:"https://drive.google.com/file/d/1J2KcKlvom_xieNOMuNkFhadwoDeg4pKJ/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Myeloproliferative Neoplasms",url:"https://drive.google.com/file/d/1jhggil3Z1BSZMLfNUsU-AOsRpsgqT550/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"B-Cell Lymphomas",url:"https://drive.google.com/file/d/1__gMom86Q1cUxM_3p7yw-cQiOXy2GyPy/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Neuroendocrine and Adrenal Tumor",url:"https://drive.google.com/file/d/1yiKso0hMK5dAYx42SQuidPQuirdAqSZM/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Bladder Cancer",url:"https://drive.google.com/file/d/1yuhlVHBXTcjUBvXXtPNf-TnzMekwj2CN/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Pediatric Acute Lymphoblastic Leukemia ",url:"https://drive.google.com/file/d/1TnGJXuEyQplspiGqheDTOEQIV5LV8oNo/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Pancreatic Adenocarcinoma",url:"https://drive.google.com/file/d/1ljO4IQFwnKoQAZstscgPRt34xwachb4n/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Cervical Cancer",url:"https://drive.google.com/file/d/172z7BKTABjuolI8N8ACdXq_3YmxCsiGa/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Waldenström Macroglobulinemia / Lymphoplasmacytic Lymphoma",url:"https://drive.google.com/file/d/1jZcli7LD_tKATHxkYR7qvJ7c1RAIf2eE/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Merkel Cell Carcinoma",url:"https://drive.google.com/file/d/1kp8aYCfzPLAJOSxCMsN3F8Nrthl5j7_i/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Vulvar Cancer",url:"https://drive.google.com/file/d/1VlLr3gnYmZ5X3jDPtBbYni_r2_j8245u/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Chroic myeloid leukemia",url:"https://drive.google.com/file/d/17sYE3_mtp8zZnNBWeU_9BM8RFQVDrShR/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Colon cancer",url:"https://drive.google.com/file/d/1lMG9UFDThWa0AO3hUz9KHm3JIVo-B7CN/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Dermatofibrosarcoma protuberans ",url:"https://drive.google.com/file/d/1PS7APs-RxxMQutmxJwXqk45kqHggmv6q/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Esophageal and Esophagogastric Junction Cancers",url:"https://drive.google.com/file/d/1vAAaTnW1v5T4LnK9rhGkrTmSD_0v6oHg/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Gastric cancer",url:"https://drive.google.com/file/d/1vixncppL95CnuGHPT38EqXZ_XTl5xwRC/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Gastrointestinal stromal tumor",url:"https://drive.google.com/file/d/1DZrMnxgJF6J3FTyvddHUsQ-NzmJQOMkB/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Gestational Trophoblastic Neoplasia",url:"https://drive.google.com/file/d/1P6DRtb31xlWlx8g1lN3Szx1wOBNpyb4H/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Hairy Cell Leukemia",url:"https://drive.google.com/file/d/18NnW_SYf8L7EAAVGXFZVrf4OMkYD3Rre/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Head and Neck Cancers",url:"https://drive.google.com/file/d/1tsnDryVzeH4xdOmwZ5tgT_V0ddRxBhck/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Pediatric Aggressive Mature B-Cell Lymphomas",url:"https://drive.google.com/file/d/1yyuwB-gFKY6QDI7qLq2aZet3BGTaySaF/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Histiocytic Neoplasms",url:"https://drive.google.com/file/d/1D1fb8oKQ_oCommTeUO5I3umaOKEMl7K6/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Malignant Pleural Mesothelioma",url:"https://drive.google.com/file/d/1_qxWnv3uPQt3PKfURRzNRTTYxHGLAXCb/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Pediatric Central Nervous System Cancers",url:"https://drive.google.com/file/d/1r92sZ-p58dSS5jxNptFoxOFCTLWET_x2/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Uterine Neoplasms",url:"https://drive.google.com/file/d/1KbvaMnQ6ICfsldxHBcnTh-QuqDYyf8wc/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Thyroid Carcinoma",url:"https://drive.google.com/file/d/1zCDiE-CMWgksGeaXPBaBHlv23STb5jM4/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Thymomas and Thymic Carcinomas",url:"https://drive.google.com/file/d/16R9IjzAkb0nyQCqAIjXz2Qcgo3NAWV4X/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Testicular Cancer",url:"https://drive.google.com/file/d/1xsyflE9cWBsHvqnXK36VTkYmryDpOtg1/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"T-Cell Lymphomas",url:"https://drive.google.com/file/d/1hDAlm7vpNwI201gi4An08c5FhWedEQZC/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Pediatric Hodgkin Lymphoma",url:"https://drive.google.com/file/d/1Q2v1kd95AnQ87uesTO8zIgLdtSsB8mKe/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Penile Cancer",url:"https://drive.google.com/file/d/1VA92MoXCsDf4Pv0Heyf8DEN4LVCwj6Id/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Primary Cutaneous Lymphomas",url:"https://drive.google.com/file/d/1VD-oqWWQBAtAUSBhcvqhmeWjbxFOLGB8/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Small Bowel Adenocarcinoma",url:"https://drive.google.com/file/d/1yUsGAwnlre2dEcp5BP-NFdOZeGpss0dv/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Small Cell Lung Cancer",url:"https://drive.google.com/file/d/1NX8hxnupcER7mlu4Qbfwmz3Ogn3FvUeQ/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Soft Tissue Sarcoma",url:"https://drive.google.com/file/d/1hjpPSOpcGS7F6MbG9lDUZigQbo6NLsbg/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Squamous Cell Skin Cancer",url:"https://drive.google.com/file/d/1nnw_bpFKStv-FJVJwDV-feZBd5XGaoq1/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Systemic Light Chain Amyloidosis",url:"https://drive.google.com/file/d/1pMZun0pmoytaGfp7NBZjMmXdiWafMa82/view?usp=sharing"));
    ncnnGuidelines.add(GuidelineCard(title:"Systemic Mastocytosis",url:"https://drive.google.com/file/d/1fEk8RFdMVO6yzjbn1rThF-8Ho0VfS8gk/view?usp=sharing"));

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