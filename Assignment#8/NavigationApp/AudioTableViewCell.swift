//
//  AudioTableViewCell.swift
//  NavigationApp
//
//  Created by Toleu Bakhauddin
//

import UIKit

// Custom cell for displaying audio track information
class AudioTableViewCell: UITableViewCell {
    
    @IBOutlet weak var audioCover: UIImageView!
    @IBOutlet weak var audioName: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var review: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Populate the cell with audio track data
    func configure(with audio: TableItem) {
        // Only configure if this is actually an audio item
        guard audio.category == .audio else {
            return
        }
        
        audioName.text = audio.title
        artistLabel.text = audio.subtitle
        review.text = audio.review
        audioCover.image = audio.image
    }
}
