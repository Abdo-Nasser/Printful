//
//  ImageViewEx.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import UIKit
import Kingfisher

extension UIImageView {
    func uploadImage(from imageURL: String?) {
        guard let imageURL = imageURL, let url = URL(string: imageURL) else { return }
        kf.setImage(with: url)
    }
    
    func startAnimation() {
        UIView.animate(withDuration: 0.7, delay: 0.0, options: [.repeat, .autoreverse]) { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
    }
    
    func stopAnimation() {
        self.transform = CGAffineTransform.identity
        self.layer.removeAllAnimations()
    }
    
    func loadImage(url: URL?, placeholder: UIImage? = nil, showLoader: Bool = true) {
        self.stopAnimation()
        self.removeAnimatingLoader()
        self.showLoader(true)
        self.kf.setImage(with: url, placeholder: placeholder, options: nil) { [weak self] result in
            switch result {
            case .success(let data):
                self?.image = data.image
            case .failure:
                self?.image = placeholder
            }
            self?.removeAnimatingLoader()
        }
    }
    
    func showLoader(_ show: Bool) {
        if let laodingView = self.subviews.first(where: { $0 is UIActivityIndicatorView }) {
            if !show {
                laodingView.removeFromSuperview()
            }
        } else {
            let indicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
            indicatorView.center = self.center
            indicatorView.startAnimating()
            
            self.addSubview(indicatorView)
        }
    }
    
    func removeAnimatingLoader() {
        self.subviews.forEach( {
            if $0 is UIActivityIndicatorView {
                $0.removeFromSuperview()
            }
        })
    }
}
