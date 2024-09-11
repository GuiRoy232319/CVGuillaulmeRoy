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
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(50)
                    .shadow(color: .white, radius: 20, x: 2, y: 3)

                Text("Guillaume Roy")
                    .font(.title)
                    .fontWeight(.heavy)
                    .fontWidth(.condensed)
                    .colorInvert()

                Divider()
                    .colorInvert()

                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 10) {
                        expandableSection(header: "Mon Profil", isExpanded: $expandedProfil, details: [
                            ("Adresse:", "Nyhyttan 122, 713 94 Nora, Suède"),
                            ("Age:", "37 Ans")
                        ])

                        expandableSection(header: "Diplômes", isExpanded: $expandedDegrees, details: [
                            ("Diplôme:", "Master en Informatique"),
                            ("Année:", "2010")
                        ])

                        expandableSection(header: "Expériences Professionnelles", isExpanded: $expandedWorks, details: [
                            ("Entreprise:", "ABC Corp"),
                            ("Poste:", "Développeur")
                        ])

                        expandableSection(header: "Langues", isExpanded: $expandedLangages, details: [
                            ("Langue:", "Français"),
                            ("Langue:", "Anglais")
                        ])

                        expandableSection(header: "Hard Skills", isExpanded: $expandedHardSkills, details: [
                            ("Compétence:", "Swift"),
                            ("Compétence:", "Python")
                        ])

                        expandableSection(header: "Soft Skills", isExpanded: $expandedSoftSkills, details: [
                            ("Compétence:", "Communication"),
                            ("Compétence:", "Travail en équipe")
                        ])

                        expandableSection(header: "Contact", isExpanded: $expandedContact, details: [
                            ("Email:", "guillaume.roy@example.com"),
                            ("Téléphone:", "+33 6 12 34 56 78")
                        ])
                    }
                    .padding(.horizontal)
                }
            }
        }
    }

    private func expandableSection(header: String, isExpanded: Binding<Bool>, details: [(category: String, detail: String)]) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Button(action: {
                withAnimation(.easeInOut(duration: 0.4)) {
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
                    ForEach(details, id: \.category) { detail in
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
        .animation(.easeInOut(duration: 0.4), value: isExpanded.wrappedValue)
    }
}

struct DetailView: View {
    var category: String
    var detail: String
    
    var body: some View {
        HStack {
            Text(category)
                .fontWeight(.bold)
            Spacer()
            Text(detail)
                .foregroundColor(.gray)
        }
        .padding()
    }
}

#Preview {
    ProfilView()
}
