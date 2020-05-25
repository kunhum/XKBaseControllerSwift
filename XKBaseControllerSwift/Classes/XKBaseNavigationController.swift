//
//  XKBaseNavigationController.swift
//  Pods-XKBaseControllerSwift_Example
//
//  Created by Nicholas on 2020/4/15.
//

import UIKit

public class XKBaseNavigationController: UINavigationController {
    
    var xk_shouldAutorotate = false

    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //重写代理方法，使自定义返回控件是返回手势有效
        interactivePopGestureRecognizer?.delegate = self
        
        //修改tab bar item的数据
        tabBarItem.selectedImage = tabBarItem.selectedImage?.withRenderingMode(.alwaysOriginal)
        
    }
    
    //MARK: - 重写系统方法，修改返回按键样式
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if childViewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            
            if var backImage = XKBaseControllerConfig.xk_shareConfig.navigationBarBackButtonImage {
                
                backImage = backImage.withRenderingMode(.alwaysOriginal)
                
                let leftItem = UIBarButtonItem(image: backImage, style: .plain, target: self, action: #selector(handleBackButton))
                
                viewController.navigationItem.leftBarButtonItem = leftItem
            }
            
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    @objc func handleBackButton() {
        popViewController(animated: true)
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

extension XKBaseNavigationController : UIGestureRecognizerDelegate {
    
    //MARK: - UIGestureRecognizerDelegate
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        guard let topController = topViewController else {
            return childViewControllers.count > 1
        }
        guard let classArr = XKBaseControllerConfig.xk_shareConfig.navigationBarBackGestureIgnoredClass else { return  childViewControllers.count > 1}
        
        for classObject in classArr {
           
            let currentClass  = NSStringFromClass(topController.classForCoder)
            let comparedClass = NSStringFromClass(classObject)
            
            if currentClass == comparedClass {
                return false
            }
        }
        
        return childViewControllers.count > 1
        
    }
}
