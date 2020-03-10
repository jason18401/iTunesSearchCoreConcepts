//
//  Album.swift
//  iTunesSearch
//
//  Created by Jason Yu on 3/5/20.
//

import Foundation

//names dont have to match returned names?
struct Album { //class
    let id: Int
    let artistName: String
    let name: String
    let censoredName: String
    let artworkUrl: String
    let isExplicit: Bool
    let numberOfTracks: Int
    let releaseDate: Date
    let primaryGenre: Genre
    let songs = [Song]()
}
