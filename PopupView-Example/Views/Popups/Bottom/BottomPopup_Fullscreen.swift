//
//  BottomPopup_Fullscreen.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import WebKit
import PopupView

struct BottomPopup_Fullscreen: BottomPopup {
    @State private var closeButtonAppeared: Bool = false


    func configurePopup(popup: BottomPopupConfig) -> BottomPopupConfig {
        popup
            .contentFillsEntireScreen(true)
            .dragGestureEnabled(false)
    }
    func createContent() -> some View {
        VStack(spacing: 0) {
            Spacer.height(UIScreen.safeArea.top + 12)
            createNavigationBar()
            Spacer.height(16)
            createWebView()
        }
        .ignoresSafeArea()
        .animation(.easeInOut, value: closeButtonAppeared)
        .onAppear(perform: onAppear)
    }
}

private extension BottomPopup_Fullscreen {
    func createNavigationBar() -> some View {
        Button(action: dismiss) {
            Text("Close")
                .font(.interBold(17))
                .foregroundColor(.primary)
        }
        .alignHorizontally(.leading, 24)
        .active(if: closeButtonAppeared)
    }
    func createWebView() -> some View {
        WebView()
    }
}

private extension BottomPopup_Fullscreen {
    func onAppear() { DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        closeButtonAppeared = true
    }}
}


// MARK: - WebView implementation
fileprivate struct WebView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView { .init() }
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
private extension WebView {
    var url: URL { .init(string: "https://github.com/orgs/Mijick/repositories")! }
}
