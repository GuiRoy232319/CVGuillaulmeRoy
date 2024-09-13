//
//  GaugeDetailView.swift
//  CVGuillaulmeRoy
//
//  Created by guill roy on 13/09/2024.
//

import SwiftUI

struct gaugeDetailView: View{
    var category : LocalizedStringResource = ""
    var detail: Double = 0
    
    var body: some View{
        HStack(){
            Text(category)
                .fontWeight(.bold)
            Spacer()
            GaugeView(gradient: Gradient(colors:[.purple,.blue,.green]), progress: detail)
                .gaugeStyle(.accessoryLinear)
                .frame(width:250 ,alignment: .leading)
        }
    }
    
}
#Preview {
    gaugeDetailView()
}
