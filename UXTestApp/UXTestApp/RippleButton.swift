//
//  RippleButton.swift
//  UXTestApp
//
//  Created by 2ug2n on 2020/08/06.
//  Copyright © 2020 jinji. All rights reserved.
//

import Foundation
import UIKit

class CustomTapGestureRecognizer: UITapGestureRecognizer {
    var myButton: UIButton!
}


class RippleButton {
    

  
    
    
    func getTap(getButton: UIButton){
       let tap = CustomTapGestureRecognizer(target: self, action: #selector(tap(_:)))
       tap.myButton = getButton
       
    //    CustomTapGestureRecognizer(target: <#T##Any?#>, acㅇtion: <#T##Selector?#>)
       getButton.layer.masksToBounds = true
        getButton.addGestureRecognizer(tap)
       
    }
    
    
    
    
    
    
    
    @objc func tap(_ recognizer: CustomTapGestureRecognizer) {
        let hitPoint = recognizer.location(in: recognizer.myButton)
        let rippleEffectLayer = CALayer()
        rippleEffectLayer.frame = CGRect(x: hitPoint.x - 5, y: hitPoint.y - 5, width: 3, height: 3)
        rippleEffectLayer.cornerRadius = rippleEffectLayer.frame.height / 2
        rippleEffectLayer.masksToBounds = true
        rippleEffectLayer.backgroundColor = UIColor(white: 1.0, alpha: 0.4).cgColor
        rippleEffectLayer.zPosition = 1.0
        recognizer.myButton!.layer.addSublayer(rippleEffectLayer)
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
        
        print("tap!")
        
    }
    
}
