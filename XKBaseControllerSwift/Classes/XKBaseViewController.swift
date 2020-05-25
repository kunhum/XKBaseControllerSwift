//
//  XKBaseViewController.swift
//  XKBaseControllerSwift
//
//  Created by Nicholas on 2020/4/15.
//

import UIKit

public class XKBaseViewController: UIViewController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.isTranslucent = true
        
        if navigationItem.rightBarButtonItem != nil {
            navigationItem.rightBarButtonItem?.image = navigationItem.rightBarButtonItem?.image?.withRenderingMode(.alwaysOriginal)
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            self.xk_configView()
        }
    }
    
    //MARK: view did load 之后下一帧执行
    public func xk_configView() {
        
    }
    //MARK: 显示导航栏下的黑线
    public func xk_showNavigationBarBlackLine() {
        if let navigationBar = navigationController?.navigationBar {
            findBlackLine(containerView: navigationBar as UIView)?.isHidden = false
        }
    }
    //MARK: 隐藏导航栏下的黑线
    public func xk_hideNavigationBarBlackLine() {
        if let navigationBar = navigationController?.navigationBar {
            findBlackLine(containerView: navigationBar as UIView)?.isHidden = true
        }
    }
    
    //MARK: - 私有
    func findBlackLine(containerView: UIView) -> UIImageView? {
        
        if className(anyClass: containerView.classForCoder) == "UIImageView" && containerView.bounds.height <= 1.0 {
            
            return containerView as? UIImageView
        }
        
        for subView in containerView.subviews {
            if let imageView = findBlackLine(containerView: subView) {
                return imageView
            }
            
        }
        return nil
    }
    
    func className(anyClass: AnyClass) -> String {
        return String(describing: anyClass)
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
