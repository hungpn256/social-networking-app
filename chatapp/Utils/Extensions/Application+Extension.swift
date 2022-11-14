//
//  Application+Extension.swift
//  chatapp
//
//  Created by HungPN on 11/11/2022.
//
import Foundation
import UIKit

extension UIApplication {
//    static var topSafeAreaHeight: CGFloat {
//        var topSafeAreaHeight: CGFloat = 0
//         if #available(iOS 11.0, *) {
//               let window = UIApplication.shared.windows[0]
//               let safeFrame = window.safeAreaLayoutGuide.layoutFrame
//               topSafeAreaHeight = safeFrame.minY
//             }
//        return topSafeAreaHeight
//    }

    var currentWindow: UIWindow? {
        connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
    }

    var isKeyboardPresented: Bool {
        if let keyboardWindowClass = NSClassFromString("UIRemoteKeyboardWindow"), self.windows.contains(where: { $0.isKind(of: keyboardWindowClass) }) {
            return true
        } else {
            return false
        }
    }
}
