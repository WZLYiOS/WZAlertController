//
//  UIAlertController+.swift
//  WZLY
//
//  Created by qiuqixiang on 2019/10/23.
//  Copyright © 2019 我主良缘. All rights reserved.
//

import UIKit
import Foundation

/// MARK - UIAlertController +
public extension UIAlertController {
    
    /// 提示框(取消就是传-1)
    /// - Parameter vc: 显示警报的视图控制器
    /// - Parameter title: 标题
    /// - Parameter message: 消息
    /// - Parameter attributedMessage: 富文本消息
    /// - Parameter textAlignment: 文本对其方式
    /// - Parameter preferredStyle: 弹出样式
    /// - Parameter cancelAction: 取消事件
    /// - Parameter actions: 其他事件
    /// - Parameter tintColor: tintColor
    /// - Parameter handler: handler description
    static func wz_show<Action: CustomStringConvertible>(in vc: UIViewController = UIAlertController.getTopViewController(),
                                                      title: String? = nil,
                                                      message: String? = nil,
                                                      attributedMessage: NSAttributedString? = nil,
                                                      textAlignment: NSTextAlignment = .center,
                                                      preferredStyle: UIAlertController.Style = .alert,
                                                      cancelAction: Action? = nil,
                                                      actions: [Action]? = nil,
                                                      tintColor: UIColor? = nil,
                                                      handler: ((_ action: Action, _ index: Int) -> Void)? = nil) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        alertView.wz_show(in: vc,
                          attributedMessage: attributedMessage,
                          textAlignment: textAlignment,
                          preferredStyle: preferredStyle,
                          cancelAction: cancelAction,
                          actions: actions,
                          tintColor: tintColor, handler: handler)
    }
    
    
    /// 提示框(取消就是传-1)
    /// - Parameter vc: 显示警报的视图控制器
    /// - Parameter attributedMessage: 富文本消息
    /// - Parameter textAlignment: 文本对其方式
    /// - Parameter preferredStyle: 弹出样式
    /// - Parameter cancelAction: 取消事件
    /// - Parameter actions: 其他事件
    /// - Parameter tintColor: tintColor
    /// - Parameter handler: handler description
    private func wz_show<Action : CustomStringConvertible>(in vc: UIViewController,
                                                        attributedMessage: NSAttributedString? = nil,
                                                        textAlignment: NSTextAlignment = .center,
                                                        preferredStyle: UIAlertController.Style = .alert,
                                                        cancelAction: Action? = nil,
                                                        actions: [Action]? = nil,
                                                        tintColor: UIColor? = nil,
                                                        handler: ((_ action: Action, _ index: Int) -> Void)? = nil) {
        
        let alertView = self
        
        if let temAttributedMessage = attributedMessage {
            /// 设置自定义Message的NSAttributedString (attributedTitle)
            alertView.setValue(temAttributedMessage, forKey: "attributedMessage")
        }
        
        if let temCancel = cancelAction {
            alertView.addAction(UIAlertAction(title: temCancel.description, style: UIAlertAction.Style.cancel, handler: { _ in
                handler?(temCancel, -1)
            }))
        }
        
        if let temAction = actions {
            
            for (index, action) in temAction.enumerated() {
                alertView.addAction(UIAlertAction(title: action.description, style: .default) { _ in
                    handler?(action, index)
                })
            }
        }
        
        /// 设置文本对其方式
        if let message = alertView.view.subviews[0]
            .subviews[0]
            .subviews[0]
            .subviews[0]
            .subviews[0]
            .subviews[1] as? UILabel {
            message.textAlignment = textAlignment
        }
        
        /// 设置关闭按钮或者其他的按钮的颜色
        if let color = tintColor {
            alertView.view.tintColor = color
        }
        DispatchQueue.main.async {
            vc.present(self, animated: true, completion: nil)
        }
    }
    
    /// 获取控制器
    static func getTopViewController() -> UIViewController {
          var rootViewController: UIViewController?
          for wind in UIApplication.shared.windows {
              
              if let vc = wind.rootViewController {
                  rootViewController = vc
                  break
              }
          }
          return rootViewController!
      }
}

// MARK - 针对oc封装
@objc public extension UIAlertController {
    
    /// 系统显示框，oc版本
    /// - Parameters:
    ///   - title: <#title description#>
    ///   - message: <#message description#>
    ///   - attributedMessage: <#attributedMessage description#>
    ///   - textAlignment: <#textAlignment description#>
    ///   - preferredStyle: <#preferredStyle description#>
    ///   - cancelAction: <#cancelAction description#>
    ///   - actions: <#actions description#>
    ///   - tintColor: <#tintColor description#>
    ///   - handler: <#handler description#>
     @objc static func wz_ocShow(title: String? = nil,
                        message: String? = nil,
                        attributedMessage: NSAttributedString? = nil,
                        textAlignment: NSTextAlignment = .center,
                        preferredStyle: UIAlertController.Style = .alert,
                        cancelAction: String? = nil,
                        actions: [String]? = nil,
                        tintColor: UIColor? = nil,
                        handler: ((_ custom: String, _ index: Int) -> Void)? = nil) {
        self.wz_show(in: UIAlertController.getTopViewController(),
                     title: title,
                     message: message,
                     attributedMessage: attributedMessage,
                     textAlignment: textAlignment,
                     preferredStyle: preferredStyle,
                     cancelAction: cancelAction,
                     actions: actions, tintColor: tintColor) { (custom, index) in
            handler?(custom, index)
        }
    }
        
    ///  简化版本
    /// - Parameters:
    ///   - title: <#title description#>
    ///   - message: <#message description#>
    ///   - preferredStyle: <#preferredStyle description#>
    ///   - cancelAction: <#cancelAction description#>
    ///   - actions: <#actions description#>
    ///   - handler: <#handler description#>
    @objc static func wz_ocShowAlert(title: String? = nil,
                                message: String? = nil,
                                cancelAction: String? = nil,
                                actions: [String]? = nil,
                                handler: ((_ custom: String, _ index: Int) -> Void)? = nil) {
        self.wz_ocShow(title: title, message: message, attributedMessage: nil, textAlignment: .center, preferredStyle: .alert, cancelAction: cancelAction, actions: actions, tintColor: nil, handler: handler)
    }
    
    ///  简化版本
    /// - Parameters:
    ///   - title: <#title description#>
    ///   - message: <#message description#>
    ///   - preferredStyle: <#preferredStyle description#>
    ///   - cancelAction: <#cancelAction description#>
    ///   - actions: <#actions description#>
    ///   - handler: <#handler description#>
    @objc static func wz_ocShowActionSheet(title: String? = nil,
                                message: String? = nil,
                                cancelAction: String? = nil,
                                actions: [String]? = nil,
                                handler: ((_ custom: String, _ index: Int) -> Void)? = nil) {
        self.wz_ocShow(title: title, message: message, attributedMessage: nil, textAlignment: .center, preferredStyle: .actionSheet, cancelAction: cancelAction, actions: actions, tintColor: nil, handler: handler)
    }
}
