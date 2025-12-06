//
//  CourseViewController.swift
//  NavigationApp
//
//  Created by Toleu Bakhauddin
//

import UIKit

// Collection of courses to display
private let courseList: [TableItem] = [
TableItem(title: "OOP",
          subtitle: "Lecturer: Pakizar Shamoi",
          review: "Object-Oriented Programming fundamentals, principles, and practical exercises.",
          image: #imageLiteral(resourceName: "course1"),
          category: .course),

TableItem(title: "System Design",
          subtitle: "by Savoskin",
          review: "Learn how to design scalable and efficient systems, covering architecture patterns and best practices.",
          image: #imageLiteral(resourceName: "course2"),
          category: .course),

TableItem(title: "Introduction to ML",
          subtitle: "by Oliver Jaylet",
          review: "Basics of Machine Learning, including supervised and unsupervised learning techniques.",
          image: #imageLiteral(resourceName: "course3"),
          category: .course),

TableItem(title: "Media Production",
          subtitle: "Lecturer: [Name Unknown]",
          review: "An overview of media production, covering video, audio, and content creation processes.",
          image: #imageLiteral(resourceName: "course4"),
          category: .course),

TableItem(title: "History of Kazakhstan",
          subtitle: "by Arman Jumadil",
          review: "A comprehensive study of Kazakhstan's history from ancient times to the modern era.",
          image: #imageLiteral(resourceName: "course5"),
          category: .course),
TableItem(title: "iOS Development",
              subtitle: "by Arman Myrzakanurov",
              review: "Learn to build native iOS apps, covering Swift, UIKit, and best practices for mobile development.",
              image: #imageLiteral(resourceName: "course6"),
              category: .course),
    
    TableItem(title: "IT Infrastructure and Computer Networks",
              subtitle: "by Temirlan Zhaksylykov",
              review: "Fundamentals of networking, infrastructure management, and IT systems administration.",
              image: #imageLiteral(resourceName: "course7"),
              category: .course),
    
    TableItem(title: "Calculus",
              subtitle: "by Aliya Tursynzhanova",
              review: "A detailed course on differential and integral calculus with practical problem-solving techniques.",
              image: #imageLiteral(resourceName: "course8"),
              category: .course),
    
    TableItem(title: "Advanced Statistics",
              subtitle: "by Damir Eleusizov",
              review: "Explore statistical modeling, inference, and data analysis techniques for complex datasets.",
              image: #imageLiteral(resourceName: "course9"),
              category: .course),
    
    TableItem(title: "ICPC Preparation",
              subtitle: "by Alimzhan Amanov",
              review: "Competitive programming course preparing students for ICPC contests, algorithms, and problem-solving strategies.",
              image: #imageLiteral(resourceName: "course10"),
              category: .course)
]




// View controller for displaying the list of courses
class CourseViewController: ViewController {

    override var items: [TableItem] {
        return courseList
    }
    
    override func createCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseCell") as! CourseTableViewCell
        let course = courseList[indexPath.row]
        cell.configure(with: course)
        return cell
    }
    
    override func getItem(at indexPath: IndexPath) -> TableItem? {
        return courseList[indexPath.row]
    }
}

