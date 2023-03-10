//
//  HomeViewController.swift
//  ImdbSumit
//
//  Created by Sumit Kumar on 09/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - UI Components
    
    private var homeView = HomeView()

    // MARK: - Properties

    private let homeService = HomeService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        makeNetworkCalls()
    }
    
    private func setup() {
        title = "Imdb"
        homeView.delegate = self
        homeView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addSubview(homeView)
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func makeNetworkCalls() {
        homeService.fetchMovies { [weak self] movies, error in
            if let movies = movies {
                DispatchQueue.main.async {
                    self?.homeView.updateView(with: movies)
                }
            }
        }
    }
    
}

// MARK: - HomeViewDelegate

extension HomeViewController: HomeViewDelegate {
    
    func homeView(_ view: HomeView, didSelectMovie movie: MovieDataModel) {
        let newViewController = MovieDetailViewController()
        newViewController.movie = movie
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
}
