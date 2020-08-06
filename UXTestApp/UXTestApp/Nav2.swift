//
//  Nav2.swift
//  UXTestApp
//
//  Created by 2ug2n on 2020/08/06.
//  Copyright © 2020 jinji. All rights reserved.
//

import Foundation
import UIKit

class Nav2 : UIViewController{
    
    @IBAction func back(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
    @IBAction func next(_ sender: Any) {
        //다음 화면의 뷰 컨트롤러를 가져온다

        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "ThirdVC") else{
            return
        }
        self.navigationController?.pushViewController(uvc, animated: true)
    }
}
