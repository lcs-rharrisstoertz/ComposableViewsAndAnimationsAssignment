//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

/*idea: one of those bars where it has three stars
 like if it's out of 10, it might have the stars at 6, 8, and 10
 (or positioned at the 100%, 66%, and 33% points)
 and if you got 7, it would load to 7, and you'd get 1 star
 and when it reaches a star, the star turns from grey to yellow and expands
 */

import SwiftUI

struct CustomComposableView: View {
    
    // percent completed/correct
    @State var score: CGFloat
    
    //horizontal offset
    @State var offsetX: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                ZStack{
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.green]), startPoint: .leading, endPoint: .trailing))
                        .frame(width: (geometry.size.width - 30), height: 30, alignment: .leading)
                    Rectangle()
                        .fill(Color.primary)
                        .colorInvert()
                        .frame(width: (geometry.size.width - 30), height: 30)
                        .offset(x: offsetX)
                        .onAppear {
                            withAnimation(.linear(duration: 2)) {
                                offsetX = (geometry.size.width - 30) / 100 * score
                            }
                        }
                }
                Spacer()
            }
        }
    }
}
