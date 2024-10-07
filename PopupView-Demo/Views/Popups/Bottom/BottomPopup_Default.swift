//
//  BottomPopup_Default.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickPopups

struct BottomPopup_Default: BottomPopup {
    var body: some View {
        VStack(spacing: 0) {
            createIllustration()
            Spacer.height(16)
            createTitle()
            Spacer.height(8)
            createDescription()
            Spacer.height(24)
            createButton()
        }
        .padding(.top, 12)
        .padding(.bottom, 4)
        .padding(.horizontal, 28)
    }
}

private extension BottomPopup_Default {
    func createIllustration() -> some View {
        Image("grad-1")
            .resizable()
            .frame(120)
    }
    func createTitle() -> some View {
        Text("Free Ride?")
            .font(.spaceGrotesk(22))
            .foregroundColor(.onBackgroundPrimary)
    }
    func createDescription() -> some View {
        Text("Mollit in nisi eiusmod enim enim proident id occaecat sunt est nulla. Nisi nisi dolor consectetur dolore pariatur.")
            .font(.openSansRegular(14.5))
            .foregroundColor(.onBackgroundSecondary)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 8)
            .fixedSize(horizontal: false, vertical: true)
    }
    func createButton() -> some View {
        Button(action: onButtonTap) {
            Text("Unlock")
                .font(.satoshiBold(14.5))
                .foregroundColor(.white)
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity)
                .background(Color.onBackgroundPrimary)
                .mask(Capsule())
        }
    }
}

private extension BottomPopup_Default {
    func onButtonTap() {
        BottomPopup_PrivacyInfo().present()
    }
}
