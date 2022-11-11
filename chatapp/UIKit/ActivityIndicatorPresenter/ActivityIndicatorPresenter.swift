//
//  ActivityIndicatorPresenter.swift
//  chatapp
//
//  Created by HungPN on 11/11/2022.
//

import UIKit

let presenterIdentifier = "ActivityIndicatorViewContainer"

final class ActivityIndicatorPresenter {

    static func show() {
        let activityIndicatorView = ActivityIndicatorView(frame: UIScreen.main.bounds)
        activityIndicatorView.restorationIdentifier = presenterIdentifier

        guard let keyWindow = UIApplication.shared.currentWindow else { return }
        let screenSize: CGRect = UIScreen.main.bounds
        let backgroundIndicatorView = UIView(frame: screenSize)
        backgroundIndicatorView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        backgroundIndicatorView.restorationIdentifier = presenterIdentifier
        backgroundIndicatorView.addSubview(activityIndicatorView)
        keyWindow.addSubview(backgroundIndicatorView)
        // Add constraints for `containerView`.
        ({
            let leadingConstraint = NSLayoutConstraint(item: keyWindow, attribute: .leading, relatedBy: .equal, toItem: activityIndicatorView, attribute: .leading, multiplier: 1, constant: 0)
            let trailingConstraint = NSLayoutConstraint(item: keyWindow, attribute: .trailing, relatedBy: .equal, toItem: activityIndicatorView, attribute: .trailing, multiplier: 1, constant: 0)
            let topConstraint = NSLayoutConstraint(item: keyWindow, attribute: .top, relatedBy: .equal, toItem: activityIndicatorView, attribute: .top, multiplier: 1, constant: 0)
            let bottomConstraint = NSLayoutConstraint(item: keyWindow, attribute: .bottom, relatedBy: .equal, toItem: activityIndicatorView, attribute: .bottom, multiplier: 1, constant: 0)

            keyWindow.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
        }())
    }

    static func hide() {
        for window in UIApplication.shared.windows {
            for item in window.subviews
            where item.restorationIdentifier == presenterIdentifier {
                item.removeFromSuperview()
            }
        }
    }
}

