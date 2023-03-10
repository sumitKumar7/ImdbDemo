//
//  MovieDetailView.swift
//  ImdbSumit
//
//  Created by Sumit Kumar on 10/03/23.
//

import UIKit

class MovieDetailView: UIView {

    // MARK: - UIComponents
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(with movie: MovieDataModel) {
        titleLabel.text = movie.title
        subtitleLabel.text = movie.description
        ratingLabel.text = "Rating: \(movie.rating ?? "Not available")"
        ImageDownloader.shared.downloadImage(with: movie.image, completionHandler: { [weak self] image, chached in
            self?.thumbnailImageView.image = image
        }, placeholderImage: nil)
    }
    
    private func setup() {
        setupLabels()
        setupThumbnailImageView()
        
        addContraintToThumbnailImageView()
        addContraintToTitleLabel()
        addContraintTosubtitleLabel()
        addContraintToRatingLabel()
    }
    
    private func setupLabels() {
        addSubview(titleLabel)
        titleLabel.numberOfLines = 1
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        addSubview(subtitleLabel)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        addSubview(ratingLabel)
        ratingLabel.numberOfLines = 1
        ratingLabel.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    private func setupThumbnailImageView() {
        addSubview(thumbnailImageView)
        thumbnailImageView.contentMode = .scaleAspectFit
    }
    
    private func addContraintToThumbnailImageView() {
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8.0),
            thumbnailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 250),
            thumbnailImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    private func addContraintToTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 8.0),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    private func addContraintTosubtitleLabel() {
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
            subtitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    private func addContraintToRatingLabel() {
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 8.0),
            ratingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            ratingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
