//
//  RoundedView.swift
//  PoCShareResultsAnimation
//
//  Created by Zoran Plesko on 14/07/2017.
//  Copyright © 2017 Masinerija. All rights reserved.
//

import UIKit

class RoundedView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.layer.cornerRadius = self.frame.size.width/2;
    }



}
