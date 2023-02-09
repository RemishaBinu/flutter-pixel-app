class FileModel {
  String? fileName;
  String? url;

  FileModel({this.fileName, this.url});

  factory FileModel.fromMap(Map<String, dynamic> json){
    return FileModel(
      fileName: json['fileName'] ?? '',
      url: json['url'] ?? ''
    );
  }

  Map<String, dynamic> toMap(){
    return {'fileName': fileName, 
    'url': url};
  }

}
