//
//  ProfilView.swift
//  CVGuillaulmeRoy
//
//  Created by guill roy on 05/09/2024.
//

import SwiftUI

struct ProfilView: View {
    @State private var expandedProfil = false
    @State private var expandedDegrees = false
    @State private var expandedWorks = false
    @State private var expandedLangages = false
    @State private var expandedHardSkills = false
    @State private var expandedSoftSkills = false
    @State private var expandedContact = false

    var body: some View {
        ZStack {
            Image("Background1")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 15)
                .opacity(0.9)
                
            VStack {
                Image("Profile")
                    .resizable()
                    .frame(width: 125, height: 175)
                    .clipShape(.ellipse)
                    .overlay(
                        Ellipse()
                            .stroke(lineWidth: 3)
                    )
                    .aspectRatio(contentMode: .fill)
                    .shadow(color: .gray, radius: 20, x: 2, y: 3)

                Text("Guillaume Roy")
                    .font(.title)
                    .fontWeight(.heavy)
                    .fontWidth(.condensed)
                    .colorScheme(.dark) 
                Text("Développeur iOS")
                    .font(.footnote)

                Divider()
                    .colorInvert()

                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        expandableSection(header: "Mon Profil", isExpanded: $expandedProfil, details: aboutMe)

                        expandableSection(header: "Diplômes", isExpanded: $expandedDegrees, details: degrees)

                        expandableSection(header: "Expériences Professionnelles", isExpanded: $expandedWorks, details: workExp)

                        expandableSectionWithGauge(header: "Langues", isExpanded: $expandedLangages, details: langages)

                        expandableSectionWithGauge(header: "Hard Skills", isExpanded: $expandedHardSkills, details: hardSkills)

                        expandableSection(header: "Soft Skills", isExpanded: $expandedSoftSkills, details: softSkills)

                        expandableSection(header: "Contact", isExpanded: $expandedContact, details: contactMe)
                    }
                    .padding(.horizontal)
                }
            }
        }
    }

    private func expandableSection(header: String, isExpanded: Binding<Bool>, details: [(category: LocalizedStringResource, detail: LocalizedStringResource)]) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Button(action: {
                withAnimation(.smooth(duration: 0.6)) {
                    isExpanded.wrappedValue.toggle()
                }
            }) {
                HStack {
                    Text(header)
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: isExpanded.wrappedValue ? "chevron.up" : "chevron.down")
                        .foregroundColor(.orange)
                }
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(8)
            }

            if isExpanded.wrappedValue {
                VStack(spacing: 5) {
                    ForEach(details, id: \.category.key) { detail in
                        DetailView(category: detail.category, detail: detail.detail)
                            .transition(.opacity)
                    }
                }
                .padding(.horizontal)
                .background(Color.white.opacity(0.6))
                .cornerRadius(8)
            } else {
                EmptyView()
                    .frame(height: 0)
            }
        }
        .animation(.smooth(duration: 0.6), value: isExpanded.wrappedValue)
    }
    
    private func expandableSectionWithGauge(header: String, isExpanded: Binding<Bool>, details: [(category: LocalizedStringResource, detail: Double)]) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Button(action: {
                withAnimation(.smooth(duration: 0.6)) {
                    isExpanded.wrappedValue.toggle()
                }
            }) {
                HStack {
                    Text(header)
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: isExpanded.wrappedValue ? "chevron.up" : "chevron.down")
                        .foregroundColor(.orange)
                }
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(8)
            }

            if isExpanded.wrappedValue {
                VStack(spacing: 10) {
                    ForEach(details, id: \.category.key) { detail in
                        gaugeDetailView(category: detail.category, detail: detail.detail)
                            .transition(.opacity)
                    }
                }
                .padding(.horizontal)
                .background(Color.white.opacity(0.6))
                .cornerRadius(8)
            } else {
                EmptyView()
                    .frame(height: 0)
            }
        }
        .animation(.smooth(duration: 0.6), value: isExpanded.wrappedValue)
    }
}

struct DetailView: View {
    var category: LocalizedStringResource
    var detail: LocalizedStringResource
    
    var body: some View {
        HStack {
            Text(category)
                .fontWeight(.bold)
            Spacer()
            Text(detail)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.leading)
        }
        .padding()
    }
}

struct gaugeDetailView: View{
    var category : LocalizedStringResource
    var detail: Double
    
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
    ProfilView()
}
