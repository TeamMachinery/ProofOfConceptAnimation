//
//  ViewController.swift
//  PoCShareResultsAnimation
//
//  Created by Zoran Plesko on 14/07/2017.
//  Copyright © 2017 Masinerija. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    @IBOutlet  var firstLineTop: NSLayoutConstraint!
    @IBOutlet weak var firstLineBottom: NSLayoutConstraint!
    @IBOutlet  var firstLineBottomUp: NSLayoutConstraint!
    @IBOutlet weak var firstLineTopDown: NSLayoutConstraint!
    @IBOutlet weak var secondLineTop: NSLayoutConstraint!
    @IBOutlet  var secondLineBottom: NSLayoutConstraint!
    @IBOutlet  var secondLineTopDown: NSLayoutConstraint!
    @IBOutlet weak var secondLineBottomUp: NSLayoutConstraint!
    @IBOutlet  var thirdLineTop: NSLayoutConstraint!
    @IBOutlet weak var thirdLineBottom: NSLayoutConstraint!
    @IBOutlet weak var thirdLineTopDown: NSLayoutConstraint!
    @IBOutlet  var thirdLineBottomUp: NSLayoutConstraint!

    @IBOutlet weak var titleCenterX: NSLayoutConstraint!
    @IBOutlet weak var timeCenterX: NSLayoutConstraint!
    @IBOutlet weak var runCenterX: NSLayoutConstraint!
    @IBOutlet weak var weightDistanceY: NSLayoutConstraint!
    @IBOutlet weak var swimCenterX: NSLayoutConstraint!

    @IBOutlet weak var buttonDistanceY: NSLayoutConstraint!

    @IBOutlet weak var roundedViewWidth1: NSLayoutConstraint!

    @IBOutlet weak var containerViewTop: NSLayoutConstraint!

    @IBOutlet weak var containerView: UIView!

    @IBOutlet weak var shareResultsButton: UIButton!

    @IBOutlet weak var roundedView1: UIView!
    @IBOutlet weak var roundedView2: UIView!
    @IBOutlet weak var roundedView3: UIView!

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var runLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var swimLabel: UILabel!

    let duration: TimeInterval = 1
    let animationSegmentDurationPercentage = 0.2
    var segmentDuration: TimeInterval { return animationSegmentDurationPercentage*duration }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        finalViewSetup()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.navigationItem.rightBarButtonItem?.isEnabled = false

        animate()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func finalViewSetup() {

        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = 15
        containerView.layer.shadowOpacity = 0.0

        imageView1.transform = CGAffineTransform(rotationAngle: -0.392)
        imageView2.transform = CGAffineTransform(rotationAngle: -0.392)
        imageView3.transform = CGAffineTransform(rotationAngle: -0.392)
        view.layoutIfNeeded()

    }


}


// MARK: - Animation
extension ViewController {

    func animate() {
        let timeFractions = [0, 0.2, 0.4, 0.6, 0.8]
        let times = timeFractions.map { $0*duration }

        let animations = listOfAnimationsByPosition()

        for aniPos in animations {
            aniPos.0.start(at: times[aniPos.1])
        }
    }

    func animateEverythingOut() {

        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       options: .curveEaseIn,
                       animations:
        {
            self.containerViewTop.constant = self.containerViewTop.constant - 500

            self.buttonDistanceY.constant = -60
            self.view.layoutIfNeeded()
        })

        perform(#selector(reset), with: nil, afterDelay: 0.5)

    }

    func reset() {

        firstLineBottomUp.isActive = true
        thirdLineBottomUp.isActive = true
        secondLineTopDown.isActive = true
        firstLineTop.isActive = true
        thirdLineTop.isActive = true
        secondLineBottom.isActive = true
        roundedView1.alpha = 0
        roundedView2.alpha = 0
        roundedView3.alpha = 0
        roundedView1.layer.cornerRadius = 8
        roundedView2.layer.cornerRadius = 8
        roundedView3.layer.cornerRadius = 8
        roundedView1.layer.removeAllAnimations()
        roundedView2.layer.removeAllAnimations()
        roundedView3.layer.removeAllAnimations()
        roundedViewWidth1.constant = 16
        imageView1.transform = CGAffineTransform(rotationAngle: -0.392)
        imageView2.transform = CGAffineTransform(rotationAngle: -0.392)
        imageView3.transform = CGAffineTransform(rotationAngle: -0.392)
        imageView1.alpha = 0
        imageView2.alpha = 0
        imageView3.alpha = 0
        containerView.layer.shadowOpacity = 0
        containerView.layer.removeAllAnimations()
        titleLabel.alpha = 0
        timeLabel.alpha = 0
        runLabel.alpha = 0
        weightLabel.alpha = 0
        swimLabel.alpha = 0
        shareResultsButton.alpha = 0
        titleCenterX.constant = -20
        timeCenterX.constant = 20
        runCenterX.constant = -20
        swimCenterX.constant = 20
        weightDistanceY.constant = 40

        buttonDistanceY.constant = -60
        self.view.layoutIfNeeded()
        UIView.animate(withDuration: 2, animations: { 
            self.view.backgroundColor = UIColor.white
            self.view.layoutIfNeeded()
        }) { (success) in
            self.containerViewTop.constant = 75
            self.view.layoutIfNeeded()
            self.navigationItem.rightBarButtonItem?.isEnabled = true
        }

    }

    func listOfAnimationsByPosition() -> [(SchedulableAnimation, Int)] {
        let lineStarts = [firstLineBottomUp!, thirdLineBottomUp!, secondLineTopDown!]
        let lineStartAnimation = SchedulableAnimationFactory
            .lineConstraintAnimation(view: self.view,
                                     constraints: lineStarts,
                                     duration: segmentDuration)


        let lineEnds = [firstLineTop!, thirdLineTop!, secondLineBottom!]
        let lineEndAnimation = SchedulableAnimationFactory.lineConstraintAnimation(view: self.view,
                                                                                   constraints: lineEnds,
                                                                                   duration: segmentDuration)


        let roundedViews = [roundedView1!, roundedView2!, roundedView3!]
        let roundViewAlphaAnimation = SchedulableAnimationFactory.roundAlphaAnimation(roundViews: roundedViews,
                                                                                      duration: segmentDuration)



        let roundViewCornerAnimation = SchedulableAnimationFactory.roundCornerAnimation(views: roundedViews,
                                                                                    duration: segmentDuration)


        let roundViewScaleAnimation = SchedulableAnimationFactory.roundViewScaleAnimation(view: self.view,
                                                                                          scaleConstraint: roundedViewWidth1,
                                                                                          duration: segmentDuration)


        let imageViews = [imageView1!, imageView2!, imageView3!]
        let imageRotateAnimation = SchedulableAnimationFactory.imageRotationAnimation(views: imageViews,
                                                                                      duration: segmentDuration)


        let imageAlphaAnimation = SchedulableAnimationFactory.imageAlphaAnimation(views: imageViews,
                                                                                  duration: segmentDuration)

        let shadowOpacityAnimation = SchedulableAnimationFactory.shadowOpacityAnimation(view: containerView,
                                                                                        duration: segmentDuration)



        let alphaViews: [UIView] = [titleLabel!, timeLabel!, runLabel!, weightLabel!, swimLabel!, shareResultsButton!]
        let centerConstraints = [titleCenterX!, timeCenterX!, runCenterX!, swimCenterX!]
        let labelAnimations = SchedulableAnimationFactory.labelAnimations(mainView: view,
                                                                          alphaViews: alphaViews,
                                                                          centerConstraints: centerConstraints,
                                                                          weightDistance: weightDistanceY,
                                                                          buttonDistance: buttonDistanceY,
                                                                          duration: segmentDuration)

        return [(lineStartAnimation, 0),
                (lineEndAnimation, 1),
                (roundViewAlphaAnimation, 1),
                (roundViewScaleAnimation, 2),
                (roundViewCornerAnimation, 2),
                (imageRotateAnimation, 3),
                (imageAlphaAnimation, 3),
                (shadowOpacityAnimation, 4),
                (labelAnimations, 4)]
    }


}

// MARK: - Action
extension ViewController {

    @IBAction func sharePressed(button: UIButton) {
        let timingFunction =
            CAMediaTimingFunction(controlPoints: 1,-0.37,0.62,1)
        CATransaction.begin()
        CATransaction.setAnimationTimingFunction(timingFunction)
        animateEverythingOut()
        CATransaction.commit()
    }

    @IBAction func animatePressed(button: UIBarButtonItem) {
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        animate()
    }

}

extension CALayer {
    var borderUIColor: UIColor {
        get {
            if let borderColor = self.borderColor {
                return UIColor.init(cgColor: borderColor)
            }
            else {
                return UIColor.clear
            }
        }
        set {
            self.borderColor = newValue.cgColor
        }
    }
}
