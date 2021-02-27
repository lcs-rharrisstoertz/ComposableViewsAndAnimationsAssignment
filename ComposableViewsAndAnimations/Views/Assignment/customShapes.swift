//
//  customShapes.swift
//  ComposableViewsAndAnimations
//
//  Created by Harris-Stoertz, Rowan on 2021-02-26.
//

import Foundation

struct Star: Shape {
    let starRadius: CGFloat
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let A = CGPoint (x: 0.5 * rect.width, y: 0)
        let B = CGPoint (x: 0.65 * rect.width, y: 0.3 * rect.height)
        let C = CGPoint (x: 0.975 * rect.width, y: 0.35 * rect.height)
        let D = CGPoint (x: 0.75 * rect.width, y: 0.575 * rect.height)
        let E = CGPoint (x: 0.8 * rect.width, y: 0.9 * rect.height)
        let F = CGPoint (x: 0.5 * rect.width, y: 0.75 * rect.height)
        let G = CGPoint (x: 0.2 * rect.width, y: 0.9 * rect.height)
        let H = CGPoint (x: 0.25 * rect.width, y: 0.575 * rect.height)
        let I = CGPoint (x: 0.025 * rect.width, y: 0.35 * rect.height)
        let J = CGPoint (x: 0.35 * rect.width, y: 0.3 * rect.height)
    }
}
