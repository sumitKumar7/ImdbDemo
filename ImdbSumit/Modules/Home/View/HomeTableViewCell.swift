//
//  HomeTableViewCell.swift
//  ImdbSumit
//
//  Created by Sumit Kumar on 09/03/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
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
    
    private var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let thumbnailImageSize = CGSize(width: 200, height: 200)
    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupLabels()
        setupThumbnailImageView()
        
        addContraintToThumbnailImageView()
        addContraintToTitleLabel()
        addContraintToSubtitleLabel()
    }
    
    private func setupLabels() {
        contentView.addSubview(titleLabel)
        titleLabel.numberOfLines = 1
        titleLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        contentView.addSubview(subtitleLabel)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
    }
    
    private func setupThumbnailImageView() {
        contentView.addSubview(thumbnailImageView)
        thumbnailImageView.contentMode = .scaleAspectFit
        thumbnailImageView.backgroundColor = .green
        thumbnailImageView.layer.cornerRadius = 5.0
    }
    
    private func addContraintToThumbnailImageView() {
        NSLayoutConstraint.activate([
            thumbnailImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
            thumbnailImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: thumbnailImageSize.height),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: thumbnailImageSize.width),
            thumbnailImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    private func addContraintToTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8.0),
            titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 16.0),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0),
        ])
    }
    
    private func addContraintToSubtitleLabel() {
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8.0),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 16.0),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16.0)
        ])
    }
    
}
