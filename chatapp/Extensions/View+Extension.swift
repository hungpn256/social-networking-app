//
//  View+Extension.swift
//  chatapp
//
//  Created by HungPN on 10/11/2022.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set(value) {
            clipsToBounds = true
            layer.cornerRadius = value
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let borderColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: borderColor)
        }
        set(value) {
            layer.borderColor = value?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set(value) {
            layer.borderWidth = value
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set(value) {
            layer.shadowOffset = value
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set(value) {
            layer.shadowRadius = value
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set(value) {
            layer.shadowOpacity = value
        }
    }
    
    @IBInspectable var shadowColor: UIColor {
        get {
            return UIColor(cgColor: layer.shadowColor ?? UIColor.clear.cgColor)
        }
        set(value) {
            layer.shadowColor = value.cgColor
        }
    }
    
    @IBInspectable var masksToBounds: Bool {
        get {
            return layer.masksToBounds
        }
        set(value) {
            layer.masksToBounds = value
        }
    }
    
    func animationShow() {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseIn],
                          animations: {
                           self.center.y -= self.bounds.height
                           self.layoutIfNeeded()
           }, completion: nil)
           self.isHidden = false

       }

    func animationHidden() {
           UIView.animate(withDuration: 0.2, delay: 0, options: [.curveLinear],
                          animations: {
                           self.center.y += self.bounds.height
                           self.layoutIfNeeded()

           },  completion: {(_ completed: Bool) -> Void in
           self.isHidden = true
               })
       }
}
