//
//  QueryItemProvider.swift
//  iTunesSearch
//
//  Created by Jason Yu on 3/17/20.
//

import Foundation

protocol QueryItemProvider {
    var queryItem: URLQueryItem { get }
}
