//
//  customShape.swift
//  ComposableViewsAndAnimations
//
//  Created by Harris-Stoertz, Rowan on 2021-03-01.
//

import SwiftUI

struct customShape: View {
    struct Star: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: 0.5 * rect.width, y: 0))
            path.addLine(to: CGPoint(x: 0.65 * rect.width, y: 0.3 * rect.height))
            path.addLine(to: CGPoint(x: 0.975 * rect.width, y: 0.35 * rect.height))
            path.addLine(to: CGPoint(x: 0.75 * rect.width, y: 0.575 * rect.height))
            path.addLine(to: CGPoint(x: 0.8 * rect.width, y: 0.9 * rect.height))
            path.addLine(to: CGPoint(x: 0.5 * rect.width, y: 0.75 * rect.height))
            path.addLine(to: CGPoint(x: 0.2 * rect.width, y: 0.9 * rect.height))
            path.addLine(to: CGPoint(x: 0.25 * rect.width, y: 0.575 * rect.height))
            path.addLine(to: CGPoint(x: 0.025 * rect.width, y: 0.35 * rect.height))
            path.addLine(to: CGPoint(x: 0.35 * rect.width, y: 0.3 * rect.height))
            path.addLine(to: CGPoint(x: 0.35 * rect.width, y: 0.3 * rect.height))
            
            return path
        }
    }

    var body: some View {
        Star()
    }
}

struct customShape_Previews: PreviewProvider {
    static var previews: some View {
        customShape()
    }
}
