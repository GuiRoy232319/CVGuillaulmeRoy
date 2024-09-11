//
//  Struct KPIndex.swift
//  VikingTrip
//
//  Created by guill roy on 07/03/2024.
//

import Foundation

struct KpData: Codable {
    let timeTag: String
    let kp: String
    let aRunning: String
    let stationCount: String
    
    enum CodingKeys: String, CodingKey {
        case timeTag = "time_tag"
        case kp = "Kp"
        case aRunning = "a_running"
        case stationCount = "station_count"
    }
}


enum KPError: Error {
    case invalidURL
    case requestFailed
    case invalidData
}
