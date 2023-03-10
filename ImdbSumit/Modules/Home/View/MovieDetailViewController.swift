//
//  MovieDetailViewController.swift
//  ImdbSumit
//
//  Created by Sumit Kumar on 10/03/23.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    // MARK: - UI Components
    
    private var movieDetailView = MovieDetailView()
    
    // MARK: - Properties
    
    var movie: MovieDataModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        updateView()
    }
    
    private func setup() {
        movieDetailView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addSubview(movieDetailView)
        NSLayoutConstraint.activate([
            movieDetailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieDetailView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            movieDetailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieDetailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func updateView() {
        if let _movie = movie {
            DispatchQueue.main.async { [weak self] in
                self?.movieDetailView.updateView(with: _movie)
            }
        }
    }
}
