//
//  HomeService.swift
//  ImdbSumit
//
//  Created by Sumit Kumar on 10/03/23.
//

import Foundation

struct HomeService {
    
    private let service = NetworkService()
    
    func fetchMovies(completion: @escaping(Movies?, Error?) -> Void) {
        let urlString = "https://imdb-top-100-movies.p.rapidapi.com/"
        var headers =  ["Content-Type": "application/json",
            "X-RapidAPI-Key": "448bef4188msh76acc77fe2eb6d5p148196jsnc43454e5c401",
            "X-RapidAPI-Host": "imdb-top-100-movies.p.rapidapi.com" ]
        service.fetchData(for: urlString, headers: headers) { (result: Result<Movies, Error>) in
            switch result {
            case .success(let movies):
                completion(movies, nil)
            case .failure(let error):
                completion(nil, error)
          }
        }
    }
}
