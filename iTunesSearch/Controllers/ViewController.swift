//
//  ViewController.swift
//  iTunesSearch
//
//  Created by Jason Yu on 3/5/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let endpoint = Itunes.search(term: "DPR LIVE", media: .music)
        print(endpoint)
        print(endpoint.request)
    }


}

