//
//  GradientViewController.swift
//  UXTestApp
//
//  Created by 2ug2n on 2020/08/07.
//  Copyright © 2020 jinji. All rights reserved.
//

import Foundation
import UIKit

class GradientViewController: UIViewController {
    
    
    let gradient = CAGradientLayer()
    var gradientSet = [[CGColor]]()
           var currentGradient: Int = 0
    let gradientOne = UIColor(red: 193/255, green: 192/255, blue: 206/255, alpha: 1).cgColor
     let gradientTwo = UIColor(red: 202/255, green: 224/255, blue: 232/255, alpha: 1).cgColor
     let gradientThree = UIColor(red: 246/255, green: 242/255, blue: 227/255, alpha: 1).cgColor
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        gradientSet.append([gradientOne, gradientTwo])
        gradientSet.append([gradientTwo, gradientThree])
        gradientSet.append([gradientThree, gradientOne])
        
        
        gradient.frame = self.view.bounds
        gradient.colors = gradientSet[currentGradient]
        gradient.startPoint = CGPoint(x:0, y:0)
        gradient.endPoint = CGPoint(x:1, y:1)
        gradient.drawsAsynchronously = true
        self.view.layer.addSublayer(gradient)
        
        animateGradient()
        
    }

   
    
    
    
    func animateGradient() {
        if currentGradient < gradientSet.count-1 {
            currentGradient += 1
        } else {
            currentGradient = 0
        }
        
        let gradientChangeAnimation = CABasicAnimation(keyPath: "colors")
        gradientChangeAnimation.duration = 5.0
        gradientChangeAnimation.toValue = gradientSet[currentGradient]
        gradientChangeAnimation.fillMode = CAMediaTimingFillMode.forwards
        gradientChangeAnimation.isRemovedOnCompletion = false
        gradient.add(gradientChangeAnimation, forKey: "colorChange")
    }

    
}


extension GradientViewController: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            gradient.colors = gradientSet[currentGradient]
            animateGradient()
        }
    }
}
