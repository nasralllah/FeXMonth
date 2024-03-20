

// ignore_for_file: file_names, camel_case_types, non_constant_identifier_names

class products{
  int? id;
  String? name;
  String? catagory;
  String? ImageUrl;
  String? price;
  String? albumID;

  products(
      {this.id,
      this.name,
      this.catagory,
      this.ImageUrl,
      this.price,
      this.albumID
      });

  products.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    albumID = json['albumId'];
    name = json['nametitle'];
    ImageUrl = json['image'];

  }
}
/*
Future<List<products>>Readjasondata()async {

  var headers = {
    'Accept': 'application/vnd.api+json',
    'Content-Type': 'application/vnd.api+json',
    'Authorization': TOkedns
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://10.0.2.2:8000/api/register'));


}*/




