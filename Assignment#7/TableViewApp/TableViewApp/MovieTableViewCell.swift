//
//  MovieTableViewCell.swift
//  TableViewApp
//
//  Created by Toleu Bakhauddin on 13.11.2025.
//

import UIKit

// MARK: - Movie Table Cell
class MovieTableViewCell: UITableViewCell {
    
    // MARK: - UI Outlets
    @IBOutlet weak var movieCover: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var movieReview: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCell()
    }
    
    // MARK: - Setup Methods
    private func setupCell() {
        // Cell configuration on load
        selectionStyle = .default
    }
    
    // MARK: - Public Configuration
    func setupWith(item: MediaItem) {
        guard item.type == .movie else {
            return
        }
        
        movieTitle.text = item.name
        movieDirector.text = item.creator
        movieReview.text = item.description
        movieCover.image = item.coverImage
    }
}
