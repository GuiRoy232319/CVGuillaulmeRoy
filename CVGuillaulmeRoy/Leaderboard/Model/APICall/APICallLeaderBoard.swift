//
//  APICallLeaderBoard.swift
//  GolfDeLaMarterie
//
//  Created by guill roy on 29/05/2024.
//

import Foundation

class leaderboardAPI{
    private let session : URLSessionProtocol
    var site = "https://api.sportsdata.io/golf/v2/json/Leaderboard/"
    let authKey = "?key=acfd2c6acf10425bba8673ef43d8cae9"
    
    init(session: URLSessionProtocol = URLSession.shared){
        self.session = session
    }
    /// Fetching Data From API 
    func fetchTournamentData(id: Int) async throws ->LeaderBoard{
        guard site != "" else {throw LeaderBoardError.invalidURL}
        guard let url = URL(string: site + "\(id)" + authKey) else { throw LeaderBoardError.requestFailed}
        do{
            let urlRequest = URLRequest(url: url)
            let (data, _) = try await session.data(for: urlRequest)
            if let decodedResponse = try? JSONDecoder().decode(LeaderBoard.self, from: data){
                return decodedResponse
            }
        }catch{
            print(LeaderBoardError.requestFailed)
        }
        return LeaderBoard(Tournament: Tour(TournamentID: 0, Name: "", StartDate: ""), Players: [])
    }
    
    /// Error Case
    enum LeaderBoardError: String, Error {
        case invalidURL = "Invalid URl"
        case requestFailed = "Request Failed"
        case invalidData = "Invalid Data"
    }
}
