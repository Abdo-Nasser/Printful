//
//  ViewControllerEx.swift
//  printful
//
//  Created by Abdelrahman Nasser on 4/23/21.
//

import UIKit

extension UIViewController {
    func showIndicatorAnimation() {
        let appDelegat = UIApplication.shared.delegate as? AppDelegate
        guard (appDelegat?.window) != nil else { return }
        
        
        let containerView = UIView(frame: UIScreen.main.bounds)
        containerView.backgroundColor = .black
        containerView.alpha = 0.85
        containerView.tag = 2020
        
        let indicatorView = UIActivityIndicatorView(style: .medium)
        indicatorView.color = .white
        indicatorView.center = containerView.center
        indicatorView.startAnimating()
        
        containerView.addSubview(indicatorView)
        self.view.addSubview(containerView)
    }
    
    func hideIndicatorAnimation() {
        let appDelegat = UIApplication.shared.delegate as? AppDelegate
        guard let window = appDelegat?.window else { return }
        guard window.rootViewController != nil else { return }
        
        self.view.subviews.first(where: { $0.tag == 2020 })?.removeFromSuperview()
    }
}
