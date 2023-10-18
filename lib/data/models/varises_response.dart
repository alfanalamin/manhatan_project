class VarisesResponse {
  List<Varises>? varises;

  VarisesResponse({
    required this.varises,
  });

  VarisesResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      varises = <Varises>[];
      json['data'].forEach((v) {
        varises!.add(Varises.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (varises != null) {
      data['data'] = varises!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Varises { 
  int? id;
  String? name;
  String? nameEn;
  String? image;
  String? descriptionSort;
  String? descriptionSortEn;
  String? description;
  String? descriptionEn;
  String? view;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? imagedir;
  String? url;
  String? urlupdate;
  String? urldelete;
  String? tgl;
  String? notag;
  String? notagEn;

  Varises({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.image,
    required this.descriptionSort,
    required this.descriptionSortEn,
    required this.description,
    required this.descriptionEn,
    required this.view,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.imagedir,
    required this.url,
    required this.urlupdate,
    required this.urldelete,
    required this.tgl,
    required this.notag,
    required this.notagEn,
  });

  Varises.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['nameEn'];
    image = json['image'];
    descriptionSort = json['descriptionSort'];
    descriptionSortEn = json['descriptionSortEn'];
    description = json['description'];
    descriptionEn = json['descriptionEn'];
    view = json['view'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    imagedir = json['imagedir'];
    url = json['url'];
    urlupdate = json['urlupdate'];
    urldelete = json['urldelete'];
    tgl = json['tgl'];
    notag = json['notag'];
    notagEn = json['notagEn'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'nameEn': nameEn,
        'image': image,
        'descriptionSort': descriptionSort,
        'descriptionSortEn': descriptionSortEn,
        'description': description,
        'descriptionEn': descriptionEn,
        'view': view,
        'status': status,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'imagedir': imagedir,
        'url': url,
        'urlupdate': urlupdate,
        'urldelete': urldelete,
        'tgl': tgl,
        'notag': notag,
        'notagEn': notagEn,
      };
}
