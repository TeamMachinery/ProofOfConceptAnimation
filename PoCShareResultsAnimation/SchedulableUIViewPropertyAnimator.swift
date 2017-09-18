//
//  SchedulableUIViewPropertyAnimator.swift
//  PoCShareResultsAnimation
//
//  Created by Zoran Plesko on 14/09/2017.
//  Copyright © 2017 Masinerija. All rights reserved.
//

import UIKit

class SchedulableUIViewPropertyAnimator: SchedulableAnimation {

    let propertyAnimator: UIViewPropertyAnimator

    init(duration: TimeInterval, curve: UIViewAnimationCurve) {
        self.propertyAnimator = UIViewPropertyAnimator(duration: duration, curve: curve)
    }

    func start(at: TimeInterval) {
        self.propertyAnimator.startAnimation(afterDelay: at)
    }

}
