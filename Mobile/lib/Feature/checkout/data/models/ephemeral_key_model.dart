class EphemeralkeyModel {
  String? id;
  String? object;
  List<AssociatedObjects>? associatedObjects;
  int? created;
  int? expires;
  bool? livemode;
  String? secret;

  EphemeralkeyModel(
      {this.id,
      this.object,
      this.associatedObjects,
      this.created,
      this.expires,
      this.livemode,
      this.secret});

  EphemeralkeyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    object = json['object'];
    if (json['associated_objects'] != null) {
      associatedObjects = <AssociatedObjects>[];
      json['associated_objects'].forEach((v) {
        associatedObjects!.add(AssociatedObjects.fromJson(v));
      });
    }
    created = json['created'];
    expires = json['expires'];
    livemode = json['livemode'];
    secret = json['secret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['object'] = object;
    if (associatedObjects != null) {
      data['associated_objects'] =
          associatedObjects!.map((v) => v.toJson()).toList();
    }
    data['created'] = created;
    data['expires'] = expires;
    data['livemode'] = livemode;
    data['secret'] = secret;
    return data;
  }
}

class AssociatedObjects {
  String? id;
  String? type;

  AssociatedObjects({this.id, this.type});

  AssociatedObjects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    return data;
  }
}
