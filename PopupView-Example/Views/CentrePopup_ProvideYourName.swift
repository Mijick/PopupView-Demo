//
//  CentrePopup_ProvideYourName.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import PopupView

struct CentrePopup_ProvideYourName: CentrePopup {
    @State private var name: String = ""
    @FocusState private var textFieldFocused


    func configurePopup(popup: CentrePopupConfig) -> CentrePopupConfig {
        popup
            .horizontalPadding(16)
            .cornerRadius(14)
    }
    func createContent() -> some View {
        VStack(spacing: 0) {
            Spacer.height(24)
            createIllustration()
            Spacer.height(20)
            createHeader()
            Spacer.height(8)
            createTextField()
            Spacer.height(32)
            createSaveButton()
            Spacer.height(24)
        }
        .onAppear(perform: onAppear)
    }
}

private extension CentrePopup_ProvideYourName {
    func createIllustration() -> some View {
        Image("dotty-1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 100)
    }
    func createHeader() -> some View {
        Text("Welcome,")
            .font(.interBold(18))
            .foregroundColor(.onBackgroundPrimary)
    }
    func createTextField() -> some View {
        TextField("Your name", text: $name)
            .font(.interBold(24))
            .foregroundColor(.onBackgroundPrimary)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity)
            .focused($textFieldFocused)
    }
    func createSaveButton() -> some View {
        Button(action: dismiss) {
            Text("Save")
                .font(.interBold(15))
                .foregroundColor(.white)
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity)
                .background(Color.primary)
                .cornerRadius(8)
                .padding(.horizontal, 24)
        }
    }
}

private extension CentrePopup_ProvideYourName {
    func onAppear() {
        textFieldFocused = true
    }
}
