//
//  MockSchedule&Leaderboard.swift
//  GolfDeLaMarterie
//
//  Created by guill roy on 10/05/2024.
//

import Foundation

final class MockGolfData: URLSessionProtocol{
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
            let testData = """
        {
            "Tournament": {
                "TournamentID": 487,
                "Name": "Masters Tournament",
                "StartDate": "2022-04-07T00:00:00",
                "EndDate": "2022-04-10T00:00:00",
                "IsOver": true,
                "IsInProgress": false,
                "Venue": "Augusta National Golf Club",
                "Location": "Augusta, GA",
                "Par": 72,
                "Yards": 7475,
                "Purse": 15000000.0000,
                "StartDateTime": "2022-04-07T08:00:00",
                "Canceled": false,
                "Covered": true,
                "City": "Augusta",
                "State": "GA",
                "ZipCode": null,
                "Country": "USA",
                "TimeZone": "America/New York",
                "Format": "Stroke",
                "SportRadarTournamentID": "6b19e7fe-40b4-4b5a-92b9-7887f4892d83",
                "OddsCoverage": "Full",
                "Rounds": [
                    {
                        "TournamentID": 487,
                        "RoundID": 15785,
                        "Number": 1,
                        "Day": "2022-04-07T00:00:00"
                    },
                    {
                        "TournamentID": 487,
                        "RoundID": 15786,
                        "Number": 2,
                        "Day": "2022-04-08T00:00:00"
                    },
                    {
                        "TournamentID": 487,
                        "RoundID": 15787,
                        "Number": 3,
                        "Day": "2022-04-09T00:00:00"
                    },
                    {
                        "TournamentID": 487,
                        "RoundID": 15788,
                        "Number": 4,
                        "Day": "2022-04-10T00:00:00"
                    }
                ]
            },
            "Players": [
                {
                    "PlayerTournamentID": 54990,
                    "PlayerID": 40001274,
                    "TournamentID": 487,
                    "Name": "Scott Scheffler",
                    "Rank": 2,
                    "Country": "USA",
                    "TotalScore": -13.6,
                    "TotalStrokes": 378.6,
                    "TotalThrough": null,
                    "Earnings": 3677400.0,
                    "FedExPoints": 817,
                    "FantasyPoints": 147.1,
                    "FantasyPointsDraftKings": 147.1,
                    "DraftKingsSalary": 14982,
                    "DoubleEagles": 0.0,
                    "Eagles": 0.0,
                    "Birdies": 28.6,
                    "Pars": 55.8,
                    "Bogeys": 12.3,
                    "DoubleBogeys": 1.9,
                    "WorseThanDoubleBogey": 0.0,
                    "HoleInOnes": 0.0,
                    "StreaksOfThreeBirdiesOrBetter": 0.0,
                    "BogeyFreeRounds": 0.0,
                    "RoundsUnderSeventy": 3.7,
                    "TripleBogeys": 0.0,
                    "WorseThanTripleBogey": 0.0,
                    "TeeTime": "2022-04-10T14:40:00",
                    "MadeCut": 1.9,
                    "Win": 1.9,
                    "TournamentStatus": "Scrambled",
                    "IsAlternate": false,
                    "FanDuelSalary": 15799,
                    "FantasyDraftSalary": null,
                    "MadeCutDidNotFinish": false,
                    "OddsToWin": 18.4,
                    "OddsToWinDescription": "Scrambled",
                    "FantasyPointsFanDuel": 144.1,
                    "FantasyPointsFantasyDraft": 217.9,
                    "StreaksOfFourBirdiesOrBetter": 0.0,
                    "StreaksOfFiveBirdiesOrBetter": 0.0,
                    "ConsecutiveBirdieOrBetterCount": 11.1,
                    "BounceBackCount": 3.7,
                    "RoundsWithFiveOrMoreBirdiesOrBetter": 3.7,
                    "IsWithdrawn": false,
                    "FantasyPointsYahoo": 139.3,
                    "StreaksOfSixBirdiesOrBetter": 0.0
                    }
                ]
        }
        """.data(using: .utf8)!
            let response = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (testData, response)
        }
    }

