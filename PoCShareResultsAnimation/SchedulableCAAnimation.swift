//
//  SchedulableCAAnimation.swift
//  PoCShareResultsAnimation
//
//  Created by Zoran Plesko on 14/09/2017.
//  Copyright © 2017 Masinerija. All rights reserved.
//

import UIKit

class SchedulableCAAnimation: SchedulableAnimation {

    let views: [UIView]

    let animation: CABasicAnimation

    init(keyPath: String?, duration: TimeInterval, views: [UIView]) {
        self.views = views
        self.animation = CABasicAnimation(keyPath: keyPath)
        self.animation.duration = duration
        self.animation.fillMode = kCAFillModeForwards
        self.animation.isRemovedOnCompletion = false
    }

    func start(at: TimeInterval) {
        self.animation.beginTime = CACurrentMediaTime() + at
        for view in views {
            view.layer.add(self.animation, forKey: nil)
        }
    }

}
