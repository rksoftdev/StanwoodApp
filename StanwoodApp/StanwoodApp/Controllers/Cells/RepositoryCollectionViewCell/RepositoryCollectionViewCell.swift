//
//  RepositoryCollectionViewCell.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RepositoryCollectionViewCell: UICollectionViewCell {
    //MARK: Outlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryDescriptionLabel: UILabel!
    @IBOutlet weak var isFavouriteImageView: UIImageView!
    
    //MARK: Properties
    
    //MARK: Initializers
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setControlsBehaviour()
    }

    private func setControlsBehaviour() {
        makeRoundedImageView()
    }
    
    func setup(_ repository: GitHubRepository) {
        repositoryNameLabel.text = repository.name
        repositoryDescriptionLabel.text = repository.description
        avatarImageView.loadAvatarImageOrDefault(from: repository.avatarUrl)
        isFavouriteImageView.image = UIImage(systemName: repository.isFavourite 
            ? "bookmark.fill"
            : "bookmark")
    }
    
    func makeRoundedImageView() {
        avatarImageView.layoutIfNeeded()
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
    }
}
