import 'dart:convert';
News newsFromJson(String str) => News.fromJson(json.decode(str));
String newsToJson(News data) => json.encode(data.toJson());
class News {
  News({
      this.data,});

  News.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? data;
News copyWith({  List<Data>? data,
}) => News(  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.id, 
      this.pictureUrl,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    pictureUrl = json['picture_url'];
  }
  String? id;
  String? pictureUrl;
Data copyWith({  String? id,
  String? pictureUrl,
}) => Data(  id: id ?? this.id,
  pictureUrl: pictureUrl ?? this.pictureUrl,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['picture_url'] = pictureUrl;
    return map;
  }

}