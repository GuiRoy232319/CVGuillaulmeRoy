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
    ("Entreprise:", "ABC Corp"),
    ("Poste:", "Développeur"),
    ("test", "restest")
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
        ("Téléphone:", "+33 7 80 38 37 29")
    ]
