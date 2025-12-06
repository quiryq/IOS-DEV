//
//  ViewController.swift
//  NavigationApp
//
//  Created by Toleu Bakhauddin
//

import UIKit

// Base view controller that handles common table view functionality
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet private weak var table: UITableView!
    
    // Override this in subclasses to provide the data
    var items: [TableItem] {
        return []
    }
    
    // Stores the item that was tapped by the user
    var selectedItem: TableItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // Configure the table view to use this controller as its data source and delegate
    private func setupTableView() {
        table.dataSource = self
        table.delegate = self
    }

    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return createCell(for: tableView, at: indexPath)
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedItem = getItem(at: indexPath)
        navigateToDetails()
    }
    
    // MARK: - Helper Methods
    
    // Override this method in subclasses to provide custom cell configuration
    func createCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    // Override this method in subclasses to return the selected item
    func getItem(at indexPath: IndexPath) -> TableItem? {
        return nil
    }
    
    // Navigate to the detail view when an item is selected
    private func navigateToDetails() {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails",
           let detailVC = segue.destination as? DetailViewController {
            detailVC.item = selectedItem
        }
    }
}

// Represents different categories of content in the app
enum Category: String, CaseIterable {
    case movie = "Movie"
    case audio = "Audio"
    case book = "Book"
    case course = "Course"
}

// Data model for items displayed in the table views
struct TableItem {
    let title: String
    let subtitle: String
    let review: String
    let image: UIImage
    let category: Category
}
    
