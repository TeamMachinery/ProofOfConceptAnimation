//
//  SchedulableAnimationFactory.swift
//  PoCShareResultsAnimation
//
//  Created by Zoran Plesko on 14/09/2017.
//  Copyright © 2017 Masinerija. All rights reserved.
//

import Foundation
import UIKit

class SchedulableAnimationFactory {

    static func lineConstraintAnimation(view: UIView, constraints: [NSLayoutConstraint], duration: TimeInterval) -> SchedulableAnimation {
        let animation = SchedulableUIViewPropertyAnimator(duration: duration, curve: .easeInOut)
        animation.propertyAnimator.addAnimations {
            for constraint in constraints {
                constraint.isActive = false
                view.layoutIfNeeded()
            }
        }
        return animation
    }

    static func roundAlphaAnimation(roundViews: [UIView], duration: TimeInterval) -> SchedulableAnimation {
        let animation = SchedulableUIViewPropertyAnimator(duration: duration, curve: .easeOut)
        animation.propertyAnimator.addAnimations {
            for view in roundViews {
                view.alpha = 1
            }
        }
        return animation
    }

    static func roundCornerAnimation(views: [UIView], duration: TimeInterval) -> SchedulableAnimation {
        let animation = SchedulableCAAnimation(keyPath: "cornerRadius", duration: duration, views: views)
        animation.animation.fromValue = 8
        animation.animation.toValue = 35
        animation.animation.duration = duration
        animation.animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        return animation
    }

    static func roundViewScaleAnimation(view: UIView, scaleConstraint: NSLayoutConstraint, duration: TimeInterval) -> SchedulableAnimation {
        let animation = SchedulableUIViewPropertyAnimator(duration: duration, curve: .easeOut)
        animation.propertyAnimator.addAnimations {
            scaleConstraint.constant = 70
            view.layoutIfNeeded()
        }
        return animation
    }

    static func imageRotationAnimation(views: [UIView], duration: TimeInterval) -> SchedulableAnimation {
        let animation = SchedulableUIViewPropertyAnimator(duration: duration, curve: .linear)
        animation.propertyAnimator.addAnimations {
            for view in views {
                view.transform = CGAffineTransform.identity
            }
        }
        return animation
    }

    static func imageAlphaAnimation(views: [UIView], duration: TimeInterval) -> SchedulableAnimation {
        let animation = SchedulableUIViewPropertyAnimator(duration: duration, curve: .linear)
        animation.propertyAnimator.addAnimations {
            for view in views {
                view.alpha = 1
            }
        }
        return animation
    }

    static func shadowOpacityAnimation(view: UIView, duration: TimeInterval ) -> SchedulableAnimation {
        let animation = SchedulableCAAnimation(keyPath: "shadowOpacity", duration: duration, views: [view])
        animation.animation.fromValue = 0
        animation.animation.toValue = 0.5
        animation.animation.duration = duration
        animation.animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return animation
    }

    static func labelAnimations(mainView: UIView,
                                alphaViews: [UIView],
                                centerConstraints: [NSLayoutConstraint],
                                weightDistance: NSLayoutConstraint,
                                buttonDistance: NSLayoutConstraint,
                                duration: TimeInterval) -> SchedulableAnimation {
        let animation = SchedulableUIViewPropertyAnimator(duration: duration, curve: .easeInOut)
        animation.propertyAnimator.addAnimations {
            for alphaView in alphaViews {
                alphaView.alpha = 1
            }
            for centerConstraint in centerConstraints {
                centerConstraint.constant = 0
            }
            weightDistance.constant = 20
            if(UIScreen.main.bounds.width < 375 ) {
                buttonDistance.constant = 50
            } else {
                buttonDistance.constant = 100
            }
            mainView.backgroundColor = #colorLiteral(red: 0.9244058728, green: 0.9244058728, blue: 0.9244058728, alpha: 1)
            mainView.layoutIfNeeded()
        }
        return animation
    }



}
