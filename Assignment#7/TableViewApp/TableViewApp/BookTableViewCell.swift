//
//  BookTableViewCell.swift
//  TableViewApp
//
//  Created by Toleu Bakhauddin on 13.11.2025.
//

import UIKit

// MARK: - Book Table Cell
class BookTableViewCell: UITableViewCell {
    
    // MARK: - UI Outlets
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookReview: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        initializeUI()
    }
    
    // MARK: - UI Setup
    private func initializeUI() {
        // Custom cell initialization
        selectionStyle = .default
    }
    
    // MARK: - Public Methods
    func setupWith(item: MediaItem) {
        guard item.type == .book else {
            return
        }
        
        bookTitle.text = item.name
        bookAuthor.text = item.creator
        bookReview.text = item.description
        bookCover.image = item.coverImage
    }
}
