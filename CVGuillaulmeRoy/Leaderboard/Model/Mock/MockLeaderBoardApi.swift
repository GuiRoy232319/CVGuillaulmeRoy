//
//  MockLeaderBoardApi.swift
//  GolfDeLaMarterie
//
//  Created by guill roy on 12/04/2024.
//

import Foundation

final class MockEdamamApi: URLSessionProtocol{
    var invalidData = false
    
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        if invalidData{
            let testData = """
            {
                "translations": [
                    {
                        "detected_source_language": "FR",
                        "text": "I'm an IOS developer"
                    }
                ]
            }
        """.data(using: .utf8)!
            let response = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (testData, response)
        } else {
            let testData = """
            {
              "_id": "6616f1e93fecb4aa89d860b1",
              "orgId": "1",
              "year": "2024",
              "tournId": "014",
              "status": "In Progress",
              "roundId": 1,
              "roundStatus": "Suspended",
              "lastUpdated": "2024-04-11T23:59:05Z",
              "cutLines": [],
              "leaderboardRows": [
                {
                  "lastName": "DeChambeau",
                  "firstName": "Bryson",
                  "isAmateur": false,
                  "playerId": "47959",
                  "teeTime": "11:18am",
                  "teeTimeTimestamp": "2024-04-11T15:18:00Z",
                  "courseId": "014",
                  "status": "complete",
                  "currentRound": 1,
                  "total": "-7",
                  "currentRoundScore": "-7",
                  "position": "1",
                  "totalStrokesFromCompletedRounds": "65",
                  "roundComplete": true,
                  "rounds": [
                    {
                      "scoreToPar": "-7",
                      "roundId": 1,
                      "courseId": "014",
                      "courseName": "Augusta National Golf Club",
                      "strokes": 65
                    }
                  ],
                  "thru": "F",
                  "startingHole": 1,
                  "currentHole": 18
                },
                {
                  "lastName": "Scheffler",
                  "firstName": "Scottie",
                  "isAmateur": false,
                  "playerId": "46046",
                  "teeTime": "1:12pm",
                  "teeTimeTimestamp": "2024-04-11T17:12:00Z",
                  "courseId": "014",
                  "status": "complete",
                  "currentRound": 1,
                  "total": "-6",
                  "currentRoundScore": "-6",
                  "position": "2",
                  "totalStrokesFromCompletedRounds": "66",
                  "roundComplete": true,
                  "rounds": [
                    {
                      "scoreToPar": "-6",
                      "roundId": 1,
                      "courseId": "014",
                      "courseName": "Augusta National Golf Club",
                      "strokes": 66
                    }
                  ],
                  "thru": "F",
                  "startingHole": 1,
                  "currentHole": 18
                }
                ]
            }
            """.data(using: .utf8)!
            let response = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (testData, response)
        }
    }
}
