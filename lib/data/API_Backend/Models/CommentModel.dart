// ignore_for_file: file_names, non_constant_identifier_names, camel_case_types

class Comments {
  final int id;
  final int is_reply;
  final String comment;
  final String created_at;
  final childwriter writer;
  final childlinkes links;


  Comments({required this.created_at,required this.id,required this.is_reply,required this.comment,required this.writer,required this.links});

  factory Comments.fromjson(Map<String,dynamic> json) =>
      Comments(

        id: json['id'] ,
        comment: json['comment'],
        is_reply: json['is_reply'] ,
        created_at: json['created_at'],
        writer: childwriter.fromjson(json['writer']) ,
        links:childlinkes.fromjson(json['links'])
      );
}

class childwriter{
    final int writer_id;
    final String writer_name;
    final String profile_picture;

    childwriter({required this.writer_id,required this.writer_name,required this.profile_picture});

    factory childwriter.fromjson(Map<String,dynamic> json) =>
        childwriter(
          writer_id: json['writer_id'],
          writer_name: json['writer_name'],
          profile_picture: json['profile_picture']
        );
}

class childlinkes{
  final String comments;
  final String report;
  final String reply;
  final String update;
  final String delete;

  childlinkes({required this.update,required  this.delete, required this.comments,required this.report,required this.reply});

  factory childlinkes.fromjson(Map<String,dynamic> json) =>
      childlinkes(
       comments: json['comments'],
        delete:json['delete'] ,
        reply:json['reply'] ,
        report: json['report'],
        update: json['update'],
      );
}