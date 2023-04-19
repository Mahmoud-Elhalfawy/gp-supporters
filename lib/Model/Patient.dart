class Patient{

  String? name;
  String? hCode;
  String? gender="female";
  String? age;
  String? height;
  String? weight;
  String? coa;
  String? surgicalHx;
  String? medHx;
  String? drugHx;
  String? allergy;
  String? workingUpDiagnosis;
  String? physicalAssesment;
  String? admDate;


  void cloneData(Map<String,dynamic> data){


    name=data['name'];
    hCode=data['hCode'];
    gender=data['gender'];
    height=data['height'];
    age=data['age'];
    weight=data['weight'];
    coa=data['coa'];
    surgicalHx=data['surgicalHx'];
    medHx=data['medHx'];
    drugHx=data['drugHx'];
    allergy=data['allergy'];
    workingUpDiagnosis=data['workingUpDiagnosis'];
    physicalAssesment=data['physicalAssessment'];
    admDate=data['admDate'];

  }

  Map<String,dynamic>  originateData(){
    Map<String,dynamic> data={};
    data['name']=name;
    data['hCode']=hCode;
    data['gender']=gender;
    data['height']=height;
    data['age']=age;
    data['weight']=weight;
    data['coa']=coa;
    data['surgicalHx']=surgicalHx;
    data['medHx']=medHx;
    data['drugHx']=drugHx;
    data['allergy']=allergy;
    data['workingUpDiagnosis']=workingUpDiagnosis;
    data['physicalAssessment']=physicalAssesment;
    data['admDate']=admDate;

    return data;
  }
}