//
//  SearchResponse.swift
//  Apple_Music
//
//  Created by Антон on 13.02.2021.
//

import Foundation

struct Music: Decodable {
    let resultCount: Int
    let results: [Track]
}

struct Track: Decodable {
    let artistName: String
    let trackName: String
    let collectionName: String?
    let artworkUrl100: String?
    let previewUrl: String?
}
