//
//  SceneDelegate.swift
//  Split
//
//  Created by Perjan Duro on 23.03.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var tabBar: UITabBarController!
    
    var supplementaryNavVC: UINavigationController!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see 
        
//        windowScene.keyWindow?.rootViewController = root
//        windowScene.keyWindow?.makeKeyAndVisible()
        
        /// 1. Capture the scene
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        /// 2. Create a new UIWindow using the windowScene constructor which takes in a window scene.
        let window = UIWindow(windowScene: windowScene)
        
        /// 3. Create a view hierarchy programmatically
        let viewController = ViewController()
        viewController.view.backgroundColor = .red
        
        let primary = ViewController()
        primary.title = "Primary"
        primary.view.backgroundColor = .red
        
        let supplementary = ViewController()
        supplementary.title = "supplementary"
        supplementary.view.backgroundColor = .blue
        
        supplementaryNavVC = UINavigationController(rootViewController: supplementary)
        
        let secondary = ViewController()
        secondary.title = "secondary"
        secondary.view.backgroundColor = .yellow
        
        let split = UISplitViewController(style: .tripleColumn)
        split.preferredDisplayMode = .twoBesideSecondary
        //split.delegate = self
        
        split.setViewController(primary, for: .primary)
        split.setViewController(supplementaryNavVC, for: .supplementary)
        split.setViewController(secondary, for: .secondary)
        
        tabBar = PDTabBarController()
        
        split.setViewController(tabBar, for: .compact)
        
        /// 4. Set the root view controller of the window with your view controller
        window.rootViewController = split
        
        /// 5. Set the window and call makeKeyAndVisible()
        self.window = window
        window.makeKeyAndVisible()
    }
}
