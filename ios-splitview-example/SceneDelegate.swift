//
//  SceneDelegate.swift
//  ios-splitview-example
//
//  Created by Simon Deutsch on 26.04.22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let ws = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: ws)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabVC = UITabBarController()

        let vc0 = SplitViewWrapper()
        vc0.tabBarItem = UITabBarItem(title: "split", image: UIImage(systemName: "square.and.arrow.up"), tag: 0)
        
        let vc1 = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc1.labelText = "placeholder"
        vc1.tabBarItem = UITabBarItem(title: "placeholder", image: UIImage(systemName: "pencil.circle"), tag: 1)
        
        tabVC.viewControllers = [vc0, vc1]
        
        let tvc = TableViewController()
        vc0.split.setViewController(tvc, for: .primary)
        vc0.split.setViewController(tvc.vc, for: .secondary)
        
        
        window.rootViewController = tabVC
        self.window = window
        window.makeKeyAndVisible()
    }
}

class SplitViewWrapper: UIViewController {

    let split = UISplitViewController(style: .doubleColumn)

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(split)
        view.addSubview(split.view)
    }
}
