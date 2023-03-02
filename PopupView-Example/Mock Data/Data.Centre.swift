//
//  Data.Centre.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation
import PopupView

extension Data {
    enum Centre: String, MockData { case unlockNewFeatures }
}
extension Data.Centre {
    var title: String {
        switch self {
            case .unlockNewFeatures: return "Default"
        }
    }
    var description: String {
        switch self {
            case .unlockNewFeatures: return "Standard width, typical popup that appears in the middle of your app"
        }
    }
    var popup: any Popup {
        switch self {
            case .unlockNewFeatures: return CentrePopup_UnlockNewFeatures()
        }
    }
}
