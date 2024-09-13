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

                        expandableWorkSection(header: "Expériences Professionnelles", isExpanded: $expandedWorks, details: workExp)

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
}

#Preview {
    ProfilView()
}
