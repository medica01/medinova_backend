
class doctor_details {
  int? id;
  String? doctorName;
  String? specialty;
  int? service;
  String? language;
  String? doctorImage;
  String? qualification;
  String? bio;
  int? regNo;
  String? doctorLocation;

  doctor_details(
      {this.id,
        this.doctorName,
        this.specialty,
        this.service,
        this.language,
        this.doctorImage,
        this.qualification,
        this.bio,
        this.regNo,
        this.doctorLocation});

  doctor_details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorName = json['doctor_name'];
    specialty = json['specialty'];
    service = json['service'];
    language = json['language'];
    doctorImage = json['doctor_image'];
    qualification = json['qualification'];
    bio = json['bio'];
    regNo = json['reg_no'];
    doctorLocation = json['doctor_location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_name'] = this.doctorName;
    data['specialty'] = this.specialty;
    data['service'] = this.service;
    data['language'] = this.language;
    data['doctor_image'] = this.doctorImage;
    data['qualification'] = this.qualification;
    data['bio'] = this.bio;
    data['reg_no'] = this.regNo;
    data['doctor_location'] = this.doctorLocation;
    return data;
  }
}
