//
//  SceneDelegate.swift
//  UISPlitViewController-programmatically
//
//  Created by REVE Systems on 9/9/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        let masterVC = MasterViewController(nibName: "MasterViewController", bundle: nil)
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        let masterNav = UINavigationController(rootViewController: masterVC)
        let detailNav = UINavigationController(rootViewController: detailVC)
        let splitViewController = UISplitViewController()
        splitViewController.viewControllers = [masterNav, detailNav]
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            splitViewController.preferredDisplayMode = .allVisible
        } else {
            splitViewController.preferredDisplayMode = .oneBesideSecondary
            splitViewController.delegate = self
        }
        
        let firstMonster = masterVC.monsters.first
        detailVC.monster = firstMonster
        
        window?.rootViewController = splitViewController
        window?.makeKeyAndVisible()
    }
}

extension SceneDelegate: UISplitViewControllerDelegate {

    func splitViewController(_ svc: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController,
                             onto primaryViewController: UIViewController) -> Bool {
        // This makes the Master appear first on iPhone and hides the Detail unless selected
        if UIDevice.current.userInterfaceIdiom == .phone {
            // You could check the detail view for empty state and return true if needed.
            return true // Collapse the detail into the master
        }
        return false
    }
}

