//
//  CentrePopup_UnlockNewFeatures.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import PopupView

struct CentrePopup_UnlockNewFeatures: CentrePopup {
    func configurePopup(popup: CentrePopupConfig) -> CentrePopupConfig {
        popup.horizontalPadding(28)
    }
    func createContent() -> some View {
        VStack(spacing: 0) {
            createIllustration()
            Spacer.height(12)
            createTitle()
            Spacer.height(8)
            createDescription()
            Spacer.height(32)
            createButtons()
        }
        .padding(.top, 12)
        .padding(.bottom, 24)
        .padding(.horizontal, 24)
    }
}

private extension CentrePopup_UnlockNewFeatures {
    func createIllustration() -> some View {
        Image("grad-2")
            .resizable()
            .frame(160)
    }
    func createTitle() -> some View {
        Text("Unlock New Features")
            .font(.satoshiBlack(18))
            .foregroundColor(.onBackgroundPrimary)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
    }
    func createDescription() -> some View {
        Text("Proident adipisicing labore consectetur tempor eiusmod ullamco enim adipisicing eiusmod.")
            .font(.openSansRegular(14))
            .foregroundColor(.onBackgroundSecondary)
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
    }
    func createButtons() -> some View {
        HStack(spacing: 4) {
            createCancelButton()
            createUnlockButton()
        }
    }
}

private extension CentrePopup_UnlockNewFeatures {
    func createCancelButton() -> some View {
        Button(action: dismiss) {
            Text("Cancel")
                .font(.satoshiBold(14))
                .foregroundColor(.onBackgroundSecondary)
                .frame(height: 46)
                .frame(maxWidth: .infinity)
                .background(Color.onBackgroundTertiary)
                .cornerRadius(8)
        }
    }
    func createUnlockButton() -> some View {
        Button(action: CentrePopup_MoreFeatures().present) {
            Text("Unlock")
                .font(.satoshiBold(14))
                .foregroundColor(.white)
                .frame(height: 46)
                .frame(maxWidth: .infinity)
                .background(Color.onBackgroundPrimary)
                .cornerRadius(8)
        }
    }
}

extension CentrePopup_UnlockNewFeatures {
    var id: String { "unlock-new-features" }
}
