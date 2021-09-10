class RegisteredSouls {
  String? _id;
  String? fullname;
  String? email;
  String? address;
  String? phoneNumber;
  String? occupation;

  RegisteredSouls({
    this.fullname,
    this.email,
    this.address,
    this.phoneNumber,
    this.occupation,
  }); 

  set id(id) {
     this.id = id;
  }

  RegisteredSouls.fromJson(Map<String, dynamic> json) {
    id = json['timestamp'];
    fullname = json['FullName'];
    email = json['E-mail'];
    address = json['Address'];
    phoneNumber = json['PhoneNumber'];
    occupation = json['Occupation'];
  }
}
