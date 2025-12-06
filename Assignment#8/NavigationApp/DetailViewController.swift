//
//  DetailViewController.swift
//  NavigationApp
//
//  Created by Toleu Bakhauddin
//

import UIKit

// View controller that displays detailed information about a selected item
class DetailViewController: UIViewController {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var reviewDescription: UILabel!
    
    // The item to display details for
    var item: TableItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayItemDetails()
    }
    
    // Update the UI with the item's information
    private func displayItemDetails() {
        guard let item = item else {
            return
        }
        
        mainTitle.text = item.title
        subTitle.text = item.subtitle
        reviewDescription.text = item.review
        coverImage.image = item.image
    }
}
