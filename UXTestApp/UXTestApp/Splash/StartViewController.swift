//
//  StartViewController.swift
//  UXTestApp
//
//  Created by 2ug2n on 2020/08/06.
//  Copyright © 2020 jinji. All rights reserved.
//

import Foundation
import STCubeTransition
import UIKit

class StartViewController: UIViewController {
  
    var cubeTransition:CubeTransition!
    
    @IBOutlet weak var faceView: UIView!
    
    override func viewDidLoad() {
        
        let imageName = "logoBlue.png"
        let image = UIImage(named: imageName)
        let firstImageView = UIImageView(image: image)
        
        let imageName2 = "logoWhite.png"
        let image2 = UIImage(named: imageName2)
        let secondImageView = UIImageView(image: image2)
        
        
        firstImageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        faceView.addSubview(firstImageView)
        faceView.bringSubviewToFront(firstImageView)


        let secondView: UIView = UIView()
        secondImageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        secondView.addSubview(secondImageView)
        secondView.bringSubviewToFront(secondImageView)
        
        
        self.cubeTransition = CubeTransition()
        
        
        
        cubeTransition.translateView(faceView, toView: secondView, direction: .Right, duration: 0.5) { [weak self] (displayView) in
           
                
            self?.faceView = displayView
        }
        
        
    }
    
    
    
}
