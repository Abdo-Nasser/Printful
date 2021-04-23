//
//  ViewEx.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import UIKit

public extension UIView {
    func setBorder(cornerRadius: CGFloat, width: CGFloat, color: UIColor) {
        self.clipsToBounds = true
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
        self.layer.cornerRadius = cornerRadius
    }
}
