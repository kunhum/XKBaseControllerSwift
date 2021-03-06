//
//  XKBaseTabbarController.swift
//  Pods-XKBaseControllerSwift_Example
//
//  Created by Nicholas on 2020/5/25.
//

import UIKit

class XKBaseTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        xk_updateTabBarItem()
        
        if let backgroundImage = XKBaseControllerConfig.xk_shareConfig.tabbarBackgroundImage {
            tabBar.backgroundImage = backgroundImage
        }
        if let barTintColor = XKBaseControllerConfig.xk_shareConfig.tabbarBarTintColor {
            tabBar.barTintColor = barTintColor
        }
        if let tintColor = XKBaseControllerConfig.xk_shareConfig.tabbarTintColor {
            tabBar.tintColor = tintColor
        }
        
    }
    
    public func xk_updateTabBarItem() {
        
        guard let items = tabBar.items else { return }
        
        for item in items {
            
            item.image         = item.image?.withRenderingMode(.alwaysOriginal)
            item.selectedImage = item.selectedImage?.withRenderingMode(.alwaysOriginal)
            if #available(iOS 10.0, *) {
                item.badgeColor    = XKBaseControllerConfig.xk_shareConfig.tabbarBadgeColor
            } else {
                // Fallback on earlier versions
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
