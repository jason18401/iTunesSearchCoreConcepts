//
//  PendingOperations.swift
//  iTunesSearch
//
//  Created by Jason Yu on 3/17/20.
//

import Foundation

struct PendingOperations {
    var downloadsInProgress = [IndexPath: Operation]()
    
    let downloadQueue = OperationQueue()
}
