//
//  ArtistCell.swift
//  iTunesSearch
//
//  Created by Jason Yu on 3/8/20.
//

import UIKit

class ArtistCell: UITableViewCell {

    @IBOutlet weak var artistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
