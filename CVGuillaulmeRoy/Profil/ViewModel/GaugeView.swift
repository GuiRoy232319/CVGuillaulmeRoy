//
//  GaugeView.swift
// 
//
//  Created by guill roy on 05/02/2024.
//

import SwiftUI

//------------------
//MARK: Model Gauge
//------------------
struct GaugeView: View {
    @State private var currentProgress: Double = 0
    var gradient = Gradient(colors: [.blue, .green, .red])
    var progress: Double


    var body: some View {
        VStack{
            Gauge(
                value: currentProgress,
                in:0...100,
                label: {
                }
            )
            .tint(gradient)
        }
        .onAppear {
            withAnimation(.linear(duration: 1.5)){
                self.currentProgress = progress
            }
        }
    }
}
#Preview {
    GaugeView(progress: 3.5)
}
