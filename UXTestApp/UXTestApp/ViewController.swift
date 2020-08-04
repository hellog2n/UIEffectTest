//
//  ViewController.swift
//  UXTestApp
//
//  Created by 2ug2n on 2020/08/04.
//  Copyright © 2020 jinji. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
   

   
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myButton.layer.cornerRadius = 20.0;
        let tap = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        self.myButton.addGestureRecognizer(tap)
        self.myButton.layer.masksToBounds = true
        self.view.backgroundColor = UIColor.black
    }

    
    
    
    
    @objc func tap(_ recognizer: UITapGestureRecognizer) {
        let hitPoint = recognizer.location(in: self.myButton)
           let rippleEffectLayer = CALayer()
           rippleEffectLayer.frame = CGRect(x: hitPoint.x - 5, y: hitPoint.y - 5, width: 3, height: 3)
           rippleEffectLayer.cornerRadius = rippleEffectLayer.frame.height / 2
           rippleEffectLayer.masksToBounds = true;
           rippleEffectLayer.backgroundColor = UIColor(white: 1.0, alpha: 0.4).cgColor
           rippleEffectLayer.zPosition = 1.0
           self.myButton.layer.addSublayer(rippleEffectLayer)
           let maxSize = max(rippleEffectLayer.superlayer!.frame.width, rippleEffectLayer.superlayer!.frame.width)
           let minSize = min(rippleEffectLayer.frame.width, rippleEffectLayer.frame.height)
           let scaleRate = (maxSize / minSize) * 2 * 1.42
           
           
           
           
           CATransaction.begin()
           CATransaction.setCompletionBlock {
               rippleEffectLayer.removeFromSuperlayer()
           }
           let group = CAAnimationGroup()
           group.duration = 0.9
           group.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)

           let scaleAnimation = CABasicAnimation(keyPath: "transform")
           scaleAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
           scaleAnimation.fromValue = NSValue(caTransform3D: CATransform3DMakeScale(1, 1, 1))
           scaleAnimation.toValue = NSValue(caTransform3D: CATransform3DMakeScale(scaleRate, scaleRate, 1))

           let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
           colorAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
           colorAnimation.toValue = UIColor.clear.cgColor

           group.animations = [scaleAnimation, colorAnimation]

           rippleEffectLayer.add(group, forKey: "all")

           CATransaction.commit()
       }
}
