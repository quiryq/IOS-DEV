//
//  CourseTableViewCell.swift
//  NavigationApp
//
//  Created by Toleu Bakhauddin
//

import UIKit

// Custom cell for displaying course information
class CourseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var courseCover: UIImageView!
    @IBOutlet weak var courseTitle: UILabel!
    @IBOutlet weak var courseLecturer: UILabel!
    @IBOutlet weak var courseReview: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Fill the cell with course information
    func configure(with course: TableItem) {
        // Only proceed if this is a course item
        guard course.category == .course else {
            return
        }
        
        courseTitle.text = course.title
        courseLecturer.text = course.subtitle
        courseReview.text = course.review
        courseCover.image = course.image
    }
}
