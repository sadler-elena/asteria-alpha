//
//  City.swift
//  asteria alpha
//
//  Created by Geraldine Turcios on 1/14/21.
//

import Foundation

struct City: Decodable, Hashable {
    var geonameId: Int
    var toponymName: String
    var countryCode: String
    var countryName: String
    var adminName1: String
}

struct GeoNameResponse: Decodable {
    var totalResultsCount: Int
    var geonames: [City]
}
