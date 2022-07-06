//
//  TriangleElement.swift
//  Drawing
//
//  Created by Dmitry Sokoltsov on 06.07.2022.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct TriangleElement: View {
    var body: some View {
        Triangle()
            .frame(width: 200, height: 200)
    }
}

struct TriangleElement_Previews: PreviewProvider {
    static var previews: some View {
        TriangleElement()
    }
}
