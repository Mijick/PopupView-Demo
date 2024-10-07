//
//  BottomPopup_Fullscreen.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickPopups

struct BottomPopup_Fullscreen: BottomPopup {
    @State private var closeButtonAppeared: Bool = false


    func configurePopup(popup: BottomPopupConfig) -> BottomPopupConfig {
        popup
            .heightMode(.fullscreen)
            .enableDragGesture(false)
    }
    var body: some View {
        VStack(spacing: 0) {
            Spacer.height(12)
            createNavigationBar()
            Spacer.height(16)
            createWebView()
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .animation(.easeInOut, value: closeButtonAppeared)
        .onAppear(perform: onAppear)
    }
}

private extension BottomPopup_Fullscreen {
    func createNavigationBar() -> some View {
        Button(action: { dismissLastPopup() }) {
            Text("Close")
                .font(.interBold(17))
                .foregroundColor(.primary)
        }
        .alignHorizontally(.leading, 24)
        .active(if: closeButtonAppeared)
    }
    func createWebView() -> some View {
        WebView().active(if: closeButtonAppeared)
    }
}

private extension BottomPopup_Fullscreen {
    func onAppear() { DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
        closeButtonAppeared = true
    }}
}


#if os(iOS)
import WebKit

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


#elseif os(tvOS) || os(macOS)
fileprivate struct WebView: View {
    var body: some View { EmptyView() }
}
#endif
