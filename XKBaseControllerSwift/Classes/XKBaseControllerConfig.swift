   //
//  XKBaseController.swift
//  XKBaseControllerSwift_Example
//
//  Created by Nicholas on 2020/4/15.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

///配置类
public class XKBaseControllerConfig {
    
    public static let xk_shareConfig = XKBaseControllerConfig()
    
    ///tabbar背景图
    public var tabbarBackgroundImage: UIImage?
    ///tabbar bar tint color
    public var tabbarBarTintColor: UIColor?
    ///tabbar tint color
    public var tabbarTintColor: UIColor?
    ///tabbar 角标颜色 badge color
    public var tabbarBadgeColor: UIColor?
    ///导航栏返回按钮图片
    public var navigationBarBackButtonImage: UIImage?
    ///返回手势要忽略的类
    public var navigationBarBackGestureIgnoredClass: [AnyClass]?
    
    /// 设置tabbar背景图
    ///
    /// - Parameter backgroundImage: 背景图
    public static func xk_setTabbarBackgroundImage(backgroundImage: UIImage) {
        xk_shareConfig.tabbarBackgroundImage = backgroundImage
    }
    
    /// 设置tabbar bar tint color
    ///
    /// - Parameter barTintColor: 颜色
    public static func xk_setTabbarBarTintColor(barTintColor: UIColor) {
        xk_shareConfig.tabbarBarTintColor = barTintColor
    }
    
    /// 设置tabbar tint color
    ///
    /// - Parameter tintColor: 颜色
    public static func xk_setTabbarTintColor(tintColor: UIColor) {
        xk_shareConfig.tabbarTintColor = tintColor
    }
    
    /// 设置tabbar 角标颜色, ios 10之后起作用
    ///
    /// - Parameter badgeColor: 颜色
    public static func xk_setTabbarItemBadgeColor(badgeColor: UIColor) {
        xk_shareConfig.tabbarBadgeColor = badgeColor
    }
    
    //MARK: - navigation controller
    
    /// 设置导航栏返回按钮图片
    ///
    /// - Parameter backButtonImage: 图片
    public static func xk_setNavigationBarBackButtonImage(backButtonImage: UIImage) {
        xk_shareConfig.navigationBarBackButtonImage = backButtonImage
    }
    
    /// 设置返回手势要忽略的类
    ///
    /// - Parameter ignoredClass: 类数组
    public static func xk_setNavigationBarBackGestureIgnoredClass(ignoredClass: [AnyClass]) {
        xk_shareConfig.navigationBarBackGestureIgnoredClass = ignoredClass
    }
    
}

