//
//  RepositoryTableViewCell.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setControlsBehaviour()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setControlsBehaviour() {
        let radius = avatarImageView.frame.width / 2
        avatarImageView.sizeToFit()
        avatarImageView.layer.cornerRadius = radius
        accessoryType = .disclosureIndicator
    }
}
