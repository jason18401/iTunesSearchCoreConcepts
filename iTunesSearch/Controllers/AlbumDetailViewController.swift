//
//  SongsViewController.swift
//  iTunesSearch
//
//  Created by Jason Yu on 3/11/20.
//

import UIKit

class AlbumDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var artworkImage: UIImageView!
    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var genreTitle: UILabel!
    @IBOutlet weak var releaseDateTitle: UILabel!
    
    var album: Album?
    private let songs = Stub.songs//[Song]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        if let album = album {
            configure(with: album)
        }

    }
    
    func configure(with album: Album) {
        let viewModel = AlbumDetailViewModel(album: album)
        
        //TODO: implement artwork
        albumTitle.text = viewModel.title
        genreTitle.text = viewModel.genre
        releaseDateTitle.text = viewModel.releaseDate
    }

}

extension AlbumDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumDetailCellReuse", for: indexPath) as! SongCell
        
        let song = songs[indexPath.row]
        let viewModel = SongViewModel(song: song)
        
        cell.songTitle.text = viewModel.title
        cell.songRuntimeLabel.text = viewModel.runtime
        
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Tracks"
        default:
            return nil
        }
    }

}

extension AlbumDetailViewController: UITableViewDelegate {
    
}
