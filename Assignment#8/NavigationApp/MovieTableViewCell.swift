//
//  MovieTableViewCell.swift
//  NavigationApp
//
//  Created by Toleu Bakhauddin
//

import UIKit

// Custom cell for displaying movie information
class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieCover: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var movieReview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Configure the cell with movie data
    func configure(with movie: TableItem) {
        // Verify this is a movie item before configuring
        guard movie.category == .movie else {
            return
        }
        
        movieTitle.text = movie.title
        movieDirector.text = movie.subtitle
        movieReview.text = movie.review
        movieCover.image = movie.image
    }
}
