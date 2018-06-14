//
//  CostumNavgationClass.swift
//  MakeItHappen
//
//  Created by Shannen Bravo-Brown on 6/14/18.
//  Copyright © 2018 Shannen Bravo-Brown. All rights reserved.
//

import UIKit
class CostumNavigationBar: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
    }
}
