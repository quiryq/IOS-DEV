//
//  ContentView.swift
//  assigment6
//
//  Created by Baha Toleu on 04.11.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var musicPlayer = MusicPlayer()
    
    var body: some View {
        VStack(spacing: 30) {
            // Album Art
            if let currentSong = musicPlayer.currentSong {
                Image(currentSong.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                
                // Song Title
                Text(currentSong.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Control Buttons
                HStack(spacing: 40) {
                    // Previous Button
                    Button(action: {
                        musicPlayer.previousSong()
                    }) {
                        Image(systemName: "backward.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.primary)
                    }
                    
                    // Play/Pause Button
                    Button(action: {
                        musicPlayer.playPause()
                    }) {
                        Image(systemName: musicPlayer.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.primary)
                    }
                    
                    // Next Button
                    Button(action: {
                        musicPlayer.nextSong()
                    }) {
                        Image(systemName: "forward.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
