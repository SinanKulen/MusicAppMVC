//
//  MusicDTO.swift
//  MusicAppMVC
//
//  Created by Sinan Kulen on 1.03.2022.
//

import Foundation

// MARK: - MusicDTO
struct MusicDTO: Codable {
    let feed: Feed
}

// MARK: - Feed
struct Feed: Codable {
    let title: String
    let id: String
    let author: Author
    let copyright, country: String
    let icon: String
    let updated: String
    let musics: [Music]
    
    enum CodingKeys: String, CodingKey {
        case title, id , author, copyright, country, icon, updated
        case musics = "results"
    }
}

// MARK: - Author
struct Author: Codable {
    let name: String
    let url: String
}


// MARK: - Result
struct Music: Codable {
    let artistName, id, name, releaseDate: String
    let kind: String
    let artistID: String
    let artistURL: String
    let artworkUrl100: String
    let genres: [Genre]
    let url: String

    enum CodingKeys: String, CodingKey {
        case artistName, id, name, releaseDate, kind
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url
    }
}
// MARK: - Genre
struct Genre: Codable {
    let genreID, name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case genreID = "genreId"
        case name, url
    }
}
