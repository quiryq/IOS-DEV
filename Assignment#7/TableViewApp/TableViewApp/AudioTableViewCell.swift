//
//  AudioTableViewCell.swift
//  TableViewApp
//
//  Created by Toleu Bakhauddin on 13.11.2025.
//

import UIKit

// MARK: - Audio Table Cell
class AudioTableViewCell: UITableViewCell {
    
    // MARK: - UI Outlets
    @IBOutlet weak var audioCover: UIImageView!
    @IBOutlet weak var audioName: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var review: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAppearance()
    }
    
    // MARK: - Configuration
    private func configureAppearance() {
        // Cell styling can be customized here
        selectionStyle = .default
    }
    
    func setupWith(item: MediaItem) {
        guard item.type == .audio else {
            return
        }
        
        audioName.text = item.name
        artistLabel.text = item.creator
        review.text = item.description
        audioCover.image = item.coverImage
    }
}
