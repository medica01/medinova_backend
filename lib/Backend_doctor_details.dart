class doctor_details {
  int? id;
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
  bool? like;

  doctor_details(
      {this.id,
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
        this.like});

  doctor_details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    like = json['like'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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
    data['like'] = this.like;
    return data;
  }
}

