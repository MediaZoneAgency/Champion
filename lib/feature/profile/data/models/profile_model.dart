class ProfileModel {
  int? id;
  String? name;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? profilePicture;
  String? url;
  String? description;
  String? link;
  String? slug;
  Map<String, String>? avatarUrls;
  Map<String, dynamic>? meta;
  List<dynamic>? acf;
  Map<String, dynamic>? mppAvatar;
  bool? isSuperAdmin;
  Map<String, dynamic>? woocommerceMeta;
  String? elementorIntroduction;
  Map<String, dynamic>? links;

  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.profilePicture,
    this.url,
    this.description,
    this.link,
    this.slug,
    this.avatarUrls,
    this.meta,
    this.acf,
    this.mppAvatar,
    this.isSuperAdmin,
    this.woocommerceMeta,
    this.elementorIntroduction,
    this.links,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] as int?,
      name: map['name'] as String?,
      email: map['email'] as String?,
      firstName: map['first_name'] as String?,
      lastName: map['last_name'] as String?,
      phoneNumber: map['phone_number'] as String?,
      profilePicture: map['profile_picture'] as String?,
      url: map['url'] as String?,
      description: map['description'] as String?,
      link: map['link'] as String?,
      slug: map['slug'] as String?,
      avatarUrls: (map['avatar_urls'] is Map)
          ? (map['avatar_urls'] as Map).map((key, value) => MapEntry(key.toString(), value.toString()))
          : null,
      meta: map['meta'] is Map<String, dynamic> ? Map<String, dynamic>.from(map['meta']) : {},
      acf: map['acf'] is List<dynamic> ? List<dynamic>.from(map['acf']) : [],
      mppAvatar: map['mpp_avatar'] is Map<String, dynamic>
          ? Map<String, dynamic>.from(map['mpp_avatar'])
          : {},
      isSuperAdmin: map['is_super_admin'] as bool?,
      woocommerceMeta: map['woocommerce_meta'] is Map<String, dynamic>
          ? Map<String, dynamic>.from(map['woocommerce_meta'])
          : {},
      elementorIntroduction: map['elementor_introduction']?.toString() ?? "",
      links: map['_links'] is Map<String, dynamic> ? Map<String, dynamic>.from(map['_links']) : {},
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'profile_picture': profilePicture,
      'url': url,
      'description': description,
      'link': link,
      'slug': slug,
      'avatar_urls': avatarUrls,
      'meta': meta,
      'acf': acf,
      'mpp_avatar': mppAvatar,
      'is_super_admin': isSuperAdmin,
      'woocommerce_meta': woocommerceMeta,
      'elementor_introduction': elementorIntroduction,
      '_links': links,
    };
  }
}
