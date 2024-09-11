//
//  ScheduleModel.swift
//  GolfDeLaMarterie
//
//  Created by guill roy on 07/05/2024.
//

import Foundation

class ScheduleAPI{
    private let session : URLSessionProtocol
    var site = "https://api.sportsdata.io/golf/v2/json/tournaments?key=acfd2c6acf10425bba8673ef43d8cae9"
    
    init(session: URLSessionProtocol = URLSession.shared){
        self.session = session
    }
   
    ///Fetching Data From API
    func fetchAllTournament() async throws-> [Tournament]{
        guard let url = URL(string: site) else { throw LiveLeaderBoardError.invalidURL}
        do{
            let urlRequest = URLRequest(url: url)
            let (data, _) = try await session.data(for: urlRequest)
            if let decodedResponse = try? JSONDecoder().decode([Tournament].self, from: data){
                 return decodedResponse
            }
        } catch{
            print(LiveLeaderBoardError.invalidData)
        }
        return []
    }
    
    enum LiveLeaderBoardError: String, Error {
        case invalidURL = "Invalid URl"
        case requestFailed = "Request Failed"
        case invalidData = "Invalid Data"
    }
}
