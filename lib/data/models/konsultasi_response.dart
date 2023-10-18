class KonsultasiResponse {
  bool? auth;
  String? msg;

  KonsultasiResponse({
    this.auth,
    this.msg,
  });

  KonsultasiResponse.fromJson(Map<String, dynamic> json) {
    auth = json['auth'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['auth'] = auth;
    data['msg'] = msg;
    return data;
  }
}

class About {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? whatsapp;
  String? bbm;
  String? contact;
  String? address;
  String? video;
  String? opentime;
  String? postalcode;
  String? gmap;
  String? gmapQuery;
  String? description;
  String? descriptionEn;
  String? logo;
  String? logoWhite;
  String? logoGrayscale;
  String? icon;
  String? filePricelist;
  String? status;
  String? closeMessage;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? urlupdate;
  String? actionBbm;
  String? actionSms;
  String? actionWhatsapp;
  String? actionEmail;
  String? actionCall;
  String? logodir;
  String? icondir;
  String? logowhitedir;
  String? lat;
  String? long;
  String? urlpricelist;
  String? notag;
  String? notagEn;

  About({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.whatsapp,
    required this.bbm,
    required this.contact,
    required this.address,
    required this.video,
    required this.opentime,
    required this.postalcode,
    required this.gmap,
    required this.gmapQuery,
    required this.description,
    required this.descriptionEn,
    required this.logo,
    required this.logoWhite,
    required this.logoGrayscale,
    required this.icon,
    required this.filePricelist,
    required this.status,
    required this.closeMessage,
    required this.createdAt,
    required this.updatedAt,
    required this.urlupdate,
    required this.actionBbm,
    required this.actionSms,
    required this.actionWhatsapp,
    required this.actionEmail,
    required this.actionCall,
    required this.logodir,
    required this.icondir,
    required this.logowhitedir,
    required this.lat,
    required this.long,
    required this.urlpricelist,
    required this.notag,
    required this.notagEn,
  });

  factory About.fromJson(Map<String, dynamic> json) => About(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        whatsapp: json["whatsapp"],
        bbm: json["bbm"],
        contact: json["contact"],
        address: json["address"],
        video: json["video"],
        opentime: json["opentime"],
        postalcode: json["postalcode"],
        gmap: json["gmap"],
        gmapQuery: json["gmap_query"],
        description: json["description"],
        descriptionEn: json["description_en"],
        logo: json["logo"],
        logoWhite: json["logo_white"],
        logoGrayscale: json["logo_grayscale"],
        icon: json["icon"],
        filePricelist: json["file_pricelist"],
        status: json["status"],
        closeMessage: json["close_message"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        urlupdate: json["urlupdate"],
        actionBbm: json["actionBbm"],
        actionSms: json["actionSms"],
        actionWhatsapp: json["actionWhatsapp"],
        actionEmail: json["actionEmail"],
        actionCall: json["actionCall"],
        logodir: json["logodir"],
        icondir: json["icondir"],
        logowhitedir: json["logowhitedir"],
        lat: json["lat"],
        long: json["long"],
        urlpricelist: json["urlpricelist"],
        notag: json["notag"],
        notagEn: json["notag_en"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "whatsapp": whatsapp,
        "bbm": bbm,
        "contact": contact,
        "address": address,
        "video": video,
        "opentime": opentime,
        "postalcode": postalcode,
        "gmap": gmap,
        "gmap_query": gmapQuery,
        "description": description,
        "description_en": descriptionEn,
        "logo": logo,
        "logo_white": logoWhite,
        "logo_grayscale": logoGrayscale,
        "icon": icon,
        "file_pricelist": filePricelist,
        "status": status,
        "close_message": closeMessage,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "urlupdate": urlupdate,
        "actionBbm": actionBbm,
        "actionSms": actionSms,
        "actionWhatsapp": actionWhatsapp,
        "actionEmail": actionEmail,
        "actionCall": actionCall,
        "logodir": logodir,
        "icondir": icondir,
        "logowhitedir": logowhitedir,
        "lat": lat,
        "long": long,
        "urlpricelist": urlpricelist,
        "notag": notag,
        "notag_en": notagEn,
      };
}
