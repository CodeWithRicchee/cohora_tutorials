class Tutorials {
  int? id;
  String? buttonName;
  String? buttonIconUrl;
  String? videoUrl;

  Tutorials({this.id, this.buttonName, this.buttonIconUrl, this.videoUrl});

  Tutorials.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    buttonName = json['buttonName'];
    buttonIconUrl = json['buttonIconUrl'];
    videoUrl = json['videoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['buttonName'] = this.buttonName;
    data['buttonIconUrl'] = this.buttonIconUrl;
    data['videoUrl'] = this.videoUrl;
    return data;
  }
}
