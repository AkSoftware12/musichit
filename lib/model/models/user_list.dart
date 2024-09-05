class UserList {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;
  Support? support;

  UserList(
      {this.page,
        this.perPage,
        this.total,
        this.totalPages,
        this.data,
        this.support});

  UserList.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    support =
    json['support'] != null ? new Support.fromJson(json['support']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.support != null) {
      data['support'] = this.support!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}

class PlaylistModel {
  bool? success;
  int? status;
  List<Category>? category;

  PlaylistModel({this.success, this.status, this.category});

  PlaylistModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  int? preference;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<Playlist>? playlist;

  Category(
      {this.id,
        this.name,
        this.preference,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.playlist});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    preference = json['preference'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['playlist'] != null) {
      playlist = <Playlist>[];
      json['playlist'].forEach((v) {
        playlist!.add(new Playlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['preference'] = this.preference;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.playlist != null) {
      data['playlist'] = this.playlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Playlist {
  int? id;
  String? playlistName;
  int? playlistsCategoryId;
  String? description;
  String? image;
  String? status;
  int? userId;
  int? isTopChart;
  String? createdAt;
  String? updatedAt;
  String? imageData;

  Playlist(
      {this.id,
        this.playlistName,
        this.playlistsCategoryId,
        this.description,
        this.image,
        this.status,
        this.userId,
        this.isTopChart,
        this.createdAt,
        this.updatedAt,
        this.imageData});

  Playlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playlistName = json['playlist_name'];
    playlistsCategoryId = json['playlists_category_id'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    userId = json['user_id'];
    isTopChart = json['is_top_chart'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageData = json['image_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['playlist_name'] = this.playlistName;
    data['playlists_category_id'] = this.playlistsCategoryId;
    data['description'] = this.description;
    data['image'] = this.image;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['is_top_chart'] = this.isTopChart;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_data'] = this.imageData;
    return data;
  }
}


class SongModel {
  bool? success;
  List<Songs>? songs;

  SongModel({this.success, this.songs});

  SongModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['songs'] != null) {
      songs = <Songs>[];
      json['songs'].forEach((v) {
        songs!.add(new Songs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.songs != null) {
      data['songs'] = this.songs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Songs {
  int? id;
  String? title;
  String? subtitle;
  String? image;
  String? file;
  int? year;
  String? releaseDate;
  int? labelId;
  String? lyrics;
  String? upcNo;
  String? isrcNo;
  String? catalogNo;
  int? singerId;
  int? albumId;
  int? moodId;
  int? languageId;
  int? genreId;
  int? musicDirectorId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? songLyrics;
  String? fileData;
  String? imageData;
  Null? likeFlag;
  List<Singer>? singer;
  Mood? mood;
  Language? language;
  Language? genre;
  MusicDirector? musicDirector;
  Album? album;
  Label? label;
  List<Comments>? comments;

  Songs(
      {this.id,
        this.title,
        this.subtitle,
        this.image,
        this.file,
        this.year,
        this.releaseDate,
        this.labelId,
        this.lyrics,
        this.upcNo,
        this.isrcNo,
        this.catalogNo,
        this.singerId,
        this.albumId,
        this.moodId,
        this.languageId,
        this.genreId,
        this.musicDirectorId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.songLyrics,
        this.fileData,
        this.imageData,
        this.likeFlag,
        this.singer,
        this.mood,
        this.language,
        this.genre,
        this.musicDirector,
        this.album,
        this.label,
        this.comments});

  Songs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
    image = json['image'];
    file = json['file'];
    year = json['year'];
    releaseDate = json['release_date'];
    labelId = json['label_id'];
    lyrics = json['lyrics'];
    upcNo = json['upc_no'];
    isrcNo = json['isrc_no'];
    catalogNo = json['catalog_no'];
    singerId = json['singer_id'];
    albumId = json['album_id'];
    moodId = json['mood_id'];
    languageId = json['language_id'];
    genreId = json['genre_id'];
    musicDirectorId = json['music_director_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    songLyrics = json['song_lyrics'];
    fileData = json['file_data'];
    imageData = json['image_data'];
    likeFlag = json['like_flag'];
    if (json['singer'] != null) {
      singer = <Singer>[];
      json['singer'].forEach((v) {
        singer!.add(new Singer.fromJson(v));
      });
    }
    mood = json['mood'] != null ? new Mood.fromJson(json['mood']) : null;
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
    genre = json['genre'] != null ? new Language.fromJson(json['genre']) : null;
    musicDirector = json['music_director'] != null
        ? new MusicDirector.fromJson(json['music_director'])
        : null;
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
    label = json['label'] != null ? new Label.fromJson(json['label']) : null;
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['image'] = this.image;
    data['file'] = this.file;
    data['year'] = this.year;
    data['release_date'] = this.releaseDate;
    data['label_id'] = this.labelId;
    data['lyrics'] = this.lyrics;
    data['upc_no'] = this.upcNo;
    data['isrc_no'] = this.isrcNo;
    data['catalog_no'] = this.catalogNo;
    data['singer_id'] = this.singerId;
    data['album_id'] = this.albumId;
    data['mood_id'] = this.moodId;
    data['language_id'] = this.languageId;
    data['genre_id'] = this.genreId;
    data['music_director_id'] = this.musicDirectorId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['song_lyrics'] = this.songLyrics;
    data['file_data'] = this.fileData;
    data['image_data'] = this.imageData;
    data['like_flag'] = this.likeFlag;
    if (this.singer != null) {
      data['singer'] = this.singer!.map((v) => v.toJson()).toList();
    }
    if (this.mood != null) {
      data['mood'] = this.mood!.toJson();
    }
    if (this.language != null) {
      data['language'] = this.language!.toJson();
    }
    if (this.genre != null) {
      data['genre'] = this.genre!.toJson();
    }
    if (this.musicDirector != null) {
      data['music_director'] = this.musicDirector!.toJson();
    }
    if (this.album != null) {
      data['album'] = this.album!.toJson();
    }
    if (this.label != null) {
      data['label'] = this.label!.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Singer {
  int? id;
  String? name;
  String? bio;
  String? status;
  String? image;
  int? isVerified;
  String? createdAt;
  String? updatedAt;
  String? imageData;
  Null? likeFlag;
  Null? followFlag;
  Pivot? pivot;

  Singer(
      {this.id,
        this.name,
        this.bio,
        this.status,
        this.image,
        this.isVerified,
        this.createdAt,
        this.updatedAt,
        this.imageData,
        this.likeFlag,
        this.followFlag,
        this.pivot});

  Singer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bio = json['bio'];
    status = json['status'];
    image = json['Image'];
    isVerified = json['is_verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageData = json['image_data'];
    likeFlag = json['like_flag'];
    followFlag = json['follow_flag'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['bio'] = this.bio;
    data['status'] = this.status;
    data['Image'] = this.image;
    data['is_verified'] = this.isVerified;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_data'] = this.imageData;
    data['like_flag'] = this.likeFlag;
    data['follow_flag'] = this.followFlag;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? songId;
  int? singerId;

  Pivot({this.songId, this.singerId});

  Pivot.fromJson(Map<String, dynamic> json) {
    songId = json['song_id'];
    singerId = json['singer_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['song_id'] = this.songId;
    data['singer_id'] = this.singerId;
    return data;
  }
}

class Mood {
  int? id;
  String? name;
  String? image;
  String? color;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? imageData;

  Mood(
      {this.id,
        this.name,
        this.image,
        this.color,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.imageData});

  Mood.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    color = json['color'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageData = json['image_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['color'] = this.color;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_data'] = this.imageData;
    return data;
  }
}

class Language {
  int? id;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;

  Language({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  Language.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class MusicDirector {
  int? id;
  String? name;
  String? image;
  Null? isVerified;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? imageData;

  MusicDirector(
      {this.id,
        this.name,
        this.image,
        this.isVerified,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.imageData});

  MusicDirector.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    isVerified = json['is_verified'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageData = json['image_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['is_verified'] = this.isVerified;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_data'] = this.imageData;
    return data;
  }
}

class Album {
  int? id;
  String? name;
  String? status;
  String? image;
  String? releaseDate;
  String? createdAt;
  String? updatedAt;
  String? upcNo;
  String? imageData;
  Null? likeFlag;

  Album(
      {this.id,
        this.name,
        this.status,
        this.image,
        this.releaseDate,
        this.createdAt,
        this.updatedAt,
        this.upcNo,
        this.imageData,
        this.likeFlag});

  Album.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    image = json['image'];
    releaseDate = json['release_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    upcNo = json['upc_no'];
    imageData = json['image_data'];
    likeFlag = json['like_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['image'] = this.image;
    data['release_date'] = this.releaseDate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['upc_no'] = this.upcNo;
    data['image_data'] = this.imageData;
    data['like_flag'] = this.likeFlag;
    return data;
  }
}

class Label {
  int? id;
  String? name;
  String? status;
  String? image;
  Null? isVerified;
  String? createdAt;
  String? updatedAt;
  String? imageData;
  Null? followFlag;

  Label(
      {this.id,
        this.name,
        this.status,
        this.image,
        this.isVerified,
        this.createdAt,
        this.updatedAt,
        this.imageData,
        this.followFlag});

  Label.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    image = json['image'];
    isVerified = json['is_verified'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageData = json['image_data'];
    followFlag = json['follow_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['image'] = this.image;
    data['is_verified'] = this.isVerified;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_data'] = this.imageData;
    data['follow_flag'] = this.followFlag;
    return data;
  }
}

class Comments {
  int? id;
  int? userId;
  int? songId;
  String? comment;
  String? createdAt;
  String? updatedAt;
  String? timeAgo;
  String? updatedAgo;
  User? user;

  Comments(
      {this.id,
        this.userId,
        this.songId,
        this.comment,
        this.createdAt,
        this.updatedAt,
        this.timeAgo,
        this.updatedAgo,
        this.user});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    songId = json['song_id'];
    comment = json['comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    timeAgo = json['time_ago'];
    updatedAgo = json['updated_ago'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['song_id'] = this.songId;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['time_ago'] = this.timeAgo;
    data['updated_ago'] = this.updatedAgo;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  Null? lastName;
  String? phone;
  String? email;
  String? deviceId;
  int? isVerified;
  int? isAdmin;
  Null? emailVerifiedAt;
  String? apiToken;
  Null? passwordText;
  String? photo;
  String? role;
  String? role2;
  Null? provider;
  Null? providerId;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? isNotification;
  String? pictureData;

  User(
      {this.id,
        this.name,
        this.lastName,
        this.phone,
        this.email,
        this.deviceId,
        this.isVerified,
        this.isAdmin,
        this.emailVerifiedAt,
        this.apiToken,
        this.passwordText,
        this.photo,
        this.role,
        this.role2,
        this.provider,
        this.providerId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.isNotification,
        this.pictureData});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['last_name'];
    phone = json['phone'];
    email = json['email'];
    deviceId = json['device_id'];
    isVerified = json['is_verified'];
    isAdmin = json['is_admin'];
    emailVerifiedAt = json['email_verified_at'];
    apiToken = json['api_token'];
    passwordText = json['password_text'];
    photo = json['photo'];
    role = json['role'];
    role2 = json['role2'];
    provider = json['provider'];
    providerId = json['provider_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isNotification = json['is_notification'];
    pictureData = json['picture_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['last_name'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['device_id'] = this.deviceId;
    data['is_verified'] = this.isVerified;
    data['is_admin'] = this.isAdmin;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['api_token'] = this.apiToken;
    data['password_text'] = this.passwordText;
    data['photo'] = this.photo;
    data['role'] = this.role;
    data['role2'] = this.role2;
    data['provider'] = this.provider;
    data['provider_id'] = this.providerId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_notification'] = this.isNotification;
    data['picture_data'] = this.pictureData;
    return data;
  }
}