class DummyData {
  String? body;
  String? category;
  int? contact;
  String? disease;
  int? id;
  String? incomegroup;
  String? link;
  int? maxage;
  int? minage;
  String? moneybygov;
  String? name;
  String? year;

  DummyData(
      {this.body,
      this.category,
      this.contact,
      this.disease,
      this.id,
      this.incomegroup,
      this.link,
      this.maxage,
      this.minage,
      this.moneybygov,
      this.name,
      this.year});

  DummyData.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    category = json['category'];
    contact = json['contact'];
    disease = json['disease'];
    id = json['id'];
    incomegroup = json['incomegroup'];
    link = json['link'];
    maxage = json['maxage'];
    minage = json['minage'];
    moneybygov = json['moneybygov'];
    name = json['name'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['category'] = this.category;
    data['contact'] = this.contact;
    data['disease'] = this.disease;
    data['id'] = this.id;
    data['incomegroup'] = this.incomegroup;
    data['link'] = this.link;
    data['maxage'] = this.maxage;
    data['minage'] = this.minage;
    data['moneybygov'] = this.moneybygov;
    data['name'] = this.name;
    data['year'] = this.year;
    return data;
  }
}
