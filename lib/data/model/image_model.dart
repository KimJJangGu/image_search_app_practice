class Image {
  String imageUrl;
  String tags;

//<editor-fold desc="Data Methods">
  Image({
    required this.imageUrl,
    required this.tags,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Image && runtimeType == other.runtimeType && imageUrl == other.imageUrl && tags == other.tags);

  @override
  int get hashCode => imageUrl.hashCode ^ tags.hashCode;

  @override
  String toString() {
    return 'ImageModel{ imageUrl: $imageUrl, tags: $tags,}';
  }

  Image copyWith({
    String? imageUrl,
    String? tags,
  }) {
    return Image(
      imageUrl: imageUrl ?? this.imageUrl,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'tags': tags,
    };
  }

  factory Image.fromJson(Map<String, dynamic> map) {
    return Image(
      imageUrl: map['imageUrl'] as String,
      tags: map['tags'] as String,
    );
  }

//</editor-fold>
}