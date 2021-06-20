//
//  Extension.swift
//  InterviewProject
//
//  Created by Peter on 2021/6/21.
//

import Foundation
import UIKit

private var navBarHolderViewKey = "navBarHolderViewKey"
private var navBarBackgroundViewKey = "navBarBackgroundViewKey"
private var navBarViewKey = "navBarViewKey"

extension UIViewController {
    
    fileprivate var navBarHolder: UIView? {
        set {
            objc_setAssociatedObject(self, &navBarHolderViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &navBarHolderViewKey) as? UIView
        }
    }
    
    var customNavigationBar: UINavigationBar? {
        set {
            objc_setAssociatedObject(self, &navBarViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &navBarViewKey) as? UINavigationBar
        }
    }
    
    fileprivate var navBarBackgroundView: UIView? {
        set {
            objc_setAssociatedObject(self, &navBarBackgroundViewKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &navBarBackgroundViewKey) as? UIView
        }
    }
    
    func setCustomNavigationBar(_ color: UIColor) {
        
        if customNavigationBar == nil {
            navigationController?.navigationBar.isHidden = true
            
            let statusBarHeight = UIApplication.shared.statusBarFrame.height
            let navigationBarHeight = (navigationController?.navigationBar.frame.height)!
            
            navBarHolder = UIView(frame: CGRect(x: 0, y: 0,
                                                width: view.frame.width,
                                                height: statusBarHeight + navigationBarHeight))
            navBarHolder?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            
            navBarBackgroundView = UIView(frame: navBarHolder!.frame)
            navBarBackgroundView?.backgroundColor = color
            navBarHolder?.addSubview(navBarBackgroundView!)
            
            let navBar = UINavigationBar(frame: CGRect(x: 0, y: statusBarHeight, width: view.frame.width, height: navigationBarHeight))
            navBar.setBackgroundImage(UIImage(), for: .default)
            navBar.shadowImage = UIImage()
            navBar.isTranslucent = true
            navBarHolder?.addSubview(navBar)
            view.addSubview(navBarHolder!)
            
            customNavigationBar = navBar
        }
    }

    func setCustomNavigationBarColor(alpha: CGFloat) {
        let backgroundView = self.customNavigationBar
        if(backgroundView != nil) {
            navBarBackgroundView?.alpha = alpha
            view.bringSubviewToFront(navBarHolder!)
        }
    }
    
    func restoreNavigationBar() {
        navigationController?.navigationBar.isHidden = false
    }
    
    func push(vc:UIViewController) {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        func pop(toRoot: Bool) {
            if toRoot {
                self.navigationController?.popToRootViewController(animated: true)
            } else {
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        func popTo(_ vc: UIViewController) {
            self.navigationController?.popToViewController(vc, animated: true)
        }
}
