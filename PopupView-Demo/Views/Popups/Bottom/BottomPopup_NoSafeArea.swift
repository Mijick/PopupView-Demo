//
//  BottomPopup_NoSafeArea.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickPopups

struct BottomPopup_NoSafeArea: BottomPopup {
    func configurePopup(popup: BottomPopupConfig) -> BottomPopupConfig {
        popup
            .ignoreSafeArea(edges: .bottom)
            .cornerRadius(0)
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            createTitle()
            Spacer.height(12)
            createDescription()
            Spacer.height(28)
            createButton()
        }
        .padding(.top, 32)
    }
}

private extension BottomPopup_NoSafeArea {
    func createTitle() -> some View {
        Text("Customisation options are almost* endless")
            .font(.spaceGrotesk(22))
            .foregroundColor(.onBackgroundPrimary)
            .multilineTextAlignment(.leading)
            .padding(.leading, 28)
            .padding(.trailing, 32)
            .fixedSize(horizontal: false, vertical: true)
    }
    func createDescription() -> some View {
        Text("Proident adipisicing labore consectetur tempor eiusmod ullamco enim adipisicing eiusmod.")
            .font(.openSansRegular(14.5))
            .foregroundColor(.onBackgroundSecondary)
            .multilineTextAlignment(.leading)
            .padding(.leading, 28)
            .padding(.trailing, 48)
            .fixedSize(horizontal: false, vertical: true)
    }
    func createButton() -> some View {
        Button(action: onButtonTap) {
            Text("Show".uppercased())
                .font(.spaceGrotesk(14.5))
                .foregroundColor(.white)
                .padding(.top, 20)
                .padding(.bottom, Screen.safeArea.bottom + 4)
                .frame(maxWidth: .infinity)
                .background(Color.primary)
        }
    }
}

private extension BottomPopup_NoSafeArea {
    func onButtonTap() {
        BottomPopup_NoCornerRadius().present()
    }
}
