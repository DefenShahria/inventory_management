class BranchModel {
  int? status;
  String? msg;
  String? description;
  BranchesPagination? branches;

  BranchModel({this.status, this.msg, this.description, this.branches});

  BranchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    description = json['description'];
    branches = json['branches'] != null
        ? BranchesPagination.fromJson(json['branches'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['msg'] = msg;
    data['description'] = description;
    if (branches != null) {
      data['branches'] = branches!.toJson();
    }
    return data;
  }
}

class BranchesPagination {
  int? perPage;
  int? from;
  int? to;
  int? total;
  int? currentPage;
  int? lastPage;
  String? prevPageUrl;
  String? firstPageUrl;
  String? nextPageUrl;
  String? lastPageUrl;
  List<Branch>? branches;

  BranchesPagination({
    this.perPage,
    this.from,
    this.to,
    this.total,
    this.currentPage,
    this.lastPage,
    this.prevPageUrl,
    this.firstPageUrl,
    this.nextPageUrl,
    this.lastPageUrl,
    this.branches,
  });

  BranchesPagination.fromJson(Map<String, dynamic> json) {
    perPage = json['per_page'];
    from = json['from'];
    to = json['to'];
    total = json['total'];
    currentPage = json['current_page'];
    lastPage = json['last_page'];
    prevPageUrl = json['prev_page_url'];
    firstPageUrl = json['first_page_url'];
    nextPageUrl = json['next_page_url'];
    lastPageUrl = json['last_page_url'];
    if (json['branches'] != null) {
      branches = <Branch>[];
      json['branches'].forEach((v) {
        branches!.add(Branch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['per_page'] = perPage;
    data['from'] = from;
    data['to'] = to;
    data['total'] = total;
    data['current_page'] = currentPage;
    data['last_page'] = lastPage;
    data['prev_page_url'] = prevPageUrl;
    data['first_page_url'] = firstPageUrl;
    data['next_page_url'] = nextPageUrl;
    data['last_page_url'] = lastPageUrl;
    if (branches != null) {
      data['branches'] = branches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Branch {
  int? id;
  String? name;

  Branch({this.id, this.name});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
