import 'package:education/core/models/image_model.dart';

class CategoryModel {
  //<editor-fold desc="Data Methods">

  CategoryModel({
    this.id,
    this.name,
    this.slug,
    this.parent,
    this.description,
    this.display,
    this.image,
    this.menu_order,
    this.count,
  });
  int? id;
  String? name;
  String? slug;
  int? parent;
  String? description;
  String? display;
  ImageModel? image;
  int? menu_order;
  int? count;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          slug == other.slug &&
          parent == other.parent &&
          description == other.description &&
          display == other.display &&
          image == other.image &&
          menu_order == other.menu_order &&
          count == other.count);

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      slug.hashCode ^
      parent.hashCode ^
      description.hashCode ^
      display.hashCode ^
      image.hashCode ^
      menu_order.hashCode ^
      count.hashCode;

  @override
  String toString() {
    return 'CategoryModel{' +
        ' id: $id,' +
        ' name: $name,' +
        ' slug: $slug,' +
        ' parent: $parent,' +
        ' description: $description,' +
        ' display: $display,' +
        ' image: $image,' +
        ' menu_order: $menu_order,' +
        ' count: $count,' +
        '}';
  }

  CategoryModel copyWith({
    int? id,
    String? name,
    String? slug,
    int? parent,
    String? description,
    String? display,
    ImageModel? image,
    int? menu_order,
    int? count,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      parent: parent ?? this.parent,
      description: description ?? this.description,
      display: display ?? this.display,
      image: image ?? this.image,
      menu_order: menu_order ?? this.menu_order,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'slug': this.slug,
      'parent': this.parent,
      'description': this.description,
      'display': this.display,
      'image': this.image,
      'menu_order': this.menu_order,
      'count': this.count,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] ,
      name: map['name'] ,
      slug: map['slug'] ,
      parent: map['parent'] ,
      description: map['description'],
      display: map['display'] ,
      image:map['image'] != null? ImageModel.fromMap( map['image']):null,
      menu_order: map['menu_order'] ,
      count: map['count'] ,
    );
  }

  //</editor-fold>

}