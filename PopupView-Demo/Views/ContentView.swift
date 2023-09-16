//
//  ContentView.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickPopupView

struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false, content: createContent).preferredColorScheme(.light)
    }
}

private extension ContentView {
    func createContent() -> some View {
        VStack(spacing: 44) {
            createSection(Data.Bottom.self)
            createSection(Data.Centre.self)
            createSection(Data.Top.self)
        }
        .padding(.top, 40)
        .padding(.bottom, 32)
        .padding(.horizontal, 28)
    }
}

private extension ContentView {
    func createSection<D: MockData>(_ data: D.Type) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            createHeader(data)
            createItems(data.allCases as! [any MockData])
        }
    }
}

private extension ContentView {
    func createHeader<D: MockData>(_ type: D.Type) -> some View {
        Header(title: String(describing: type), count: type.allCases.count)
    }
    func createItems(_ items: [any MockData]) -> some View {
        VStack(spacing: 8) {
            ForEach(items, id: \.title, content: createItem)
        }
    }
}

private extension ContentView {
    func createItem(_ data: any MockData) -> some View {
        Item(data: data)
    }
}

// MARK: -Header
fileprivate struct Header: View {
    let title: String
    let count: Int


    var body: some View {
        HStack(spacing: 0) {
            createTitleText()
            Spacer()
            createCountText()
        }
    }
}

private extension Header {
    func createTitleText() -> some View {
        Text(title)
            .font(.satoshiBlack(24))
            .foregroundColor(.onBackgroundPrimary)
    }
    func createCountText() -> some View {
        Text("\(count) example\(count == 1 ? "" : "s")")
            .font(.satoshiRegular(14))
            .foregroundColor(.onBackgroundSecondary)
    }
}

// MARK: -Item
fileprivate struct Item: View {
    let data: any MockData


    var body: some View {
        Button(action: data.popup.showAndStack) {
            HStack(spacing: 0) {
                createIcon()
                Spacer.width(12)
                createText()
                Spacer()
                createRightArrow()
            }
            .padding(.vertical, 14)
            .padding(.horizontal, 16)
            .background(Color.onBackgroundTertiary)
            .cornerRadius(8)
        }
    }
}

private extension Item {
    func createIcon() -> some View {
        Image(data.image)
    }
    func createText() -> some View {
        VStack(alignment: .leading, spacing: 2) {
            createTitleText()
            createDescriptionText()
        }
    }
    func createRightArrow() -> some View {
        Image("arrow-right")
            .resizable()
            .frame(16)
            .foregroundColor(Color.onBackgroundSecondary)
    }
}

private extension Item {
    func createTitleText() -> some View {
        Text(data.title)
            .font(.satoshiBold(14))
            .foregroundColor(.onBackgroundPrimary)
    }
    func createDescriptionText() -> some View {
        Text(data.description)
            .font(.openSansRegular(11.5))
            .foregroundColor(.onBackgroundSecondary)
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
    }
}
