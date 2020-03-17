//
//  SearchViewController.swift
//  iTunesSearch
//
//  Created by Jason Yu on 3/8/20.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var data = [Artist]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(SearchViewController.dismissSearchViewController))
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.tableHeaderView = searchController.searchBar
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        definesPresentationContext = true   //this view is covered if overlayed
    }
    
    @objc func dismissSearchViewController() {
        self.dismiss(animated: true, completion: nil)
        
    }

    //MARK: Passing data forward
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAlbumsSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                var artist = data[indexPath.row]
                artist.albums = Stub.albums
                
                let albumVC = segue.destination as! AlbumsViewController
                albumVC.albums = artist.albums
            }
        }
    }
    
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "artistCell", for: indexPath) as! ArtistCell
        
        let artist = data[indexPath.row]
        cell.textLabel?.text = artist.name
        //cell.artistLabel?.text = testArray[indexPath.row]
        return cell
    }
    
    func update(with artists: [Artist]) {
        data = artists
    }
    
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        //print(searchController.searchBar.text!)
        
        //Tap on searchBar to get update
        update(with: [Stub.artist])
        tableView.reloadData()
    }
    
    
}
