//
//  PopupView_Main.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickPopupView

@main struct PopupView_Main: App {
    var body: some Scene {
        WindowGroup {
            ContentView().implementPopupView(config: configurePopup)
        }
    }
}
private extension PopupView_Main {
    func configurePopup(_ config: GlobalConfig) -> GlobalConfig { config
        .top { $0
            .cornerRadius(24)
            .dragGestureEnabled(true)
        }
        .centre { $0
            .tapOutsideToDismiss(false)
        }
        .bottom { $0
            .stackLimit(4)
        }
    }
}
