//
//  Song.swift
//  assigment6
//
//  Created by Baha Toleu on 04.11.2025.
//

import Foundation

struct Song: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
    let audioFileName: String
}

