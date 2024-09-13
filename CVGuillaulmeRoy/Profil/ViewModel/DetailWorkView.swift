//
//  DetailWorkView.swift
//  CVGuillaulmeRoy
//
//  Created by guill roy on 13/09/2024.
//

import SwiftUI

struct DetailWorkView: View {
    var category: LocalizedStringResource = ""
    var detail: LocalizedStringResource = ""
    
    var body: some View {
        HStack {
            Text(category)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .frame(width:175)
            Spacer()
            Text(detail)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    DetailWorkView()
}
