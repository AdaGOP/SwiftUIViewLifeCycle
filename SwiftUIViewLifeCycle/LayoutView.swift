//
//  LayoutView.swift
//  SwiftUIViewLifeCycle
//
//  Created by khoirunnisa' rizky noor fatimah on 15/05/24.
//

import SwiftUI

struct LayoutView: View {
    var body: some View {
        ZStack {
            // Blue background occupying the entire screen
            Color.green.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Hello,")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text("ZStack!")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            // Red circle positioned at the center of the ZStack
            Circle()
                .foregroundColor(.red)
                .frame(width: 150, height: 150)
            
            // Green rectangle overlaid on top-left corner
            Rectangle()
                .foregroundColor(.yellow)
                .frame(width: 100, height: 100)
                .offset(x: -150, y: -300)
        }
    }
}

#Preview {
    LayoutView()
}
