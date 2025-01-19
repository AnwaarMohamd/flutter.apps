class Post {
  String name;
  String image;

  Post({
    // required this.id,
    required this.name,
    required this.image,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      name: json['name'], // الوصول إلى الحقل label داخل result
      image: json['image'], // الوصول إلى الحقل label داخل result
    );
  }
}
