class VideoListObj {
  final String name;
  final String slv;
  final String type;
  final String firstTime;
  final String repeatTime;
  final String desc;

  VideoListObj(
      {required this.name,
      required this.slv,
      required this.type,
      required this.firstTime,
      required this.repeatTime,
      required this.desc});

  factory VideoListObj.fromJson(Map<String, dynamic> json) {
    return VideoListObj(
        name: json['name'],
        slv: json['slv'],
        type: json["type"],
        firstTime: json['first_time'],
        repeatTime: json['repeat_time'],
        desc: json['desc']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slv'] = this.slv;
    data['type'] = this.type;
    data['first_time'] = this.firstTime;
    data['repeat_time'] = this.repeatTime;
    data['desc'] = this.desc;
    return data;
  }
}
