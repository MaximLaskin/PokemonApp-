//
//  NetworkManager.swift
//  Pokemon
//
//  Created by Maxim on 11.03.2023.
//

import UIKit
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

enum Link: String {
    case pokemon = "https://pokeapi.co/api/v2/pokemon/"
    case superHero = "https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api/all.json"
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

    func fetchImage(from url: URL, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                print(error?.localizedDescription ?? "No error description")
                return
            }
            DispatchQueue.main.async {
                completion(.success(data))
            }
        }.resume()
    }

    func getImage(from url: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
    
        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    completion(.success(image))
                } else {
                    completion(.failure(NSError(domain: "Ошибка", code: 0, userInfo: [NSLocalizedDescriptionKey: "Невозможно преобразовать данные в изображение"])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }



}
