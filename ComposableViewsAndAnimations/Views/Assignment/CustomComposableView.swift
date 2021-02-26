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
    
    //how far to fill meter
    @State var fillToValue: CGFloat = 0
    
    //horizontal offset
    @State var offsetX: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                ZStack{
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: (geometry.size.width - 30), height: 30)
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.green]), startPoint: .leading, endPoint: .trailing))
                        .frame(width: (fillToValue), height: 30, alignment: .leading)
                        .offset(offsetX)
                        .onAppear {
                            offsetX = 0
                            withAnimation(.easeOut) {
                                fillToValue = (geometry.size.width - 30) / 100 * score
                                offset = (geometry.size.width - 30) / 100 * (100 - score)
                            }
                        }
                }
                Spacer()
            }
        }
    }
}
