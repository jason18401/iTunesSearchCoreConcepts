//
//  ArtworkDownloader.swift
//  iTunesSearch
//
//  Created by Jason Yu on 3/17/20.
//

import UIKit

class ArtworkDownloader: Operation {
    var album: Album
    
    init(album: Album){
        self.album = album
        super.init() //subclass so call super.init()
    }
    
    override func main() {
        //check to see if canceled
        if self.isCancelled {
            return
        }
        
        guard let url = URL(string: album.artworkUrl) else {
            return
        }
        
        let imageData = try! Data(contentsOf: url)
        
        //check again if canceled
        if self.isCancelled {
            return
        }
        
        if imageData.count > 0 {
            album.artwork = UIImage(data: imageData)
            album.artworkState = .download
        } else {
            album.artworkState = .failed
        }
    }
}
