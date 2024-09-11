//
//  MockLeaderBoard.swift
//  GolfDeLaMarterie
//
//  Created by guill roy on 10/05/2024.
//

import Foundation

final class MockLeaderBoardData: URLSessionProtocol{
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
            let testData = """
        [
            {
                "TournamentID": 625,
                "Name": "Ryder Cup",
                "StartDate": "2025-09-28T00:00:00",
                "EndDate": "2025-09-30T00:00:00",
                "IsOver": false,
                "IsInProgress": false,
                "Venue": "Bethpage Black",
                "Location": "Farmingdale, NY",
                "Par": null,
                "Yards": null,
                "Purse": null,
                "StartDateTime": null,
                "Canceled": false,
                "Covered": false,
                "City": null,
                "State": null,
                "ZipCode": null,
                "Country": null,
                "TimeZone": null,
                "Format": "TeamMatch",
                "SportRadarTournamentID": "",
                "OddsCoverage": "Limited",
                "Rounds": []
            }
        ]
        """.data(using: .utf8)!
            let response = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (testData, response)
        }
    }
