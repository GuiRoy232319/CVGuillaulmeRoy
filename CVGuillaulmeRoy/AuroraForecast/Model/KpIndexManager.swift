//
//  KpIndexManager.swift
//  VikingTrip
//
//  Created by guill roy on 07/03/2024.
//

import Foundation

final class KpIndexManager{
    static let shared = KpIndexManager()
    var kpAll: [KpData]!
    // Fonction pour récupérer les données JSON depuis l'URL
    func fetchKpData(completion: @escaping ([KpData]?, Error?) -> Void) {
        guard let url = URL(string: "https://services.swpc.noaa.gov/products/noaa-planetary-k-index.json") else {
            completion(nil, NSError(domain: "Invalid URL", code: 0, userInfo: nil))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, error)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let kpData = try decoder.decode([[String]].self, from: data)
                
                // Skip the first row (header row)
                let dataRows = Array(kpData.dropFirst())
                
                // Map data rows to KpData objects
                let kpObjects = dataRows.map { rowData in
                    return KpData(timeTag: rowData[0],
                                  kp: rowData[1],
                                  aRunning: rowData[2],
                                  stationCount: rowData[3])
                }
                
                completion(kpObjects, nil)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
