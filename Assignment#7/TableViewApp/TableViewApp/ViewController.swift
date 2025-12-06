//
//  ViewController.swift
//  TableViewApp
//
//  Created by Toleu Bakhauddin on 13.11.2025.
//

import UIKit

// MARK: - Content Type Definition
enum ContentType: String, CaseIterable {
    case movie = "Movie"
    case audio = "Audio"
    case book = "Book"
    case course = "Course"
}

// MARK: - Media Item Model
struct MediaItem {
    let name: String
    let creator: String
    let description: String
    let coverImage: UIImage
    let type: ContentType
}

// MARK: - Main View Controller
class ViewController: UIViewController {
    
    @IBOutlet private weak var table: UITableView!
    
    // MARK: - Data Sources
    private lazy var movieCollection: [MediaItem] = {
        return [
            MediaItem(name: "Everything. Everywhere. All at once.",
                     creator: "by Daniel Kwan and Daniel Scheinert",
                     description: "Oskar nominee movie with psychodelic drama comedy genre.",
                     coverImage: #imageLiteral(resourceName: "movie1"),
                     type: .movie),
            
            MediaItem(name: "Inglourious Basterds",
                     creator: "by Quentin Tarantino",
                     description: "Classic by Tarantino, engaging plot and great actors",
                     coverImage: #imageLiteral(resourceName: "movie2"),
                     type: .movie),
            
            MediaItem(name: "Blue Spring",
                     creator: "by Toshiaki Toyoda",
                     description: "Coming of age movie with a sad ending",
                     coverImage: #imageLiteral(resourceName: "movie3"),
                     type: .movie),
            
            MediaItem(name: "The Big Lebowski",
                     creator: "by Joel and Ethan Coen",
                     description: "The best comedy of all time, mayonnaise scene is the most memorable one",
                     coverImage: #imageLiteral(resourceName: "movie4"),
                     type: .movie),
            
            MediaItem(name: "Perfect Blue",
                     creator: "by Satoshi Kon",
                     description: "Full-length anime movie, which was an inspiration for the 'Black Swan'. Absolute must watch.",
                     coverImage: #imageLiteral(resourceName: "movie5"),
                     type: .movie)
        ]
    }()
    
    private lazy var musicCollection: [MediaItem] = {
        return [
            MediaItem(name: "LIL FANTASY",
                     creator: "by CHAEYOUNG",
                     description: "Solo album by the member of the group TWICE. CHAEYOUNG have composed and written each of the track exploring her own unique style",
                     coverImage: #imageLiteral(resourceName: "track1"),
                     type: .audio),
            
            MediaItem(name: "2 полста",
                     creator: "by Валерий Меладзе",
                     description: "A soulful album by Валерий Меладзе with classic hits",
                     coverImage: #imageLiteral(resourceName: "track2"),
                     type: .audio),
            
            MediaItem(name: "Live Love A$AP",
                     creator: "by A$AP ROCKY",
                     description: "Energetic live performance captured in this album",
                     coverImage: #imageLiteral(resourceName: "track3"),
                     type: .audio),
            
            MediaItem(name: "Сұранамын",
                     creator: "by Қайрат Нұртас",
                     description: "Emotional album exploring love and life in Kazakh style",
                     coverImage: #imageLiteral(resourceName: "track4"),
                     type: .audio),
            
            MediaItem(name: "Release Some Tension",
                     creator: "by SWV",
                     description: "Classic R&B album full of smooth tracks and harmony",
                     coverImage: #imageLiteral(resourceName: "track5"),
                     type: .audio)
        ]
    }()
    
    private lazy var bookCollection: [MediaItem] = {
        return [
            MediaItem(name: "The Brothers Karamazov",
                     creator: "by Fyodor Dostoevsky",
                     description: "A profound exploration of morality, faith, and family dynamics in 19th century Russia.",
                     coverImage: #imageLiteral(resourceName: "book1"),
                     type: .book),
            
            MediaItem(name: "The Man Who Laughs",
                     creator: "by Victor Hugo",
                     description: "A dark and romantic tale exploring society's treatment of the disfigured and outcasts.",
                     coverImage: #imageLiteral(resourceName: "book2"),
                     type: .book),
            
            MediaItem(name: "Choke",
                     creator: "by Chuck Palahniuk",
                     description: "A provocative novel about addiction, identity, and the absurdity of modern life.",
                     coverImage: #imageLiteral(resourceName: "book3"),
                     type: .book),
            
            MediaItem(name: "Тозақ оттары жымындайды",
                     creator: "by Төлен Әбдікұлы",
                     description: "One of the most unique stories in Kazakh Literature, which explores the themes of colonialism and identity.",
                     coverImage: #imageLiteral(resourceName: "book4"),
                     type: .book),
            
            MediaItem(name: "Slaughterhouse 5",
                     creator: "by Kurt Vonnegut",
                     description: "A satirical, science-fiction infused anti-war novel about the bombing of Dresden.",
                     coverImage: #imageLiteral(resourceName: "book5"),
                     type: .book)
        ]
    }()
    
    private lazy var courseCollection: [MediaItem] = {
        return [
            MediaItem(name: "OOP",
                     creator: "Lecturer: Pakizar Shamoi",
                     description: "Object-Oriented Programming fundamentals, principles, and practical exercises.",
                     coverImage: #imageLiteral(resourceName: "course1"),
                     type: .course),
            
            MediaItem(name: "System Design",
                     creator: "by Savoskin",
                     description: "Learn how to design scalable and efficient systems, covering architecture patterns and best practices.",
                     coverImage: #imageLiteral(resourceName: "course2"),
                     type: .course),
            
            MediaItem(name: "Introduction to ML",
                     creator: "by Oliver Jaylet",
                     description: "Basics of Machine Learning, including supervised and unsupervised learning techniques.",
                     coverImage: #imageLiteral(resourceName: "course3"),
                     type: .course),
            
            MediaItem(name: "Media Production",
                     creator: "Lecturer: [Name Unknown]",
                     description: "An overview of media production, covering video, audio, and content creation processes.",
                     coverImage: #imageLiteral(resourceName: "course4"),
                     type: .course),
            
            MediaItem(name: "History of Kazakhstan",
                     creator: "by Arman Jumadil",
                     description: "A comprehensive study of Kazakhstan's history from ancient times to the modern era.",
                     coverImage: #imageLiteral(resourceName: "course5"),
                     type: .course)
        ]
    }()
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    // MARK: - Setup Methods
    private func setupTableView() {
        table.dataSource = self
        table.delegate = self
    }
    
    // MARK: - Helper Methods
    private func getItemsForContentType(_ contentType: ContentType) -> [MediaItem] {
        switch contentType {
        case .movie:
            return movieCollection
        case .audio:
            return musicCollection
        case .book:
            return bookCollection
        case .course:
            return courseCollection
        }
    }
    
    private func getContentType(forSection section: Int) -> ContentType {
        return ContentType.allCases[section]
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return ContentType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let contentType = getContentType(forSection: section)
        return getItemsForContentType(contentType).count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let contentType = getContentType(forSection: section)
        return "Fav \(contentType.rawValue)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contentType = getContentType(forSection: indexPath.section)
        let items = getItemsForContentType(contentType)
        let mediaItem = items[indexPath.row]
        
        switch contentType {
        case .movie:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else {
                return UITableViewCell()
            }
            cell.setupWith(item: mediaItem)
            return cell
            
        case .audio:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "audioCell", for: indexPath) as? AudioTableViewCell else {
                return UITableViewCell()
            }
            cell.setupWith(item: mediaItem)
            return cell
            
        case .book:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as? BookTableViewCell else {
                return UITableViewCell()
            }
            cell.setupWith(item: mediaItem)
            return cell
            
        case .course:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell", for: indexPath) as? CourseTableViewCell else {
                return UITableViewCell()
            }
            cell.setupWith(item: mediaItem)
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    // Delegate methods can be added here if needed
}
