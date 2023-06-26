//
//  BottomPopup_NoCornerRadius.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import PopupView

struct BottomPopup_NoCornerRadius: BottomPopup {
    func configurePopup(popup: PopupView.BottomPopupConfig) -> PopupView.BottomPopupConfig { popup.cornerRadius(0) }
    func createContent() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            createTitle()
            Spacer.height(16)
            createDescription()
            Spacer.height(36)
            createButtons()
        }
        .padding(.top, 32)
        .padding(.bottom, 12)
        .padding(.horizontal, 28)
    }
}

private extension BottomPopup_NoCornerRadius {
    func createTitle() -> some View {
        Text("Do you want to see another popup?")
            .font(.spaceGrotesk(22))
            .foregroundColor(.onBackgroundPrimary)
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
    }
    func createDescription() -> some View {
        Text("Proident adipisicing labore consectetur tempor eiusmod ullamco enim adipisicing eiusmod.")
            .font(.openSansRegular(14.5))
            .foregroundColor(.onBackgroundSecondary)
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
    }
    func createButtons() -> some View {
        HStack(spacing: 8) {
            createCancelButton()
            createShowButton()
        }
    }
}

private extension BottomPopup_NoCornerRadius {
    func createCancelButton() -> some View {
        Button(action: dismiss) {
            buttonLabel("Cancel")
                .foregroundColor(.onBackgroundPrimary)
                .border(Color.onBackgroundPrimary)
        }
    }
    func createShowButton() -> some View {
        Button(action: BottomPopup_Default().showAndStack) {
            buttonLabel("Show")
                .foregroundColor(.white)
                .background(Color.onBackgroundPrimary)
                .mask(Rectangle())
        }
    }
}

// MARK: -Button
fileprivate extension View {
    func buttonLabel(_ text: String) -> some View {
        Text(text.uppercased())
            .font(.spaceGrotesk(14))
            .padding(.vertical, 13)
            .frame(maxWidth: .infinity)
    }
}
