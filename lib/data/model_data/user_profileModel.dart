class User_ProfileModel {
  int? status;
  String? msg;
  String? description;
  ResponseUser? responseUser;

  User_ProfileModel(
      {this.status, this.msg, this.description, this.responseUser});

  User_ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    description = json['description'];
    responseUser = json['response_user'] != null
        ? ResponseUser.fromJson(json['response_user'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    data['description'] = description;
    if (responseUser != null) {
      data['response_user'] = responseUser!.toJson();
    }
    return data;
  }
}

class ResponseUser {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? imageFullPath;
  String? businessName;
  String? businessType;
  int? businessTypeId;
  String? branch;
  int? companyId;
  int? branchId;

  ResponseUser(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.image,
        this.imageFullPath,
        this.businessName,
        this.businessType,
        this.businessTypeId,
        this.branch,
        this.companyId,
        this.branchId});

  ResponseUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    imageFullPath = json['image_full_path'];
    businessName = json['business_name'];
    businessType = json['business_type'];
    businessTypeId = json['business_type_id'];
    branch = json['branch'];
    companyId = json['company_id'];
    branchId = json['branch_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    data['image_full_path'] = imageFullPath;
    data['business_name'] = businessName;
    data['business_type'] = businessType;
    data['business_type_id'] = businessTypeId;
    data['branch'] = branch;
    data['company_id'] = companyId;
    data['branch_id'] = branchId;
    return data;
  }
}
