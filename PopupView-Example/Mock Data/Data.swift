//
//  MockData.swift of PopupView-Example
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

enum Data {}
protocol MockData: RawRepresentable<String>, CaseIterable {
    var title: String { get }
    var description: String { get }
}
extension MockData {
    var image: String { "placeholder-\(String(describing: Self.self).lowercased())-\(rawValue.camelCaseToKebabCase())" }
}
