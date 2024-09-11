//
//  TournamentStructure.swift
//  GolfDeLaMarterie
//
//  Created by guill roy on 29/05/2024.
//

import Foundation

//---------------------------------------------
//MARK: Tournament Structure to Decode API Call
//---------------------------------------------

struct Tournament: Codable {
    let TournamentID: Int
    let Name: String
    let IsInProgress: Bool
    let IsOver: Bool
    let Players: [Player1]?
    let StartDate: String
}

