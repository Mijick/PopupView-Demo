//
//  CentrePopup_MoreFeatures.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import PopupView

struct CentrePopup_MoreFeatures: CentrePopup {
    func configurePopup(popup: CentrePopupConfig) -> CentrePopupConfig {
        popup.horizontalPadding(32)
    }
    func createContent() -> some View {
        VStack(spacing: 0) {
            createIllustration()
            Spacer.height(12)
            createTitle()
            Spacer.height(16)
            createDescription()
            Spacer.height(32)
            createButton()
        }
        .padding(.top, 12)
        .padding(.bottom, 24)
        .padding(.horizontal, 24)
    }
}

private extension CentrePopup_MoreFeatures {
    func createIllustration() -> some View {
        Image("grad-3")
            .resizable()
            .frame(120)
    }
    func createTitle() -> some View {
        Text("More Features")
            .font(.satoshiBlack(22))
            .foregroundColor(.onBackgroundPrimary)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
    }
    func createDescription() -> some View {
        Text("Esse anim aliqua cupidatat sint ea et id ea voluptate.")
            .font(.openSansRegular(15.5))
            .foregroundColor(.onBackgroundSecondary)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
    }
    func createButton() -> some View {
        Text("Back")
            .font(.satoshiBold(15))
            .foregroundColor(.onBackgroundSecondary)
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .background(Color.onBackgroundTertiary)
            .cornerRadius(8)
            .onTapGesture(perform: dismiss)
    }
}

extension CentrePopup_MoreFeatures {
    var id: String { "more-features" }
}
