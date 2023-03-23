//
//  BottomPopup_Default.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import PopupView

struct BottomPopup_Default: BottomPopup {
    let id: String


    func configurePopup(popup: BottomPopupConfig) -> BottomPopupConfig { popup }
    func createContent() -> some View {
        VStack(spacing: 0) {
            createIllustration()
            Spacer.height(20)
            createTitle()
            Spacer.height(12)
            createDescription()
            Spacer.height(28)
            createButton()
        }
        .padding(.top, 16)
        .padding(.bottom, 12)
        .padding(.horizontal, 36)
    }
}

private extension BottomPopup_Default {
    func createIllustration() -> some View {
        Image("grad-1")
            .resizable()
            .frame(132)
    }
    func createTitle() -> some View {
        Text("Free Ride?")
            .font(.spaceGrotesk(24))
            .foregroundColor(.onBackgroundPrimary)
    }
    func createDescription() -> some View {
        Text("Elit qui cupidatat deserunt do in amet eiusmod aute in officia do irure.")
            .font(.openSansRegular(15))
            .foregroundColor(.onBackgroundSecondary)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
    }
    func createButton() -> some View {
        Button(action: Self(id: .random).present) {
            Text("Unlock")
                .font(.satoshiBold(15))
                .foregroundColor(.white)
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                .background(Color.onBackgroundPrimary)
                .cornerRadius(8)
        }
    }
}
