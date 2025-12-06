//
//  MusicPlayer.swift
//  assigment6
//
//  Created by Baha Toleu on 04.11.2025.
//

import Foundation
import AVFoundation
import SwiftUI

class MusicPlayer: ObservableObject {
    @Published var currentSong: Song?
    @Published var isPlaying = false
    @Published var currentIndex = 0
    
    private var player: AVAudioPlayer?
    private var songs: [Song] = []
    
    init() {
        setupSongs()
    }
    
    private func setupSongs() {
        songs = [
            Song(title: "In My Feelings", imageName: "1", audioFileName: "Drake_-_In_My_Feelings_(SkySound.cc)"),
            Song(title: "One Dance", imageName: "2", audioFileName: "Drake_feat._WizKid_Kyla_-_One_Dance_(SkySound.cc)"),
            Song(title: "Foreword", imageName: "3", audioFileName: "Tyler_The_Creator_-_Foreword_Feat_Can_Rex_Orange_County_Good_Music_(SkySound.cc)"),
            Song(title: "She", imageName: "4", audioFileName: "Tyler_The_Creator_feat_Frank_Ocean_-_She_(SkySound.cc)"),
            Song(title: "Earthquake", imageName: "5", audioFileName: "Tyler_The_Creator_Playboi_Carti_-_Earthquake_(SkySound.cc)")
        ]
        
        if !songs.isEmpty {
            currentSong = songs[0]
        }
    }
    
    func playSong(_ song: Song) {
        guard let url = Bundle.main.url(forResource: song.audioFileName, withExtension: "mp3") else {
            print("Could not find audio file: \(song.audioFileName).mp3")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
            
            currentSong = song
            isPlaying = true
        } catch {
            print("Error playing audio: \(error)")
        }
    }
    
    func playPause() {
        if isPlaying {
            player?.pause()
            isPlaying = false
        } else {
            if let song = currentSong {
                if player == nil {
                    playSong(song)
                } else {
                    player?.play()
                    isPlaying = true
                }
            }
        }
    }
    
    func nextSong() {
        guard let currentSong = currentSong,
              let currentIndex = songs.firstIndex(where: { $0.id == currentSong.id }) else {
            return
        }
        
        let nextIndex = (currentIndex + 1) % songs.count
        self.currentIndex = nextIndex
        playSong(songs[nextIndex])
    }
    
    func previousSong() {
        guard let currentSong = currentSong,
              let currentIndex = songs.firstIndex(where: { $0.id == currentSong.id }) else {
            return
        }
        
        let previousIndex = (currentIndex - 1 + songs.count) % songs.count
        self.currentIndex = previousIndex
        playSong(songs[previousIndex])
    }
    
    func stop() {
        player?.stop()
        isPlaying = false
    }
}

