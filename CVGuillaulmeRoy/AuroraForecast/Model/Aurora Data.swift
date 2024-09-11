//
//  Aurora Data.swift
//  VikingTrip
//
//  Created by guill roy on 13/10/2023.
//

import Foundation
import SwiftUI

final class AuroraAPI{
    
    private let session : URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared){
        self.session = session
    }
    
    public var auroraLatestIMG =  "https://services.swpc.noaa.gov/images/animations/ovation/north/latest.jpg"
    private var auroraViewLine = URL(string: "https://services.swpc.noaa.gov/experimental/images/aurora_dashboard/tonights_static_viewline_forecast.png")
    private var forecatThreeDays = URL(string: "https://services.swpc.noaa.gov/text/3-day-forecast.txt")
    
    func fetchImages() async throws -> [UIImage] {
        var currentDateTime = Date()
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: currentDateTime)

        // Adjust time (UTC - 1h 15min)
        let adjustedMinutes = minutes - (minutes % 5)
        currentDateTime = calendar.date(bySetting: .minute, value: adjustedMinutes, of: currentDateTime)!
        currentDateTime = calendar.date(byAdding: .hour, value: -1, to: currentDateTime)!
        currentDateTime = calendar.date(byAdding: .minute, value: -15, to: currentDateTime)!

        // Create URL array and date formatter
        var imageUrls: [String] = []
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd_HHmm"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        // Generate URLs for images
        for i in 1...288 {
            let dateMinusFiveMinutes = calendar.date(byAdding: .minute, value: -5 * i, to: currentDateTime)!
            let formattedDate = dateFormatter.string(from: dateMinusFiveMinutes)
            let imageUrl = "https://services.swpc.noaa.gov/images/animations/ovation/north/aurora_N_\(formattedDate).jpg"
            imageUrls.insert(imageUrl, at: 0)
        }

        // Prepare an array with optional images
        var imagesArray = Array<UIImage?>(repeating: nil, count: imageUrls.count)

        // Download images sequentially
        for (index, imageUrlString) in imageUrls.enumerated() {
            guard let imageUrl = URL(string: imageUrlString) else { continue }
            do {
                let (data, _) = try await URLSession.shared.data(from: imageUrl)
                if let image = UIImage(data: data) {
                    imagesArray[index] = image // Insert image at the correct index
                }
            } catch {
                print("Error downloading image from \(imageUrlString): \(error)")
            }
        }

        // Ensure the images are correctly ordered
        let sortedImages = imagesArray.compactMap { $0 }
        
        // Make sure that imagesArray contains images in the order of their timestamps
        return sortedImages
    }
    
    func fetchImage() async throws -> UIImage {
        guard let url = URL(string: auroraLatestIMG) else {throw auroraError.invalidURL}
        do{
            let urlRequest = URLRequest(url: url)
            let (imageData, _) = try await session.data(for: urlRequest)
            if let image = UIImage(data: imageData){
                return image
            }
        }
        return UIImage()
    }
    
     
    enum auroraError: String, Error {
        case invalidURL = "Invalid URl"
        case requestFailed = "Request Failed"
        case invalidData = "Invalid Data"
    }
    
}
