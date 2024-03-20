// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

SendDataRating welcomeFromJson(String str) => SendDataRating.fromJson(json.decode(str));

String welcomeToJson(SendDataRating data) => json.encode(data.toJson());

class SendDataRating {
  List<Datum> data;
  Links links;
  Meta meta;

  SendDataRating({
    required this.data,
    required this.links,
    required this.meta,
  });

  factory SendDataRating.fromJson(Map<String, dynamic> json) => SendDataRating(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class Datum {
  int id;
  Writer writer;
  int isReply;
  String comment;
  Linkes linkes;
  String createdAt;
  int rate;

  Datum({
    required this.id,
    required this.writer,
    required this.isReply,
    required this.comment,
    required this.linkes,
    required this.createdAt,
    required this.rate
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    writer: Writer.fromJson(json["writer"]),
    isReply: json["is_reply"],
    comment: json["comment"],
    linkes: Linkes.fromJson(json["linkes"]),
    createdAt: json["created_at"],
    rate: json['rate']
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "writer": writer.toJson(),
    "is_reply": isReply,
    "comment": comment,
    "linkes": linkes.toJson(),
    "created_at": createdAt,
    "rate":rate.round()
  };
}

class Linkes {
  String comments;
  String report;
  String reply;
  String update;
  String delete;

  Linkes({
    required this.comments,
    required this.report,
    required this.reply,
    required this.update,
    required this.delete,
  });

  factory Linkes.fromJson(Map<String, dynamic> json) => Linkes(
    comments: json["comments"],
    report: json["report"],
    reply: json["reply"],
    update: json["update"],
    delete: json["delete"],
  );

  Map<String, dynamic> toJson() => {
    "comments": comments,
    "report": report,
    "reply": reply,
    "update": update,
    "delete": delete,
  };
}

class Writer {
  int writerId;
  String writerName;
  String profilePicture;

  Writer({
    required this.writerId,
    required this.writerName,
    required this.profilePicture,
  });

  factory Writer.fromJson(Map<String, dynamic> json) => Writer(
    writerId: json["writer_id"],
    writerName: json["writer_name"],
    profilePicture: json["profile_picture"],
  );

  Map<String, dynamic> toJson() => {
    "writer_id": writerId,
    "writer_name": writerName,
    "profile_picture": profilePicture,
  };
}

class Links {
  String first;
  String last;
  dynamic prev;
  String next;

  Links({
    required this.first,
    required this.last,
    this.prev,
    required this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
