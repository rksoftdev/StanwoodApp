//
//  LabeledImageView.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 15/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit

class LabeledImageView: UIView {
    //MARK: Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    //MARK: Properties
    private let nibName = "LabeledImageView"
    
    //MARK: InspectableProperties
    @IBInspectable var image: UIImage = UIImage(systemName: "bookmark") ?? UIImage() {
        didSet {
            self.imageView.image = image
        }
    }
    
    //MARK: Initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        self.addSubview(self.contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
