//
//  AnimalImages.swift
//  Animal Multi
//
//  Created by Dmitry Sokoltsov on 21.05.2022.
//

import SwiftUI

struct AnimalImages: View {
    var image: String
    var body: some View {
        Image(image)
        .renderingMode(.original)
        .shadow(radius: 5)
    }

}
