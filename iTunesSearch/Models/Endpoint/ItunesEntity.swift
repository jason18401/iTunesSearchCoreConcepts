//
//  ItunesEntity.swift
//  iTunesSearch
//
//  Created by Jason Yu on 3/17/20.
//

import Foundation

protocol ItunesEntity: QueryItemProvider {
    var entityName: String { get }
}

extension ItunesEntity {
    var queryItem: URLQueryItem {
        return URLQueryItem(name: "entity", value: entityName)
    }
}

enum MusicEntity: String {
    case musicArtist
    case musicTrack
    case album
    case musicVideo
    case mix
    case song
}

extension MusicEntity: ItunesEntity {
    var entityName: String {
        return self.rawValue
    }
    
}
