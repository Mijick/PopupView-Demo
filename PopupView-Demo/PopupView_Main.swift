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
    var body: some Scene { WindowGroup {
        ContentView()
            .registerPopups { config in config
                .vertical { $0
                    .enableDragGesture(true)
                    .tapOutsideToDismissPopup(true)
                    .cornerRadius(32)
                }
                .centre { $0
                    .tapOutsideToDismissPopup(false)
                    .backgroundColor(.red)
                }
            }
    }}
}
