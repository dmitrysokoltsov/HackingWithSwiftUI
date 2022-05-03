//
//  CustomTitleModifier.swift
//  GuessTheFlag
//
//  Created by Dmitry Sokoltsov on 03.05.2022.
//

import SwiftUI


//CustomTitleModifier 24 day
struct CustomTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.secondary)
            .font(.largeTitle.weight(.bold))
    }
}
