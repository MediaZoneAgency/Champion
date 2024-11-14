class ImageModel {
  //<editor-fold desc="Data Methods">

  ImageModel({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          dateCreated == other.dateCreated &&
          dateCreatedGmt == other.dateCreatedGmt &&
          dateModified == other.dateModified &&
          dateModifiedGmt == other.dateModifiedGmt &&
          src == other.src &&
          name == other.name &&
          alt == other.alt);

  @override
  int get hashCode =>
      id.hashCode ^
      dateCreated.hashCode ^
      dateCreatedGmt.hashCode ^
      dateModified.hashCode ^
      dateModifiedGmt.hashCode ^
      src.hashCode ^
      name.hashCode ^
      alt.hashCode;

  @override
  String toString() {
    return 'ImageModel{' +
        ' id: $id,' +
        ' dateCreated: $dateCreated,' +
        ' dateCreatedGmt: $dateCreatedGmt,' +
        ' dateModified: $dateModified,' +
        ' dateModifiedGmt: $dateModifiedGmt,' +
        ' src: $src,' +
        ' name: $name,' +
        ' alt: $alt,' +
        '}';
  }

  ImageModel copyWith({
    int? id,
    String? dateCreated,
    String? dateCreatedGmt,
    String? dateModified,
    String? dateModifiedGmt,
    String? src,
    String? name,
    String? alt,
  }) {
    return ImageModel(
      id: id ?? this.id,
      dateCreated: dateCreated ?? this.dateCreated,
      dateCreatedGmt: dateCreatedGmt ?? this.dateCreatedGmt,
      dateModified: dateModified ?? this.dateModified,
      dateModifiedGmt: dateModifiedGmt ?? this.dateModifiedGmt,
      src: src ?? this.src,
      name: name ?? this.name,
      alt: alt ?? this.alt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'dateCreated': this.dateCreated,
      'dateCreatedGmt': this.dateCreatedGmt,
      'dateModified': this.dateModified,
      'dateModifiedGmt': this.dateModifiedGmt,
      'src': this.src,
      'name': this.name,
      'alt': this.alt,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'] ,
      dateCreated: map['dateCreated'] ,
      dateCreatedGmt: map['dateCreatedGmt'],
      dateModified: map['dateModified'] ,
      dateModifiedGmt: map['dateModifiedGmt'] ,
      src: map['src'] ,
      name: map['name'] ,
      alt: map['alt'] ,
    );
  }

  //</editor-fold>
  int? id;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;}