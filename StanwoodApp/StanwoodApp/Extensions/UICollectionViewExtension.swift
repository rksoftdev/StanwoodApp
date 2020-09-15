//
//  UICollectionViewExtension.swift
//  StanwoodApp
//
//  Created by Robert  Kuraj on 15/09/2020.
//  Copyright © 2020 Robert Kuraj. All rights reserved.
//

import UIKit

extension UICollectionView {
    func prepareItemSize(_ iPadHeight: CGFloat, _ otherHeight: CGFloat) {
        guard let layout = self.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        
        let itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIDevice.current.userInterfaceIdiom == .pad ? iPadHeight : otherHeight)
        layout.itemSize = itemSize
        self.layoutIfNeeded()
    }
}
