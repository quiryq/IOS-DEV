//
//  BookViewController.swift
//  NavigationApp
//
//  Created by Toleu Bakhauddin
//

import UIKit

// Collection of books to display
private let bookCollection: [TableItem] = [
    TableItem(title: "The Brothers Karamazov",
              subtitle: "by Fyodor Dostoevsky",
              review: "A profound exploration of morality, faith, and family dynamics in 19th century Russia.",
              image: #imageLiteral(resourceName: "book1"),
              category: .book),
    
    TableItem(title: "The Man Who Laughs",
              subtitle: "by Victor Hugo",
              review: "A dark and romantic tale exploring society's treatment of the disfigured and outcasts.",
              image: #imageLiteral(resourceName: "book2"),
              category: .book),
    
    TableItem(title: "Choke",
              subtitle: "by Chuck Palahniuk",
              review: "A provocative novel about addiction, identity, and the absurdity of modern life.",
              image: #imageLiteral(resourceName: "book3"),
              category: .book),
    
    TableItem(title: "Тозақ оттары жымындайды",
              subtitle: "by Төлен Әбдікұлы",
              review: "One of the most unique stories in Kazakh Literature, which explores the themes of colonialism and identity.",
              image: #imageLiteral(resourceName: "book4"),
              category: .book),
    
    TableItem(title: "Slaughterhouse 5",
              subtitle: "by Kurt Vonnegut",
              review: "A satirical, science-fiction infused anti-war novel about the bombing of Dresden.",
              image: #imageLiteral(resourceName: "book5"),
              category: .book),
    TableItem(title: "The Godfather",
                  subtitle: "by Mario Puzo",
                  review: "A gripping saga of power, loyalty, and betrayal within the legendary Corleone crime family.",
                  image: #imageLiteral(resourceName: "book6"),
                  category: .book),
        
        TableItem(title: "The Count of Monte Cristo",
                  subtitle: "by Alexandre Dumas",
                  review: "An epic tale of betrayal, resilience, and masterful revenge spanning decades.",
                  image: #imageLiteral(resourceName: "book7"),
                  category: .book),
        
        TableItem(title: "И дольше века длится день",
                  subtitle: "by Чингиз Айтматов",
                  review: "A powerful novel blending realism and folklore while exploring history, identity, and the human spirit.",
                  image: #imageLiteral(resourceName: "book8"),
                  category: .book),
        
        TableItem(title: "War and Peace",
                  subtitle: "by Leo Tolstoy",
                  review: "A monumental epic intertwining personal stories with sweeping historical events of the Napoleonic era.",
                  image: #imageLiteral(resourceName: "book9"),
                  category: .book),
        
        TableItem(title: "The Myth of Sisyphus",
                  subtitle: "by Albert Camus",
                  review: "A philosophical essay examining the absurd condition of human existence and the search for meaning.",
                  image: #imageLiteral(resourceName: "book10"),
                  category: .book)
    ]


// View controller for displaying the list of books
class BookViewController: ViewController {

    override var items: [TableItem] {
        return bookCollection
    }
    
    override func createCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as! BookTableViewCell
        let book = bookCollection[indexPath.row]
        cell.configure(with: book)
        return cell
    }
    
    override func getItem(at indexPath: IndexPath) -> TableItem? {
        return bookCollection[indexPath.row]
    }
}

