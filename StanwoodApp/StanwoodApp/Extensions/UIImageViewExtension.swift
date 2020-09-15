//
//  UIImageViewExtension.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 14/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func loadAvatarImageOrDefault(from urlString: String?, _ defaultImage: UIImage? = UIImage(systemName: "person.fill")) {
        guard let url = urlString, !url.isEmpty, let imageUrl = URL(string: url) else {
            self.image = defaultImage
            return
        }
        self.kf.setImage(with: imageUrl)
    }
}
