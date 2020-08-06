//
//  Nav1.swift
//  UXTestApp
//
//  Created by 2ug2n on 2020/08/06.
//  Copyright © 2020 jinji. All rights reserved.
//

import Foundation

import UIKit

class Nav1: UIViewController {
    
    @IBAction func moveByNavy(_ sender: Any) {
        //다음 화면의 뷰 컨트롤러를 가져온다

        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else{
            return
        }
        self.navigationController?.pushViewController(uvc, animated: true)
    }
}
