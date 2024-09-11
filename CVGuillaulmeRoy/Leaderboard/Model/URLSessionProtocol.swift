//
//  URLSessionProtocol.swift
//  GolfDeLaMarterie
//
//  Created by guill roy on 16/05/2024.
//

import Foundation

protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
   
}

/// Implementation
extension URLSession: URLSessionProtocol {}

