import 'package:education/core/models/image_model.dart';

class CategoryModel {
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
    this.link,
    this.taxonomy,
    this.thumbnailUrl,
    this.links,
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
  String? link; // New field
  String? taxonomy; // New field
  String? thumbnailUrl; // New field
  Map<String, dynamic>? links; // New field for _links

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
              count == other.count &&
              link == other.link &&
              taxonomy == other.taxonomy &&
              thumbnailUrl == other.thumbnailUrl &&
              links == other.links);

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
      count.hashCode ^
      link.hashCode ^
      taxonomy.hashCode ^
      thumbnailUrl.hashCode ^
      links.hashCode;

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
        ' link: $link,' +
        ' taxonomy: $taxonomy,' +
        ' thumbnailUrl: $thumbnailUrl,' +
        ' links: $links,' +
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
    String? link,
    String? taxonomy,
    String? thumbnailUrl,
    Map<String, dynamic>? links,
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
      link: link ?? this.link,
      taxonomy: taxonomy ?? this.taxonomy,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      links: links ?? this.links,
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
      'image': this.image?.toMap(),
      'menu_order': this.menu_order,
      'count': this.count,
      'link': this.link,
      'taxonomy': this.taxonomy,
      'thumbnail_url': this.thumbnailUrl,
      '_links': this.links,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      name: map['name'],
      slug: map['slug'],
      parent: map['parent'],
      description: map['description'],
      display: map['display'],
      image: map['image'] != null ? ImageModel.fromMap(map['image']) : null,
      menu_order: map['menu_order'],
      count: map['count'],
      link: map['link'],
      taxonomy: map['taxonomy'],
      thumbnailUrl: map['thumbnail_url'],
      links: map['_links'],
    );
  }
}