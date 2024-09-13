//
//  DetailView.swift
//  CVGuillaulmeRoy
//
//  Created by guill roy on 13/09/2024.
//

import SwiftUI

struct DetailView: View {
    var category: LocalizedStringResource = ""
    var detail: LocalizedStringResource = ""
    
    var body: some View {
        HStack {
            Text(category)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Spacer()
            Text(detail)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.trailing)
        }
        .padding()
    }
}

#Preview {
    DetailView()
}
