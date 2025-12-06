//
//  CourseTableViewCell.swift
//  TableViewApp
//
//  Created by Toleu Bakhauddin on 13.11.2025.
//

import UIKit

// MARK: - Course Table Cell
class CourseTableViewCell: UITableViewCell {
    
    // MARK: - UI Outlets
    @IBOutlet weak var courseCover: UIImageView!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var courseLecturer: UILabel!
    @IBOutlet weak var courseReview: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareCell()
    }
    
    // MARK: - Setup
    private func prepareCell() {
        // Initialize cell properties
        selectionStyle = .default
    }
    
    // MARK: - Configuration
    func setupWith(item: MediaItem) {
        guard item.type == .course else {
            return
        }
        
        courseTitle.text = item.name
        courseLecturer.text = item.creator
        courseReview.text = item.description
        courseCover.image = item.coverImage
    }
}
