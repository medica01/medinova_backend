class booking_doctor {
  int? id;
  String? bookingDate;
  String? bookingTime;
  String? createdAt;
  int? phoneNumber;
  String? doctorName;
  String? specialty;
  int? service;
  String? language;
  String? doctorImage;
  String? qualification;
  String? bio;
  int? regNo;
  String? doctorLocation;
  int? doctor;

  booking_doctor(
      {this.id,
        this.bookingDate,
        this.bookingTime,
        this.createdAt,
        this.phoneNumber,
        this.doctorName,
        this.specialty,
        this.service,
        this.language,
        this.doctorImage,
        this.qualification,
        this.bio,
        this.regNo,
        this.doctorLocation,
        this.doctor});

  booking_doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingDate = json['booking_date'];
    bookingTime = json['booking_time'];
    createdAt = json['created_at'];
    phoneNumber = json['phone_number'];
    doctorName = json['doctor_name'];
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
    data['booking_date'] = this.bookingDate;
    data['booking_time'] = this.bookingTime;
    data['created_at'] = this.createdAt;
    data['phone_number'] = this.phoneNumber;
    data['doctor_name'] = this.doctorName;
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
