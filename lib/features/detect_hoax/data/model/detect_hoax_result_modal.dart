class DetectHoaxResultModel {
  String? status;
  RateLimit? rateLimit;
  Result? result;
  String? text;

  DetectHoaxResultModel({this.status, this.rateLimit, this.result, this.text});

  DetectHoaxResultModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    rateLimit = json['rateLimit'] != null
        ? new RateLimit.fromJson(json['rateLimit'])
        : null;
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.rateLimit != null) {
      data['rateLimit'] = this.rateLimit!.toJson();
    }
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['text'] = this.text;
    return data;
  }
}

class RateLimit {
  String? limit;
  String? remaining;
  String? resetIn;

  RateLimit({this.limit, this.remaining, this.resetIn});

  RateLimit.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    remaining = json['remaining'];
    resetIn = json['resetIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['remaining'] = this.remaining;
    data['resetIn'] = this.resetIn;
    return data;
  }
}

class Result {
  String? prediction;
  String? text;

  Result({this.prediction, this.text});

  Result.fromJson(Map<String, dynamic> json) {
    prediction = json['prediction'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prediction'] = this.prediction;
    data['text'] = this.text;
    return data;
  }
}
