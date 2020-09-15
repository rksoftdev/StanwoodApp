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
    func loadImageOrDefault(from urlString: String?) {
        guard let url = urlString, !url.isEmpty, let imageUrl = URL(string: url) else {
            return
        }
        self.kf.setImage(with: imageUrl)
    }
}
