class FileUploadResponse{
  final String originalname;
  final String fileName;
  final String location;
  
  FileUploadResponse({required this.originalname, required this.fileName, required this.location});

  factory FileUploadResponse.fromMap(Map<String, dynamic> map){
    return FileUploadResponse(
      originalname: map['originalname'] ?? '',
      fileName: map['fileName'] ?? '',
      location: map['location'] ?? '');
  }
}