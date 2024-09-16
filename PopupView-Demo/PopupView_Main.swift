//
//  PopupView_Main.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickPopups

@main struct PopupView_Main: App {
    var body: some Scene {
        WindowGroup {
            ContentView().implementPopupView(config: configurePopup)
        }
    }
}
private extension PopupView_Main {
    func configurePopup(_ config: ConfigContainer) -> ConfigContainer { config
        .vertical { $0
            .dragGestureEnabled(true)
        }
        .centre { $0
            .tapOutsideToDismiss(false)
        }
    }
}
