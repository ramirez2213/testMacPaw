//
//  ActivityIndicator.swift
//  MacPawTest
//
//  Created by Konstantin Chukhas on 22.05.2020.
//  Copyright © 2020 Konstantin Chukhas. All rights reserved.
//

import UIKit
import Foundation


class ActivityIndicator: UIVisualEffectView {
    
    let activityIndictor: UIActivityIndicatorView = UIActivityIndicatorView(style:UIActivityIndicatorView.Style.large)
    let label: UILabel = UILabel()
    let blurEffect = UIBlurEffect(style: .regular)
    let vibrancyView: UIVisualEffectView
    
    init() {
        
        self.vibrancyView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
        super.init(effect: blurEffect)
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        self.vibrancyView = UIVisualEffectView(effect: UIVibrancyEffect(blurEffect: blurEffect))
        super.init(coder: aDecoder)
        self.setup()
    }
    
    func setup() {
        
        contentView.addSubview(vibrancyView)
        vibrancyView.contentView.addSubview(activityIndictor)
        activityIndictor.startAnimating()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if let superview = self.superview {
            let width: CGFloat = 75.0
            let height: CGFloat = 75.0
            self.frame = CGRect(x: superview.frame.size.width / 2 - width / 2,
                                y: superview.frame.height / 2 - height / 2,
                                width: width,
                                height: height)
            vibrancyView.frame = self.bounds
            let activityIndicatorSize: CGFloat = 40
            activityIndictor.frame = CGRect(x: 18, y: height / 2 - activityIndicatorSize / 2,
                                            width: activityIndicatorSize,
                                            height: activityIndicatorSize)
            layer.cornerRadius = 8.0
            layer.masksToBounds = true
            
        }
    }
    
    func show() {
        self.isHidden = false
    }
    
    func hide() {
        self.isHidden = true
    }}

