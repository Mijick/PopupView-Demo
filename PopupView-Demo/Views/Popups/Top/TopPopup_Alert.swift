//
//  TopPopup_Alert.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickPopupView

struct TopPopup_Alert: TopPopup {
    func configurePopup(popup: TopPopupConfig) -> TopPopupConfig {
        popup
            .backgroundColour(.primary)
            .cornerRadius(0)
    }
    func createContent() -> some View {
        HStack(spacing: 0) {
            createImage()
            Spacer.width(12)
            createText()
            Spacer()
            createShowNextButton()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 24)
    }
}

private extension TopPopup_Alert {
    func createImage() -> some View {
        Image("placeholder-face")
            .resizable()
            .frame(40)
            .aspectRatio(contentMode: .fill)
            .mask(Circle())
    }
    func createText() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            createName()
            createMessage()
        }
    }
    func createShowNextButton() -> some View {
        Button(action: TopPopup_Notification().showAndStack as! () -> Void) {
            Text("Show next".uppercased())
                .font(.openSansBold(12.5))
                .foregroundColor(.white)
        }
    }
}

private extension TopPopup_Alert {
    func createName() -> some View {
        Text("John Clark")
            .font(.openSansBold(14))
            .foregroundColor(.white)
    }
    func createMessage() -> some View {
        Text("Great idea, let’s do it 🍄️")
            .font(.openSansRegular(12))
            .foregroundColor(.white.opacity(0.7))
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
    }
}
