//
//  HomeView.swift
//  ImdbSumit
//
//  Created by Sumit Kumar on 09/03/23.
//

import UIKit

class HomeView: UIView {
    
    private var movieTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
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
}

extension HomeView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableViewCell.self)) as? HomeTableViewCell else {
            assertionFailure("Unable to load HomeTableViewCell in file: \(#file)")
            return UITableViewCell()
        }
        return cell
    }
    
}
