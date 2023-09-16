//
//  BottomPopup_EditExpense.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickPopupView

struct BottomPopup_EditExpense: BottomPopup {
    @State private var note: String = ""


    func configurePopup(popup: BottomPopupConfig) -> BottomPopupConfig { popup.distanceFromKeyboard(12) }
    func createContent() -> some View {
        VStack(spacing: 0) {
            createTopView()
            Spacer.height(24)
            createMiddleView()
            Spacer.height(40)
            createButtons()
        }
        .padding(.top, 12)
        .padding(.bottom, 4)
    }
}

private extension BottomPopup_EditExpense {
    @ViewBuilder func createTopView() -> some View {
        createBar()
        Spacer.height(12)
        createTransactionText()
        Spacer.height(4)
        createDateText()
    }
    @ViewBuilder func createMiddleView() -> some View {
        createTitleText()
        Spacer.height(20)
        createAmountView()
        Spacer.height(8)
        createAddNoteTextField()
        Spacer.height(24)
        createLabels()
    }
    func createButtons() -> some View {
        HStack(spacing: 8) {
            ForEach(ButtonContent.allCases, id: \.self, content: createButton)
        }
    }
}

private extension BottomPopup_EditExpense {
    func createBar() -> some View {
        Capsule()
            .fill(Color.onBackgroundTertiary)
            .frame(width: 44, height: 6)
            .alignHorizontally(.center)
    }
    func createTransactionText() -> some View {
        Text("Transaction".uppercased())
            .font(.interBold(12))
            .foregroundColor(.onBackgroundSecondary)
    }
    func createDateText() -> some View {
        Text(dateText)
            .font(.interRegular(13))
            .foregroundColor(.onBackgroundSecondary)
    }
    func createTitleText() -> some View {
        Text(titleText)
            .font(.interBold(28))
            .foregroundColor(.onBackgroundPrimary)
    }
    func createAmountView() -> some View {
        HStack(spacing: 2) {
            createAmountText()
            createAmountCurrencySymbol()
        }
    }
    func createAddNoteTextField() -> some View {
        TextField("Add a note", text: $note)
            .font(.interSemiBold(14))
            .foregroundColor(.onBackgroundSecondary)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 24)
            .frame(maxWidth: .infinity)
    }
    func createLabels() -> some View {
        HStack(spacing: 8) {
            ForEach(LabelContent.allCases, id: \.self, content: createLabel)
        }
    }
    func createButton(_ content: ButtonContent) -> some View {
        Text(content.title.uppercased())
            .font(.interSemiBold(13))
            .foregroundColor(.onBackgroundSecondary)
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.onBackgroundTertiary, lineWidth: 1))
    }
}

private extension BottomPopup_EditExpense {
    func createAmountText() -> some View {
        Text(expense.amount)
            .font(.interBold(28))
            .foregroundColor(.primary)
    }
    func createAmountCurrencySymbol() -> some View {
        Text(expense.currency)
            .font(.interBold(21))
            .foregroundColor(.primary)
    }
    func createLabel(_ content: LabelContent) -> some View {
        HStack(spacing: 4) {
            createLabelIcon(content)
            createLabelText(content)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(content.colour.opacity(0.12))
        .mask(Capsule())
    }
}

private extension BottomPopup_EditExpense {
    func createLabelIcon(_ content: LabelContent) -> some View {
        Image(content.iconName)
            .resizable()
            .frame(16)
            .foregroundColor(content.colour)
    }
    func createLabelText(_ content: LabelContent) -> some View {
        Text(content.title)
            .font(.interBold(13))
            .foregroundColor(content.colour)
    }
}

private extension BottomPopup_EditExpense {
    var dateText: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        return dateFormatter.string(from: .init())
    }
    var titleText: String { "Ciuchcia Pufcia" }
    var expense: (currency: String, amount: String) { ("zł", "406.89") }
}


// MARK: - Labels
fileprivate enum LabelContent: String, CaseIterable { case shops, travel }
fileprivate extension LabelContent {
    var colour: Color {
        switch self {
            case .shops: return .red
            case .travel: return .blue
        }
    }
    var iconName: String { rawValue }
    var title: String { rawValue.capitalized }
}

// MARK: - Buttons
fileprivate enum ButtonContent: String, CaseIterable { case delete, edit, split }
fileprivate extension ButtonContent {
    var title: String { rawValue.capitalized }
}
