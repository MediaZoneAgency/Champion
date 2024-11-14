class ProfileModel {
  //<editor-fold desc="Data Methods">

  ProfileModel({
    this.id,
    this.name,
    this.avatar,
    this.courses,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          avatar == other.avatar &&
          courses == other.courses &&
          email == other.email &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          phoneNumber == other.phoneNumber);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      avatar.hashCode ^
      courses.hashCode ^
      email.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      phoneNumber.hashCode;

  @override
  String toString() {
    return 'ProfileModel{' +
        ' id: $id,' +
        ' name: $name,' +
        ' avatar: $avatar,' +
        ' courses: $courses,' +
        ' email: $email,' +
        ' firstName: $firstName,' +
        ' lastName: $lastName,' +
        ' phoneNumber: $phoneNumber,' +
        '}';
  }

  ProfileModel copyWith({
    int? id,
    String? name,
    String? avatar,
    int? courses,
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      courses: courses ?? this.courses,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'avatar': this.avatar,
      'courses': this.courses,
      'email': this.email,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'phoneNumber': this.phoneNumber,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] ,
      name: map['name'] ,
      avatar: map['avatar'] ,
      courses: map['courses'] ,
      email: map['email'],
      firstName: map['firstName'] ,
      lastName: map['lastName'] ,
      phoneNumber: map['phoneNumber'] ,
    );
  }

  //</editor-fold>
  int? id;
  String? name;
  String? avatar;
  int? courses;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;}