class ProfileModel {
  int? id;
  String? name;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? profilePicture;

//<editor-fold desc="Data Methods">
  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.profilePicture,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          phoneNumber == other.phoneNumber &&
          profilePicture == other.profilePicture);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      phoneNumber.hashCode ^
      profilePicture.hashCode;

  @override
  String toString() {
    return 'ProfileModel{' +
        ' id: $id,' +
        ' name: $name,' +
        ' email: $email,' +
        ' firstName: $firstName,' +
        ' lastName: $lastName,' +
        ' phoneNumber: $phoneNumber,' +
        ' profilePicture: $profilePicture,' +
        '}';
  }

  ProfileModel copyWith({
    int? id,
    String? name,
    String? email,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? profilePicture,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'first_name': this.firstName,
      'last_name': this.lastName,
      'phone_number': this.phoneNumber,
      'profile_image': this.profilePicture,
    };
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      phoneNumber: map['phone_number'] as String,
      profilePicture: map['profile_image'] as String,
    );
  }

//</editor-fold>
}
