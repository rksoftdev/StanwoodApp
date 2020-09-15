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
    //private var disposeBag: DisposeBag = DisposeBag()
    
    //MARK: Initializers
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func setControlsBehaviour() {
        avatarImageView.roundBorder()
    }
    
    func setup(_ repository: GitHubRepository) {
        repositoryNameLabel.text = repository.name
        repositoryDescriptionLabel.text = repository.description
        avatarImageView.loadImageOrDefault(from: repository.avatarUrl)
        isFavouriteImageView.image = UIImage(systemName: repository.isFavourite ?? false
            ? "bookmark.fill"
            : "bookmark")
        setControlsBehaviour()
    }
}
