//
//  AlbumCellViewModel.swift
//  iTunesSearch
//
//  Created by Jason Yu on 3/9/20.
//

import UIKit

//accepts data and formats it to the desired format
struct AlbumCellViewModel {
    let artwork: UIImage
    let title: String
    let releaseDate: String
    let genre: String
}

//to easily test data input
extension AlbumCellViewModel {
    init(album: Album) {
        self.artwork = album.artworkState == AlbumArtworkState.download ? album.artwork! : UIImage(imageLiteralResourceName: "AlbumPlaceholder")
        self.title = album.censoredName
        self.genre = album.primaryGenre.name
        
        let formatter = DateFormatter()
        formatter.locale = Locale.current //to set default format of users phone
        formatter.dateFormat = "MMM dd, yyyy"

        self.releaseDate = formatter.string(from: album.releaseDate)
    }
}
