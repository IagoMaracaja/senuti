//
//  MusicVideo.swift
//  Senuti
//
//  Created by Iago Albuquerque on 13/01/18.
//  Copyright © 2018 Andre Iago. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MusicVideo {
    let artistName: String
    let collectionName: String
    let artistViewUrl: String
    let trackTimeMillis: String
    let trackCensoredName: String
    let artworkUrl100: String
    let country: String
    let previewUrl: String
}

extension MusicVideo {
    init?(json: JSON) {
        self.artistName = json["artistName"].stringValue
        self.collectionName = json["collectionName"].stringValue
        self.artistViewUrl = json["artistViewUrl"].stringValue
        self.trackTimeMillis = json["trackTimeMillis"].stringValue
        self.trackCensoredName = json["trackCensoredName"].stringValue
        self.artworkUrl100 = json["artworkUrl100"].stringValue
        self.country = json["country"].stringValue
        self.previewUrl = json["previewUrl"].stringValue
    }
}
