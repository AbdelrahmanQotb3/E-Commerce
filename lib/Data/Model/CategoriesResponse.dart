class CategoriesResponse {
  CategoriesResponse({
    required num results,
    required Metadata metadata,
    required List<CategoriesData> data,
  })  : _results = results,
        _metadata = metadata,
        _data = data;

  CategoriesResponse.fromJson(Map<String, dynamic> json)
      : _results = json['results'],
        _metadata = json['metadata'] != null
            ? Metadata.fromJson(json['metadata'])
            : Metadata(currentPage: 1, numberOfPages: 1, limit: 40),
        _data = (json['data'] as List)
            .map((v) => CategoriesData.fromJson(v))
            .toList();

  final num _results;
  final Metadata _metadata;
  final List<CategoriesData> _data;

  CategoriesResponse copyWith({
    num? results,
    Metadata? metadata,
    List<CategoriesData>? data,
  }) =>
      CategoriesResponse(
        results: results ?? _results,
        metadata: metadata ?? _metadata,
        data: data ?? _data,
      );

  num get results => _results;
  Metadata get metadata => _metadata;
  List<CategoriesData> get data => _data;

  Map<String, dynamic> toJson() {
    return {
      'results': _results,
      'metadata': _metadata.toJson(),
      'data': _data.map((v) => v.toJson()).toList(),
    };
  }
}

class CategoriesData {
  CategoriesData({
    required String id,
    required String name,
    required String slug,
    required String image,
    required String createdAt,
    required String updatedAt,
  })  : _id = id,
        _name = name,
        _slug = slug,
        _image = image,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

  CategoriesData.fromJson(Map<String, dynamic> json)
      : _id = json['_id'],
        _name = json['name'],
        _slug = json['slug'],
        _image = json['image'],
        _createdAt = json['createdAt'],
        _updatedAt = json['updatedAt'];

  final String _id;
  final String _name;
  final String _slug;
  final String _image;
  final String _createdAt;
  final String _updatedAt;

  CategoriesData copyWith({
    String? id,
    String? name,
    String? slug,
    String? image,
    String? createdAt,
    String? updatedAt,
  }) =>
      CategoriesData(
        id: id ?? _id,
        name: name ?? _name,
        slug: slug ?? _slug,
        image: image ?? _image,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  String get id => _id;
  String get name => _name;
  String get slug => _slug;
  String get image => _image;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    return {
      '_id': _id,
      'name': _name,
      'slug': _slug,
      'image': _image,
      'createdAt': _createdAt,
      'updatedAt': _updatedAt,
    };
  }
}

class Metadata {
  Metadata({
    required num currentPage,
    required num numberOfPages,
    required num limit,
  })  : _currentPage = currentPage,
        _numberOfPages = numberOfPages,
        _limit = limit;

  Metadata.fromJson(Map<String, dynamic> json)
      : _currentPage = json['currentPage'],
        _numberOfPages = json['numberOfPages'],
        _limit = json['limit'];

  final num _currentPage;
  final num _numberOfPages;
  final num _limit;

  Metadata copyWith({
    num? currentPage,
    num? numberOfPages,
    num? limit,
  }) =>
      Metadata(
        currentPage: currentPage ?? _currentPage,
        numberOfPages: numberOfPages ?? _numberOfPages,
        limit: limit ?? _limit,
      );

  num get currentPage => _currentPage;
  num get numberOfPages => _numberOfPages;
  num get limit => _limit;

  Map<String, dynamic> toJson() {
    return {
      'currentPage': _currentPage,
      'numberOfPages': _numberOfPages,
      'limit': _limit,
    };
  }
}
