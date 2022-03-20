//
//  YoutubeSearchResponse.swift
//  MoVMe
//
//  Created by Panca Setiawan on 20/03/22.
//

import Foundation

struct YoutubeSearchResults: Codable {
  
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
