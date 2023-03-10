//
//  HomeView.swift
//  ImdbSumit
//
//  Created by Sumit Kumar on 09/03/23.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func homeView(_ view: HomeView, didSelectMovie movie: MovieDataModel)
}

class HomeView: UIView {
    
    // MARK: -  UIComponents
    
    private var movieTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    // MARK: - Properties
    
    weak var delegate: HomeViewDelegate?
    private var movies = [MovieDataModel]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupMovieTableView()
        addConstraintsToMovieTableView()
    }
    
    private func setupMovieTableView() {
        addSubview(movieTableView)
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.register(HomeTableViewCell.self,
                                forCellReuseIdentifier: String(describing: HomeTableViewCell.self))
    }
    
    private func addConstraintsToMovieTableView() {
        NSLayoutConstraint.activate([
            movieTableView.topAnchor.constraint(equalTo: topAnchor),
            movieTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            movieTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    func updateView(with movies: Movies) {
        self.movies = movies
        movieTableView.reloadData()
    }
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableViewCell.self)) as? HomeTableViewCell else {
            assertionFailure("Unable to load HomeTableViewCell in file: \(#file)")
            return UITableViewCell()
        }
        DispatchQueue.main.async { [weak self] in
            cell.configureCell(with: (self?.movies[indexPath.row])!)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.homeView(self, didSelectMovie: movies[indexPath.row])
    }
    
}
