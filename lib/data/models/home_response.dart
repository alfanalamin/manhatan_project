class HomeResponse {
  List<Slider>? slider;
  List<Article>? article;
  List<Testimoni>? testimoni;

  HomeResponse({this.slider, this.article, this.testimoni});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = <Slider>[];
      json['slider'].forEach((v) {
        slider!.add(Slider.fromJson(v));
      });
    }
    if (json['article'] != null) {
      article = <Article>[];
      json['article'].forEach((v) {
        article!.add(Article.fromJson(v));
      });
    }
    if (json['testimoni'] != null) {
      testimoni = <Testimoni>[];
      json['testimoni'].forEach((v) {
        testimoni!.add(Testimoni.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (slider != null) {
      data['slider'] = slider!.map((v) => v.toJson()).toList();
    }
    if (article != null) {
      data['article'] = article!.map((v) => v.toJson()).toList();
    }
    if (testimoni != null) {
      data['testimoni'] = testimoni!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slider {
  int? id;
  String? name;
  String? url;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? imagedir;
  String? urlupdate;
  String? urldelete;

  Slider(
      {this.id,
      this.name,
      this.url,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.imagedir,
      this.urlupdate,
      this.urldelete});

  Slider.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagedir = json['imagedir'];
    urlupdate = json['urlupdate'];
    urldelete = json['urldelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['url'] = url;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['imagedir'] = imagedir;
    data['urlupdate'] = urlupdate;
    data['urldelete'] = urldelete;
    return data;
  }
}

class Article {
  int? id;
  String? idCategory;
  String? name;
  String? nameEn;
  String? description;
  String? descriptionEn;
  String? image;
  String? view;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? imagedir;
  String? url;
  String? urlupdate;
  String? urldelete;
  String? tgl;
  String? notag;
  String? notagEn;
  List<Tags>? tags;

  Article(
      {this.id,
      this.idCategory,
      this.name,
      this.nameEn,
      this.description,
      this.descriptionEn,
      this.image,
      this.view,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.imagedir,
      this.url,
      this.urlupdate,
      this.urldelete,
      this.tgl,
      this.notag,
      this.notagEn,
      this.tags});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idCategory = json['id_category'];
    name = json['name'];
    nameEn = json['name_en'];
    description = json['description'];
    descriptionEn = json['description_en'];
    image = json['image'];
    view = json['view'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagedir = json['imagedir'];
    url = json['url'];
    urlupdate = json['urlupdate'];
    urldelete = json['urldelete'];
    tgl = json['tgl'];
    notag = json['notag'];
    notagEn = json['notag_en'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_category'] = idCategory;
    data['name'] = name;
    data['name_en'] = nameEn;
    data['description'] = description;
    data['description_en'] = descriptionEn;
    data['image'] = image;
    data['view'] = view;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['imagedir'] = imagedir;
    data['url'] = url;
    data['urlupdate'] = urlupdate;
    data['urldelete'] = urldelete;
    data['tgl'] = tgl;
    data['notag'] = notag;
    data['notag_en'] = notagEn;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tags {
  int? id;
  String? idTag;
  String? idBlog;
  String? createdAt;
  String? updatedAt;
  Tag? tag;

  Tags(
      {this.id,
      this.idTag,
      this.idBlog,
      this.createdAt,
      this.updatedAt,
      this.tag});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idTag = json['id_tag'];
    idBlog = json['id_blog'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    tag = json['tag'] != null ? Tag.fromJson(json['tag']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_tag'] = idTag;
    data['id_blog'] = idBlog;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (tag != null) {
      data['tag'] = tag!.toJson();
    }
    return data;
  }
}

class Tag {
  int? id;
  String? name;
  String? nameEn;
  String? description;
  String? descriptionEn;
  String? createdAt;
  String? updatedAt;
  String? url;
  String? urlupdate;
  String? urldelete;

  Tag(
      {this.id,
      this.name,
      this.nameEn,
      this.description,
      this.descriptionEn,
      this.createdAt,
      this.updatedAt,
      this.url,
      this.urlupdate,
      this.urldelete});

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
    description = json['description'];
    descriptionEn = json['description_en'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    url = json['url'];
    urlupdate = json['urlupdate'];
    urldelete = json['urldelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_en'] = nameEn;
    data['description'] = description;
    data['description_en'] = descriptionEn;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['url'] = url;
    data['urlupdate'] = urlupdate;
    data['urldelete'] = urldelete;
    return data;
  }
}

class Testimoni {
  int? id;
  String? name;
  String? nameEn;
  String? description;
  String? descriptionEn;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? imagedir;
  String? url;
  String? urlupdate;
  String? urldelete;

  Testimoni(
      {this.id,
      this.name,
      this.nameEn,
      this.description,
      this.descriptionEn,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.imagedir,
      this.url,
      this.urlupdate,
      this.urldelete});

  Testimoni.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
    description = json['description'];
    descriptionEn = json['description_en'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imagedir = json['imagedir'];
    url = json['url'];
    urlupdate = json['urlupdate'];
    urldelete = json['urldelete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['name_en'] = nameEn;
    data['description'] = description;
    data['description_en'] = descriptionEn;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['imagedir'] = imagedir;
    data['url'] = url;
    data['urlupdate'] = urlupdate;
    data['urldelete'] = urldelete;
    return data;
  }
}
