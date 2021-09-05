//
//  MainViewController+Extension.swift
//  SideMenu
//
//  Created by Анастасия Ларина on 05.09.2021.
//

import SafariServices
import UIKit

extension MainViewController: SideMenuViewControllerDelegate {
    func selectedCell(_ row: Int) {
        switch row {
        case 0:
            // Home
            self.showViewController(viewController: UINavigationController.self, storyboardId: "CatsNavID")
        case 1:
            // Music
            self.showViewController(viewController: UINavigationController.self, storyboardId: "StarNavID")
        case 2:
            // Movies
            self.showViewController(viewController: UINavigationController.self, storyboardId: "AllBreedNavID")
        case 3:
            // Movies
            self.showViewController(viewController: UINavigationController.self, storyboardId: "WeatherNavID")
        case 4:
            // Movies
            self.showViewController(viewController: UINavigationController.self, storyboardId: "NewsNavID")
        default:
            break
        }
        
        // Collapse side menu with animation
        DispatchQueue.main.async { self.sideMenuState(expanded: false) }
    }
    
    func showViewController<T: UIViewController>(viewController: T.Type, storyboardId: String) -> () {
        // Remove the previous View
        for subview in view.subviews {
            if subview.tag == 99 {
                subview.removeFromSuperview()
            }
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: storyboardId) as! T
        vc.view.tag = 99
        view.insertSubview(vc.view, at: self.revealSideMenuOnTop ? 0 : 1)
        addChild(vc)
        if !self.revealSideMenuOnTop {
            if isExpanded {
                vc.view.frame.origin.x = self.sideMenuRevealWidth
            }
            if self.sideMenuShadowView != nil {
                vc.view.addSubview(self.sideMenuShadowView)
            }
        }
        vc.didMove(toParent: self)
    }
}

extension MainViewController: UIGestureRecognizerDelegate {
    @objc func tapGestureRecognizerSelf(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            if self.isExpanded {
                self.sideMenuState(expanded: false)
            }
        }
    }
    
    // Close side menu when you tap on the shadow background view
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: self.sideMenuViewController.view))! {
            return false
        }
        return true
    }
}
