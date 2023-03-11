//
//  NetworkManager.swift
//  Pokemon
//
//  Created by Maxim on 11.03.2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

enum Link: String {
    case pokemon = "https://pokeapi.co/api/v2/pokemon/"
}

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}
}
