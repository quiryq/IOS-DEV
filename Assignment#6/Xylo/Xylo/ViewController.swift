//
//  ViewController.swift
//  Xylo
//
//  Created by Arman Myrzakanurov on 30.10.2025.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction private func buttonDidTap(_ sender: UIButton) {
        let soundName = sender.titleLabel?.text ?? ""
        playSound(name: soundName)
    }

    private func playSound(name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav") else {
            return
        }
        player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
    }
}
