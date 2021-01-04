//
//  ChartDataManager.swift
//  asteria alpha
//
//  Created by Elena Sadler on 1/1/21.
//

import Foundation




extension Bundle {
    func decode(_ file: String) -> ChartData {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        guard let loaded = try? decoder.decode(ChartData.self, from: data) else {
            fatalError(":(")
        }

        return loaded
    }
}

extension Decodable {
    init(data: Data, using decoder: JSONDecoder = .init()) throws {
        self = try decoder.decode(Self.self, from: data)
    }
    init(json: String, using decoder: JSONDecoder = .init()) throws {
        try self.init(data: Data(json.utf8), using: decoder)
    }
}
