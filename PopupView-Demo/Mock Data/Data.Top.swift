//
//  Data.Top.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation
import MijickPopups

extension Data {
    enum Top: String, MockData { case alert, notification }
}
extension Data.Top {
    var title: String {
        switch self {
            case .alert: return "WhatsApp Style"
            case .notification: return "Standard Notification"
        }
    }
    var description: String {
        switch self {
            case .alert: return "Popup that opens on the top of your app. Ignores safe area"
            case .notification: return "Standard notification window"
        }
    }
    var popup: any Popup {
        switch self {
            case .alert: return TopPopup_Alert()
            case .notification: return TopPopup_Notification()
        }
    }
}
