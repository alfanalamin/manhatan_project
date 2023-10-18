class GaleryResponse {
  List<Galery>? galery;

  GaleryResponse({
    required this.galery,
  });

  GaleryResponse.fromJson(Map<String, dynamic> json) {
    if (json['gallery'] != null) {
      galery = <Galery>[];
      json['gallery'].forEach((v) {
        galery!.add(Galery.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (galery != null) {
      data['gallery'] = galery!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Galery {
  int? id;
  String? nameEn;
  String? name;
  String? description;
  String? descriptionEn;
  String? type;
  String? image;
  dynamic video;
  String? view;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? imagedir;
  String? videodir;
  String? url;
  String? urlupdate;
  String? urldelete;

  Galery({
    required this.id,
    required this.nameEn,
    required this.name,
    required this.description,
    required this.descriptionEn,
    required this.type,
    required this.image,
    required this.video,
    required this.view,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.imagedir,
    required this.videodir,
    required this.url,
    required this.urlupdate,
    required this.urldelete,
  });

  factory Galery.fromJson(Map<String, dynamic> json) => Galery(
        id: json["id"],
        nameEn: json["name_en"],
        name: json["name"],
        description: json["description"],
        descriptionEn: json["description_en"],
        type: json["type"],
        image: json["image"],
        video: json["video"],
        view: json["view"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        imagedir: json["imagedir"],
        videodir: json["videodir"],
        url: json["url"],
        urlupdate: json["urlupdate"],
        urldelete: json["urldelete"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_en": nameEn,
        "name": name,
        "description": description,
        "description_en": descriptionEn,
        "type": type,
        "image": image,
        "video": video,
        "view": view,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "imagedir": imagedir,
        "videodir": videodir,
        "url": url,
        "urlupdate": urlupdate,
        "urldelete": urldelete,
      };
}
