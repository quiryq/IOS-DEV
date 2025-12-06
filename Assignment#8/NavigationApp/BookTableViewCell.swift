//
//  BookTableViewCell.swift
//  NavigationApp
//
//  Created by Toleu Bakhauddin
//

import UIKit

// Custom cell for displaying book information
class BookTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookReview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Set up the cell with book details
    func configure(with book: TableItem) {
        // Make sure we're dealing with a book item
        guard book.category == .book else {
            return
        }
        
        bookTitle.text = book.title
        bookAuthor.text = book.subtitle
        bookReview.text = book.review
        bookCover.image = book.image
    }
}
