//
//  AlbumsViewController.swift
//  iTunesSearch
//
//  Created by Jason Yu on 3/9/20.
//

import UIKit

class AlbumsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var albums = [Album]()
    var pendingOperations = PendingOperations()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    //MARK: Passing data forward
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "albumDetailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                var selectedAlbum = albums[indexPath.row]
                selectedAlbum.songs = Stub.songs
                
                let albumDetailVC = segue.destination as! AlbumDetailViewController
                albumDetailVC.album = selectedAlbum
            }
            
        }
    }

}

extension AlbumsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("albums.count: \(albums.count)")
        return albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
        let album = albums[indexPath.row]
        let viewModel = AlbumCellViewModel(album: album)
        cell.configure(with: viewModel)
        cell.accessoryType = .disclosureIndicator
        
        if album.artworkState == .placeholder {
            downloadArtworkForAlbum(album, atIndexPath: indexPath)
        }
    
        
        return cell
    }
    
    func downloadArtworkForAlbum(_ album: Album, atIndexPath indexPath: IndexPath) {
        if let _ = pendingOperations.downloadsInProgress[indexPath] {
            return
        }
        let downloader = ArtworkDownloader(album: album)
        downloader.completionBlock = {
            if downloader.isCancelled {
                return
            }
            
            DispatchQueue.main.async {
                self.pendingOperations.downloadsInProgress.removeValue(forKey: indexPath)
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
        pendingOperations.downloadsInProgress[indexPath] = downloader //keep track in dict
        pendingOperations.downloadQueue.addOperation(downloader)
    }
    
}

extension AlbumsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
