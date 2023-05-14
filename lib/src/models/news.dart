

class News{

  int totalResults;
  List<Articles> articles;

  News({
    required this.totalResults,
    required this.articles,
  });

  factory News.fromMap(Map<String,dynamic> json) => News(
    totalResults: json['totalResults'], 
    articles: List<Articles>.from(json['articles'].map((x)=> Articles.fromMap(x)))
  );

  Map<String,dynamic> toMap() => {
    "totalResults":totalResults,
    "articles":List<dynamic>.from(articles.map((x) => x.toMap())),
  };

}

class Articles{
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Articles.fromMap(Map<String,dynamic> json) => Articles(
    source: Source.fromMap(json['source']),
    author: json['author'],
    title: json['title'],
    description: json['description'],
    url: json['url'],
    urlToImage: json['urlToImage'],
    publishedAt: json['publishedAt'],
    content: json['content']
  );

  Map<String,dynamic> toMap() => {
    "source":source,
    "author":author,
    "title":title,
    "description":description,
    "url":url,
    "urlToImage":urlToImage,
    "publishedAt":publishedAt,
    "content":content,
  };
}

class Source{
  String? id;
  String? name;
  Source({
     this.id,
     this.name
  });
  factory Source.fromMap(Map<String,dynamic> json) => Source(
    id: json['id'],
    name: json['name'],
  );

  Map<String,dynamic> toMap() => {
    "id" : id,
    "name": name,
  };
}