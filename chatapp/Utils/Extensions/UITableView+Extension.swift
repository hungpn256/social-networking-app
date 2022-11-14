//
//  UITableView+Extension.swift
//  chatapp
//
//  Created by HungPN on 10/11/2022.
//

import Foundation
import UIKit

protocol ReuseIdentifier: AnyObject {
    
}
extension ReuseIdentifier where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

protocol NibLoadableView: AnyObject {
    
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
    
}

extension UICollectionReusableView: ReuseIdentifier {
    
}

extension UITableViewCell: ReuseIdentifier, NibLoadableView {
    
}

extension UITableViewHeaderFooterView: ReuseIdentifier {
    
}


// UITableView Register
extension UITableView {
    
    func registerHeaderNib<T: UITableViewHeaderFooterView>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        print(T.reuseIdentifier, T.reuseIdentifier)
        register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerNib<T: UITableViewCell>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        print(T.nibName, T.reuseIdentifier)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T? {
        let identifier = String(describing: T.self)
        let view = dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if let typedView = view as? T {
            return typedView
        }
        return nil
    }
    
    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(of class: T.Type) -> T? {
        let view = dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier)
        if let typedView = view as? T {
            return typedView
        }
        return nil
    }
}
