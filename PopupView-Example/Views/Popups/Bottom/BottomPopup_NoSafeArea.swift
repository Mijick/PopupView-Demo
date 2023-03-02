//
//  BottomPopup_NoSafeArea.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import PopupView

struct BottomPopup_NoSafeArea: BottomPopup {
    let id: String


    func configurePopup(popup: BottomPopupConfig) -> BottomPopupConfig {
        popup
            .contentIgnoresSafeArea(true)
            .activePopupCornerRadius(0)
            .stackedPopupsCornerRadius(0)
    }
    func createContent() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            createTitle()
            Spacer.height(12)
            createDescription()
            Spacer.height(32)
            createButton()
        }
        .padding(.top, 36)
    }
}

private extension BottomPopup_NoSafeArea {
    func createTitle() -> some View {
        Text("Customisation options are almost* endless")
            .font(.spaceGrotesk(24))
            .foregroundColor(.onBackgroundPrimary)
            .multilineTextAlignment(.leading)
            .padding(.leading, 24)
            .padding(.trailing, 32)
            .fixedSize(horizontal: false, vertical: true)
    }
    func createDescription() -> some View {
        Text("Proident adipisicing labore consectetur tempor eiusmod ullamco enim adipisicing eiusmod.")
            .font(.openSansRegular(15))
            .foregroundColor(.onBackgroundSecondary)
            .multilineTextAlignment(.leading)
            .padding(.leading, 24)
            .padding(.trailing, 48)
            .fixedSize(horizontal: false, vertical: true)
    }
    func createButton() -> some View {
        Text("Show".uppercased())
            .font(.spaceGrotesk(15))
            .foregroundColor(.white)
            .padding(.top, 20)
            .padding(.bottom, UIScreen.safeArea.bottom)
            .frame(width: UIScreen.width)
            .background(Color.primary)
            .onTapGesture(perform: BottomPopup_NoSafeArea(id: .random).present)
    }
}
