//
//  RepositoryTableViewCell.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RepositoryTableViewCell: UITableViewCell {
    //MARK: Outlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var isFavouriteImageView: UIImageView!
    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryDescriptionLabel: UILabel!
    
    //MARK: Properties
    
    //MARK: Initializers
    func setup(_ repo: GitHubRepository) {
        repositoryNameLabel.text = repo.name
        repositoryDescriptionLabel.text = repo.description
        avatarImageView.loadImageOrDefault(from: repo.avatarUrl)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setControlsBehaviour()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setControlsBehaviour() {
        //avatarImageView.roundBorder()
    }
}
