//
//  AlbumCellViewModel.swift
//  iTunesSearch
//
//  Created by Jason Yu on 3/9/20.
//

import Foundation

//accepts data and formats it to the desired format
struct AlbumCellViewModel {
    let title: String
    let releaseDate: String
    let genre: String
}

//to easily test data input
extension AlbumCellViewModel {
    init(album: Album) {
        self.title = album.censoredName
        self.genre = album.primaryGenre.name
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current //to set default format of users phone
        formatter.dateFormat = "MMM dd, yyyy"

        self.releaseDate = formatter.string(from: album.releaseDate)
    }
}
