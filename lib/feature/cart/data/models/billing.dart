class Billing {
  String? firstName;
  String? lastName;
  String? address1;

  String? city;
  String? state;
  String? postcode;
  String? country;
  String? email;
  String? phone;

  Billing( 
      {this.firstName,
        this.lastName,
        this.address1,

        this.city,
        this.state="",
        this.postcode,
        this.country,
        this.email,
        this.phone});

  Billing.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    address1 = json['address_1'];

    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country']??"egypt";
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName??'';
    data['address_1'] = this.address1;

    data['city'] = this.city;
    data['state'] = this.state??"";
    data['postcode'] = this.postcode;
    data['country'] = this.country??"egypt";
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}