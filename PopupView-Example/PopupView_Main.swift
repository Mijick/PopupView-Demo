//
//  PopupView_Main.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import PopupView

@main struct PopupView_Main: App {
    var body: some Scene {
        WindowGroup {
            ContentView().implementPopupView(configMain: configurePopups, configTop: configureTopPopups, configCentre: configureCentrePopups, configBottom: configureBottomPopups)
        }
    }
}
private extension PopupView_Main {
    func configurePopups(_ config: GlobalConfig.Main) -> GlobalConfig.Main {
        config.overlayColour(.black.opacity(0.48))
    }
    func configureTopPopups(_ config: GlobalConfig.Top) -> GlobalConfig.Top {
        config.cornerRadius(24)
    }
    func configureCentrePopups(_ config: GlobalConfig.Centre) -> GlobalConfig.Centre {
        config.tapOutsideToDismiss(false)
    }
    func configureBottomPopups(_ config: GlobalConfig.Bottom) -> GlobalConfig.Bottom {
        config.tapOutsideToDismiss(true)
    }
}
