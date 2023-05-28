//
//  Data.Bottom.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import Foundation
import PopupView

extension Data {
    enum Bottom: String, MockData { case fileAdded, editExpense, noCornerRadius, noSafeArea, `default`, privacyInfo }
}
extension Data.Bottom {
    var title: String {
        switch self {
            case .fileAdded: return "Small Bar"
            case .editExpense: return "Default with text field"
            case .noCornerRadius: return "Old Style"
            case .noSafeArea: return "No Safe Area"
            case .default: return "Default"
            case .privacyInfo: return "Smaller - Bigger"
        }
    }
    var description: String {
        switch self {
            case .fileAdded: return "Configuration that can be used to present short messages"
            case .editExpense: return "Goes up when keyboard appears"
            case .noCornerRadius: return "Another style - no corner radius"
            case .noSafeArea: return "No safe area; useful in some interface styles"
            case .default: return "Default interface style"
            case .privacyInfo: return "Smaller popup that opens a website within the app"
        }
    }
    var popup: any Popup {
        switch self {
            case .fileAdded: return BottomPopup_FileAdded()
            case .editExpense: return BottomPopup_EditExpense()
            case .noCornerRadius: return BottomPopup_NoCornerRadius(id: .random)
            case .noSafeArea: return BottomPopup_NoSafeArea(id: .random)
            case .default: return BottomPopup_Default(id: .random)
            case .privacyInfo: return BottomPopup_PrivacyInfo()
        }
    }
}
