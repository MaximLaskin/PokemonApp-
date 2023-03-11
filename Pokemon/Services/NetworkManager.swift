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

    func fetchData(completion: @escaping(Result<[Pokemon], NetworkError>) -> Void) {
        guard let url = URL(string: Link.pokemon.rawValue) else {
            completion(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                completion(.failure(.noData))
                return
            }
            do {
                let pokemons = try JSONDecoder().decode(PokemonApp.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(pokemons.results))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
