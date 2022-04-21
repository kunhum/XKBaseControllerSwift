//
//  XKBaseTabbarController.swift
//  Pods-XKBaseControllerSwift_Example
//
//  Created by Nicholas on 2020/5/25.
//

import UIKit

open class XKTabbarController: UITabBarController {

    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        xk_updateTabBarItem()
        
        if let backgroundImage = XKControllerConfig.xk_shareConfig.tabbarBackgroundImage {
            tabBar.backgroundImage = backgroundImage
        }
        if let barTintColor = XKControllerConfig.xk_shareConfig.tabbarBarTintColor {
            tabBar.barTintColor = barTintColor
        }
        if let tintColor = XKControllerConfig.xk_shareConfig.tabbarTintColor {
            tabBar.tintColor = tintColor
        }
        
    }
    
}

public extension XKTabbarController {
    
    func xk_updateTabBarItem() {
        
        guard let items = tabBar.items else { return }
        
        for item in items {
            
            item.image         = item.image?.withRenderingMode(.alwaysOriginal)
            item.selectedImage = item.selectedImage?.withRenderingMode(.alwaysOriginal)
            if #available(iOS 10.0, *) {
                item.badgeColor    = XKControllerConfig.xk_shareConfig.tabbarBadgeColor
            } else {
                // Fallback on earlier versions
            }
        }
    }
}
