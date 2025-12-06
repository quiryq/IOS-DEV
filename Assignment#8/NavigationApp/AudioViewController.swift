//
//  AudioViewController.swift
//  NavigationApp
//
//  Created by Toleu Bakhauddin
//

import UIKit

// Collection of audio tracks to display
private let audioTracks: [TableItem] = [
    TableItem(title: "LIL FANTASY",
              subtitle: "by CHAEYOUNG",
              review: "Solo album by the member of the group TWICE. CHAEYOUNG have composed and written each of the track exploring her own unique style",
              image: #imageLiteral(resourceName: "track1"),
              category: .audio),
    
    TableItem(title: "2 полста",
              subtitle: "by Валерий Меладзе",
              review: "A soulful album by Валерий Меладзе with classic hits",
              image: #imageLiteral(resourceName: "track2"),
              category: .audio),
    
    TableItem(title: "Live Love A$AP",
              subtitle: "by A$AP ROCKY",
              review: "Energetic live performance captured in this album",
              image: #imageLiteral(resourceName: "track3"),
              category: .audio),
    
    TableItem(title: "Сұранамын",
              subtitle: "by Қайрат Нұртас",
              review: "Emotional album exploring love and life in Kazakh style",
              image: #imageLiteral(resourceName: "track4"),
              category: .audio),
    
    TableItem(title: "Release Some Tension",
              subtitle: "by SWV",
              review: "Classic R&B album full of smooth tracks and harmony",
              image: #imageLiteral(resourceName: "track5"),
              category: .audio),
        TableItem(title: "THIS IS FOR",
                  subtitle: "by TWICE",
                  review: "A powerful album by TWICE blending energetic pop, confidence, and bold musical experimentation",
                  image: #imageLiteral(resourceName: "track6"),
                  category: .audio),
        
        TableItem(title: "B’Day (Deluxe Edition)",
                  subtitle: "by Beyoncé",
                  review: "An iconic deluxe album filled with strong vocals, empowerment, and unforgettable R&B-pop hits",
                  image: #imageLiteral(resourceName: "track7"),
                  category: .audio),
        
        TableItem(title: "БОГ РЭПА",
                  subtitle: "by FACE",
                  review: "A raw and expressive rap album capturing FACE’s signature rebellious style",
                  image: #imageLiteral(resourceName: "track8"),
                  category: .audio),
        
        TableItem(title: "Camp",
                  subtitle: "by Childish Gambino",
                  review: "A creative blend of hip-hop and storytelling where Gambino delivers sharp lyrics and emotional depth",
                  image: #imageLiteral(resourceName: "track9"),
                  category: .audio),
        
        TableItem(title: "DTMF",
                  subtitle: "by Bad Bunny",
                  review: "A dynamic and rhythmic project featuring Bad Bunny’s signature reggaeton and trap energy",
                  image: #imageLiteral(resourceName: "track10"),
                  category: .audio)
    ]



// View controller for displaying the list of audio tracks
class AudioViewController: ViewController {

    override var items: [TableItem] {
        return audioTracks
    }
    
    override func createCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "audioCell") as! AudioTableViewCell
        let track = audioTracks[indexPath.row]
        cell.configure(with: track)
        return cell
    }
    
    override func getItem(at indexPath: IndexPath) -> TableItem? {
        return audioTracks[indexPath.row]
    }
}

