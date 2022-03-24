//
//  PDTabBarController.swift
//  Split
//
//  Created by Perjan Duro on 23.03.22.
//

import UIKit

class PDTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
        viewControllers = [
            sceneDelegate.supplementaryNavVC
        ]
    }
    
    deinit {
        fatalError()
    }

}
