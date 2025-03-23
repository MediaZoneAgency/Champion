class TopicModel {
  String? code;
  String? message;
  List<TopicData>? data;

  TopicModel({this.code, this.message, this.data});

  factory TopicModel.fromMap(Map<String, dynamic> map) {
    return TopicModel(
      code: map['code'],
      message: map['message'],
      data: map['data'] != null
          ? List<TopicData>.from(map['data'].map((item) => TopicData.fromMap(item)))
          : [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'message': message,
      'data': data?.map((item) => item.toMap()).toList(),
    };
  }
}

class TopicData {
  String? id;
  String? postTitle;
  String? postContent;
  String? postName;

  TopicData({this.id, this.postTitle, this.postContent, this.postName});

  factory TopicData.fromMap(Map<String, dynamic> map) {
    return TopicData(
      id: map['ID'],
      postTitle: map['post_title'],
      postContent: map['post_content'],
      postName: map['post_name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ID': id,
      'post_title': postTitle,
      'post_content': postContent,
      'post_name': postName,
    };
  }
}
