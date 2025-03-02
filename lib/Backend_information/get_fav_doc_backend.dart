class get_fav_doc {
  int? id;
  int? phoneNumber;
  bool? like;
  String? doctorName;
  int? doctorPhoneNo;
  String? specialty;
  int? service;
  String? language;
  String? doctorImage;
  String? qualification;
  String? bio;
  int? regNo;
  String? doctorLocation;
  int? doctor;

  get_fav_doc(
      {this.id,
        this.phoneNumber,
        this.like,
        this.doctorName,
        this.doctorPhoneNo,
        this.specialty,
        this.service,
        this.language,
        this.doctorImage,
        this.qualification,
        this.bio,
        this.regNo,
        this.doctorLocation,
        this.doctor});

  get_fav_doc.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber = json['phone_number'];
    like = json['like'];
    doctorName = json['doctor_name'];
    doctorPhoneNo = json['doctor_phone_no'];
    specialty = json['specialty'];
    service = json['service'];
    language = json['language'];
    doctorImage = json['doctor_image'];
    qualification = json['qualification'];
    bio = json['bio'];
    regNo = json['reg_no'];
    doctorLocation = json['doctor_location'];
    doctor = json['doctor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number'] = this.phoneNumber;
    data['like'] = this.like;
    data['doctor_name'] = this.doctorName;
    data['doctor_phone_no'] = this.doctorPhoneNo;
    data['specialty'] = this.specialty;
    data['service'] = this.service;
    data['language'] = this.language;
    data['doctor_image'] = this.doctorImage;
    data['qualification'] = this.qualification;
    data['bio'] = this.bio;
    data['reg_no'] = this.regNo;
    data['doctor_location'] = this.doctorLocation;
    data['doctor'] = this.doctor;
    return data;
  }
}
