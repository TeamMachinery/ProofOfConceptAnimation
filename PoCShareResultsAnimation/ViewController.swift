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

    @IBOutlet weak var firstLineTop: NSLayoutConstraint!
    @IBOutlet weak var firstLineBottom: NSLayoutConstraint!
    @IBOutlet weak var firstLineBottomUp: NSLayoutConstraint!
    @IBOutlet weak var firstLineTopDown: NSLayoutConstraint!
    @IBOutlet weak var secondLineTop: NSLayoutConstraint!
    @IBOutlet weak var secondLineBottom: NSLayoutConstraint!
    @IBOutlet weak var secondLineTopDown: NSLayoutConstraint!
    @IBOutlet weak var secondLineBottomUp: NSLayoutConstraint!
    @IBOutlet weak var thirdLineTop: NSLayoutConstraint!
    @IBOutlet weak var thirdLineBottom: NSLayoutConstraint!
    @IBOutlet weak var thirdLineTopDown: NSLayoutConstraint!
    @IBOutlet weak var thirdLineBottomUp: NSLayoutConstraint!

    @IBOutlet weak var titleCenterX: NSLayoutConstraint!
    @IBOutlet weak var timeCenterX: NSLayoutConstraint!
    @IBOutlet weak var runCenterX: NSLayoutConstraint!
    @IBOutlet weak var weightDistanceY: NSLayoutConstraint!
    @IBOutlet weak var swimCenterX: NSLayoutConstraint!

    @IBOutlet weak var buttonDistanceY: NSLayoutConstraint!

    @IBOutlet weak var roundedViewWidth1: NSLayoutConstraint!

    @IBOutlet weak var containerViewTop: NSLayoutConstraint!
    @IBOutlet weak var containerViewBottom: NSLayoutConstraint!

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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowRadius = 15
        containerView.layer.shadowOpacity = 0.0


    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.animate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


// MARK: - Animation
extension ViewController {


    func animate() {

        animateLines()


        UIView.animate(withDuration: 0.2,
                       delay: 0.25,
                       options: .curveEaseIn,
                       animations:
        {
            self.roundedView1.alpha = 1
            self.roundedView2.alpha = 1
            self.roundedView3.alpha = 1
        }) { (success) in
            let animation = self.animationCornerRadius(duration: 0.2)
            self.roundedView1.layer.add(animation, forKey: nil)
            self.roundedView1.layer.cornerRadius = 35
            self.roundedView2.layer.add(animation, forKey: nil)
            self.roundedView2.layer.cornerRadius = 35
            self.roundedView3.layer.add(animation, forKey: nil)
            self.roundedView3.layer.cornerRadius = 35
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: .curveEaseIn,
                           animations:
                {
                    self.roundedViewWidth1.constant = 70


                    self.view.layoutIfNeeded()
            }) { _ in
                let animation = self.animationRotation(duration: 0.15)
                self.imageView1.layer.add(animation, forKey: nil)
                self.imageView1.layer.transform = CATransform3DMakeRotation(0, 0, 0, 1)
                self.imageView2.layer.add(animation, forKey: nil)
                self.imageView2.layer.transform = CATransform3DMakeRotation(0, 0, 0, 1)
                self.imageView3.layer.add(animation, forKey: nil)
                self.imageView3.layer.transform = CATransform3DMakeRotation(0, 0, 0, 1)
                UIView.animate(withDuration: 0.15,
                               delay: 0,
                               options: .curveLinear,
                               animations:
                    {
                        self.imageView1.alpha = 1
                        self.imageView2.alpha = 1
                        self.imageView3.alpha = 1

                }) { _ in
                    let animation = self.animationShadowOpacity(duration: 0.3)
                    self.containerView.layer.add(animation, forKey: nil)
                    self.containerView.layer.shadowOpacity = 0.5
                    UIView.animate(withDuration: 0.3,
                                   delay: 0,
                                   options: .curveEaseIn,
                                   animations:
                    {

                        self.titleLabel.alpha = 1
                        self.titleCenterX.constant = 0

                        self.timeLabel.alpha = 1
                        self.timeCenterX.constant = 0

                        self.runLabel.alpha = 1
                        self.runCenterX.constant = 0

                        self.weightLabel.alpha = 1
                        self.weightDistanceY.constant = 20

                        self.swimLabel.alpha = 1
                        self.swimCenterX.constant = 0

                        self.shareResultsButton.alpha = 1
                        self.buttonDistanceY.constant = 100

                        self.view.backgroundColor = #colorLiteral(red: 0.9244058728, green: 0.9244058728, blue: 0.9244058728, alpha: 1)


                        self.view.layoutIfNeeded()
                    })
                }
            }

        }



    }

    func animateLines() {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseIn,
                       animations:
            {
                self.firstLineBottomUp.isActive = false
                self.thirdLineBottomUp.isActive = false
                self.secondLineTopDown.isActive = false
                self.view.layoutIfNeeded()

        })

        UIView.animate(withDuration: 0.3,
                       delay: 0.25,
                       options: .curveEaseIn,
                       animations:
            {
                self.firstLineTop.isActive = false
                self.thirdLineTop.isActive = false
                self.secondLineBottom.isActive = false
                self.view.layoutIfNeeded()
                
        })
    }

    func animateEverythingOut() {

        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .curveEaseIn,
                       animations:
        {
            self.containerViewBottom.constant = self.containerViewBottom.constant + 700
            self.containerViewTop.constant = self.containerViewTop.constant - 700

            self.buttonDistanceY.constant = -60
            self.view.layoutIfNeeded()
        })

    }

    func animationCornerRadius(duration: Double) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        animation.fromValue = 8
        animation.toValue = 35
        animation.duration = duration
        return animation
    }

    func animationRotation(duration: Double) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue = -0.392
        animation.toValue = 0
        animation.duration = duration
        return animation
    }

    func animationShadowOpacity(duration: Double) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "shadowOpacity")
        animation.fromValue = 0
        animation.toValue = 0.5
        animation.duration = duration
        return animation
    }


}

// MARK: - Action
extension ViewController {

    @IBAction func sharePressed(button: UIButton) {
        animateEverythingOut()
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
