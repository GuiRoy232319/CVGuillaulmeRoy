//
//  Item.swift
//  CVGuillaulmeRoy
//
//  Created by guill roy on 05/09/2024.
//

import Foundation
import SwiftUI

///Langages for ProfilView
var langages: [(LocalizedStringResource, Double)] = [
    ("Français:", 100),
    ("Anglais:", 85),
    ("Allemand:", 45),
    ("Suédois:", 15)
]

///Hard Skills for ProfilView
var hardSkills: [(LocalizedStringResource, Double)] = [
    ("SwiftUI", 85),
    ("UIKit", 90),
    ("Swift", 90),
    ("Alamofire", 80),
    ("Firebase", 75),
    ("SQL", 65),
    ("Fastlane", 75),
    ("CircleCI", 70)
    
]

///Works Exp. For ProfilView
var workExp: [(LocalizedStringResource, LocalizedStringResource)] = [
    ("Gérant et Développeur iOS","Code Sweden 2021 - ce jour"),
    ("Gérant et vendeur", "Vape N' Taste 2018 - 2019"),
    ("Agent Immbolier", "Hélix Immobilier 2017"),
    ("Responsable de magasin","Sonrisa 2014 - 2016"),
    ("Vendeur en horlogerie/bijouterie", "Bouldoires 2011 - 2014"),
    ("Vendeur en horlogerie", "Heure & Montres 2009 - 2010")
]

///Degrees for ProfilView
var degrees : [(LocalizedStringResource, LocalizedStringResource)] =  [
    ("2024:", "L3 / M1 Développeur d'applications Mobile IOS"),
    ("2022:", "Certifaction de formation général en SwiftUI"),
    ("2021:", "Certifaction de formation général en UIKit"),
    ("2012:","L2 Expertise Gemmologie niveau 2"),
    ("2009:", "L2 Management du sport"),
    ("2006:", "Baccalauréat Scientifique Option Sciences de l'ingénieur Spécialité Physique/Chimie")
]

///Informations About Me for ProfilView
var aboutMe : [(LocalizedStringResource, LocalizedStringResource)]  = [
    ("Adresse:", "Nyhyttan 122, 713 94 Nora, Suède"),
    ("Age:", "37 Ans"),
    ("","Développeur iOS indépendant et gestionnaire principal chez Code Sweden avec expertise en Swift et SwiftUI. Polyvalent, rigoureux et travailleur. Diplômé de niveau 6 en développement iOS d'Openclassrooms et certifié en SwiftUI par Udemy. Cherche opportunités pour développer ses compétences et évoluer professionnellement.")
]

/// Soft SKills for ProfilView
var softSkills: [(LocalizedStringResource, LocalizedStringResource)]  = [
    ("Ponctuel", "Communication"),
    ("Adaptabilité", "Travail en équipe"),
    ("Sérieux", "Résistant à la pression")
]

/// Contact for ProfilView
var contactMe :[(LocalizedStringResource, LocalizedStringResource)]  = [
        ("Email:", "g.roy2308@gmail.com"),
        ("Email pro:","contact.codesweden@gmail.com"),
        ("Tel fr:", "+33780383729"),
        ("Tel suédois:", "+46769010610")
    ]

 func expandableWorkSection(header: String, isExpanded: Binding<Bool>, details: [(category: LocalizedStringResource, detail: LocalizedStringResource)]) -> some View {
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
                    DetailWorkView(category: detail.category, detail: detail.detail)
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

func expandableSection(header: String, isExpanded: Binding<Bool>, details: [(category: LocalizedStringResource, detail: LocalizedStringResource)]) -> some View {
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

func expandableSectionWithGauge(header: String, isExpanded: Binding<Bool>, details: [(category: LocalizedStringResource, detail: Double)]) -> some View {
    VStack(spacing: 10) {
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
