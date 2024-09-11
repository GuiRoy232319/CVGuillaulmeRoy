//
//  LeaderBoard.swift
//  GolfDeLaMarterie
//
//  Created by guill roy on 12/04/2024.
//

import Foundation
//----------------------------------------------
//MARK: LeaderBoard Structure to decode API Call
//----------------------------------------------
struct LeaderBoard: Codable, Hashable {
    let Tournament: Tour
    let Players: [Player1]
}

// MARK: - Player
struct Player1: Codable, Hashable {
    let Name: String
    let Country: String
    let TotalScore: Float?
}

// MARK: - Tournament
struct Tour: Codable, Hashable {
    let TournamentID: Int
    let Name: String
    let StartDate: String
}

