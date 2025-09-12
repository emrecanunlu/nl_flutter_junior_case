import 'package:jr_case_boilerplate/core/base/base_model.dart';

class MovieModel extends BaseModel<MovieModel> {
  String id;
  String title;
  String year;
  String rated;
  String released;
  String runtime;
  String genre;
  String director;
  String writer;
  String actors;
  String plot;
  String language;
  String country;
  String awards;
  String poster;
  String metascore;
  String imdbRating;
  String imdbVotes;
  String imdbID;
  String type;
  String response;
  List<String> images;
  bool comingSoon;
  bool isFavorite;

  MovieModel({
    this.id = '',
    this.title = '',
    this.year = '',
    this.rated = '',
    this.released = '',
    this.runtime = '',
    this.genre = '',
    this.director = '',
    this.writer = '',
    this.actors = '',
    this.plot = '',
    this.language = '',
    this.country = '',
    this.awards = '',
    this.poster = '',
    this.metascore = '',
    this.imdbRating = '',
    this.imdbVotes = '',
    this.imdbID = '',
    this.type = '',
    this.response = '',
    this.images = const [],
    this.comingSoon = false,
    this.isFavorite = false,
  });

  @override
  MovieModel fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? json['_id'] ?? '',
      title: json['Title'] ?? '',
      year: json['Year'] ?? '',
      rated: json['Rated'] ?? '',
      released: json['Released'] ?? '',
      runtime: json['Runtime'] ?? '',
      genre: json['Genre'] ?? '',
      director: json['Director'] ?? '',
      writer: json['Writer'] ?? '',
      actors: json['Actors'] ?? '',
      plot: json['Plot'] ?? '',
      language: json['Language'] ?? '',
      country: json['Country'] ?? '',
      awards: json['Awards'] ?? '',
      poster: json['Poster'] ?? '',
      metascore: json['Metascore'] ?? '',
      imdbRating: json['imdbRating'] ?? '',
      imdbVotes: json['imdbVotes'] ?? '',
      imdbID: json['imdbID'] ?? '',
      type: json['Type'] ?? '',
      response: json['Response'] ?? '',
      images:
          (json['Images'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      comingSoon: json['ComingSoon'] ?? false,
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      '_id': id,
      'Title': title,
      'Year': year,
      'Rated': rated,
      'Released': released,
      'Runtime': runtime,
      'Genre': genre,
      'Director': director,
      'Writer': writer,
      'Actors': actors,
      'Plot': plot,
      'Language': language,
      'Country': country,
      'Awards': awards,
      'Poster': poster,
      'Metascore': metascore,
      'imdbRating': imdbRating,
      'imdbVotes': imdbVotes,
      'imdbID': imdbID,
      'Type': type,
      'Response': response,
      'Images': images,
      'ComingSoon': comingSoon,
      'isFavorite': isFavorite,
    };
  }

  MovieModel copyWith({
    String? id,
    String? title,
    String? year,
    String? rated,
    String? released,
    String? runtime,
    String? genre,
    String? director,
    String? writer,
    String? actors,
    String? plot,
    String? language,
    String? country,
    String? awards,
    String? poster,
    String? metascore,
    String? imdbRating,
    String? imdbVotes,
    String? imdbID,
    String? type,
    String? response,
    List<String>? images,
    bool? comingSoon,
    bool? isFavorite,
  }) {
    return MovieModel(
      id: id ?? this.id,
      title: title ?? this.title,
      year: year ?? this.year,
      rated: rated ?? this.rated,
      released: released ?? this.released,
      runtime: runtime ?? this.runtime,
      genre: genre ?? this.genre,
      director: director ?? this.director,
      writer: writer ?? this.writer,
      actors: actors ?? this.actors,
      plot: plot ?? this.plot,
      language: language ?? this.language,
      country: country ?? this.country,
      awards: awards ?? this.awards,
      poster: poster ?? this.poster,
      metascore: metascore ?? this.metascore,
      imdbRating: imdbRating ?? this.imdbRating,
      imdbVotes: imdbVotes ?? this.imdbVotes,
      imdbID: imdbID ?? this.imdbID,
      type: type ?? this.type,
      response: response ?? this.response,
      images: images ?? this.images,
      comingSoon: comingSoon ?? this.comingSoon,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
