//
//  CustomerElement.swift
//  InterviewProject
//
//  Created by Peter on 2021/6/20.
//

import Foundation
import UIKit

//MARK:- BorderView
@IBDesignable
class BorderView: UIView {
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = self.cornerRadius
        }
    }
}
