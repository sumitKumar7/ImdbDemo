//
//  MovieDataModel.swift
//  ImdbSumit
//
//  Created by Sumit Kumar on 10/03/23.
//

import Foundation

// MARK: - MovieDataModel

struct MovieDataModel: Codable {
    let rank: Int?
    let title: String?
    let thumbnail: String?
    let rating, id: String?
    let year: Int?
    let image: String?
    let description: String?
    let trailer: String?
    let genre, director, writers: [String]
    let imdbid: String?
}


typealias Movies = [MovieDataModel]
