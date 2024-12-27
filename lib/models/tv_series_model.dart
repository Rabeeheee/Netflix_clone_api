class TvSeriesModel {
    TvSeriesModel({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    final int? page;
    final List<Result> results;
    final int? totalPages;
    final int? totalResults;

    TvSeriesModel copyWith({
        int? page,
        List<Result>? results,
        int? totalPages,
        int? totalResults,
    }) {
        return TvSeriesModel(
            page: page ?? this.page,
            results: results ?? this.results,
            totalPages: totalPages ?? this.totalPages,
            totalResults: totalResults ?? this.totalResults,
        );
    }

    factory TvSeriesModel.fromJson(Map<String, dynamic> json){ 
        return TvSeriesModel(
            page: json["page"],
            results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
            totalPages: json["total_pages"],
            totalResults: json["total_results"],
        );
    }

}

class Result {
    Result({
        required this.adult,
        required this.backdropPath,
        required this.genreIds,
        required this.id,
        required this.originCountry,
        required this.originalLanguage,
        required this.originalName,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.firstAirDate,
        required this.name,
        required this.voteAverage,
        required this.voteCount,
    });

    final bool? adult;
    final String? backdropPath;
    final List<int> genreIds;
    final int? id;
    final List<String> originCountry;
    final String? originalLanguage;
    final String? originalName;
    final String? overview;
    final double? popularity;
    final String? posterPath;
    final DateTime? firstAirDate;
    final String? name;
    final double? voteAverage;
    final int? voteCount;

    Result copyWith({
        bool? adult,
        String? backdropPath,
        List<int>? genreIds,
        int? id,
        List<String>? originCountry,
        String? originalLanguage,
        String? originalName,
        String? overview,
        double? popularity,
        String? posterPath,
        DateTime? firstAirDate,
        String? name,
        double? voteAverage,
        int? voteCount,
    }) {
        return Result(
            adult: adult ?? this.adult,
            backdropPath: backdropPath ?? this.backdropPath,
            genreIds: genreIds ?? this.genreIds,
            id: id ?? this.id,
            originCountry: originCountry ?? this.originCountry,
            originalLanguage: originalLanguage ?? this.originalLanguage,
            originalName: originalName ?? this.originalName,
            overview: overview ?? this.overview,
            popularity: popularity ?? this.popularity,
            posterPath: posterPath ?? this.posterPath,
            firstAirDate: firstAirDate ?? this.firstAirDate,
            name: name ?? this.name,
            voteAverage: voteAverage ?? this.voteAverage,
            voteCount: voteCount ?? this.voteCount,
        );
    }

    factory Result.fromJson(Map<String, dynamic> json){ 
        return Result(
            adult: json["adult"],
            backdropPath: json["backdrop_path"],
            genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
            id: json["id"],
            originCountry: json["origin_country"] == null ? [] : List<String>.from(json["origin_country"]!.map((x) => x)),
            originalLanguage: json["original_language"],
            originalName: json["original_name"],
            overview: json["overview"],
            popularity: json["popularity"],
            posterPath: json["poster_path"],
            firstAirDate: DateTime.tryParse(json["first_air_date"] ?? ""),
            name: json["name"],
            voteAverage: json["vote_average"],
            voteCount: json["vote_count"],
        );
    }

}
