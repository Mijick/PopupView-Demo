//
//  BottomPopup_Document.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickPopups

struct BottomPopup_Document: BottomPopup {
    func configurePopup(popup: BottomPopupConfig) -> BottomPopupConfig {
        popup
            .changeHeightMode(.large)
            .dragGestureEnabled(false)
    }
    func createContent() -> some View {
        VStack(spacing: 0) {
            createBar()
            Spacer.height(24)
            createScrollView()
            Spacer()
            createConfirmButton()
        }
        .padding(.top, 20)
        .padding(.bottom, 8)
    }
}

private extension BottomPopup_Document {
    func createBar() -> some View {
        Capsule()
            .fill(Color.onBackgroundTertiary)
            .frame(width: 32, height: 6)
            .alignHorizontally(.center)
    }
    func createScrollView() -> some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 32) {
                createScrollViewText("Alea")
                createScrollViewText("Iacta")
                createScrollViewText("Est")
            }
        }
    }
    func createConfirmButton() -> some View {
        Button(action: dismiss) {
            Text("Confirm")
                .font(.interBold(13))
                .foregroundColor(.white)
                .frame(height: 44)
                .frame(maxWidth: .infinity)
                .background(Color.primary)
                .cornerRadius(8)
                .padding(.horizontal, 28)
        }
    }
}

private extension BottomPopup_Document {
    func createScrollViewText(_ text: String) -> some View {
        Text(text)
            .font(.interRegular(16))
            .foregroundColor(.onBackgroundPrimary)
    }
}
