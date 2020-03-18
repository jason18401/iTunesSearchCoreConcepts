//
//  Album.swift
//  iTunesSearch
//
//  Created by Jason Yu on 3/5/20.
//

import Foundation
import UIKit

enum AlbumArtworkState {
    case placeholder
    case download
    case failed
}

//names dont have to match returned names?
struct Album { //class
    let id: Int
    let artistName: String
    let name: String
    let censoredName: String
    var artworkUrl: String
    let isExplicit: Bool
    let numberOfTracks: Int
    let releaseDate: Date
    let primaryGenre: Genre
    var songs = [Song]()
    var artwork: UIImage?
    var artworkState: AlbumArtworkState = .placeholder
}
