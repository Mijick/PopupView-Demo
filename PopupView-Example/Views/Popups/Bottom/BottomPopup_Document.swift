//
//  BottomPopup_Document.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import PopupView
import WebKit

struct BottomPopup_Document: BottomPopup {
    func configurePopup(popup: BottomPopupConfig) -> BottomPopupConfig { popup }
    func createContent() -> some View {
        VStack(spacing: 0) {
            createBar()
            Spacer.height(24)
            createWebView()
            createConfirmButton()
        }
        .padding(.top, 20)
    }
}

private extension BottomPopup_Document {
    func createBar() -> some View {
        Capsule()
            .fill(Color.onBackgroundTertiary)
            .frame(width: 32, height: 6)
            .alignHorizontally(.center)
    }
    func createWebView() -> some View {
        WebView(url: "https://icseindia.org/document/sample.pdf").frame(height: UIScreen.height - UIScreen.safeArea.top - 140)
    }
    func createConfirmButton() -> some View {
        Text("Confirm")
            .font(.interBold(13))
            .foregroundColor(.white)
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .background(Color.primary)
            .cornerRadius(8)
            .padding(.horizontal, 28)
            .onTapGesture(perform: dismiss)
    }
}

extension BottomPopup_Document {
    var id: String { "document" }
}


// MARK: -WebView
fileprivate struct WebView: UIViewRepresentable {
    let url: String


    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let webView = WKWebView()
        loadRequest(webView)
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {}
}

private extension WebView {
    func loadRequest(_ webView: WKWebView) {
        if let url = URL(string: url) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                webView.load(URLRequest(url: url))
            }
        }
    }
}
