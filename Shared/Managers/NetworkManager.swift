//
//  NetworkManager.swift
//  asteria alpha
//
//  Created by Geraldine Turcios on 1/14/21.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func fetchLocation(with text: String, rows: Int, completed: @escaping (Result<[City], ATError>) -> Void) {
        let urlString = "http://api.geonames.org/searchJSON?q=\(text)&maxRows=\(rows)&username=elenasadler"

        guard let url = URL(string: urlString) else {
            return completed(.failure(.invalidCity))
        }

        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                return completed(.failure(.unableToComplete))
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                return completed(.failure(.invalidResponse))
            }

            guard let data = data else {
                return completed(.failure(.invalidData))
            }

            do {
                let response = try JSONDecoder().decode(GeoNameResponse.self, from: data)
                completed(.success(response.geonames))
            } catch {
                return completed(.failure(.invalidData))
            }
        }

        dataTask.resume()
    }
}
