//
//  BottomPopup_FileAdded.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import PopupView

struct BottomPopup_FileAdded: BottomPopup {
    func configurePopup(popup: BottomPopupConfig) -> BottomPopupConfig {
        popup
            .horizontalPadding(20)
            .bottomPadding(UIScreen.safeArea.bottom + 8)
            .activePopupCornerRadius(16)
            .stackedPopupsCornerRadius(4)
    }
    func createContent() -> some View {
        HStack(spacing: 0) {
            createText()
            Spacer()
            createButton()
        }
        .padding(.vertical, 20)
        .padding(.leading, 24)
        .padding(.trailing, 16)
    }
}

private extension BottomPopup_FileAdded {
    func createText() -> some View {
        VStack(alignment: .leading, spacing: 2) {
            createTextTitle()
            createTextDescription()
        }
    }
    func createButton() -> some View {
        Button(action: dismiss) {
            Text("Dismiss")
                .font(.spaceGrotesk(13))
                .foregroundColor(.white)
                .padding(.vertical, 12)
                .padding(.horizontal, 14)
                .background(Color.onBackgroundPrimary)
                .cornerRadius(8)
        }
    }
}

private extension BottomPopup_FileAdded {
    func createTextTitle() -> some View {
        Text("1 file added")
            .font(.spaceGrotesk(16))
            .foregroundColor(.onBackgroundPrimary)
    }
    func createTextDescription() -> some View {
        Text("1,017 KB · 200 GB Remaining")
            .font(.satoshiRegular(13))
            .foregroundColor(.onBackgroundSecondary)
    }
}
