//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Raj Tailor on 02/05/2021.
//

import UIKit
import Foundation
import AVFoundation

class ViewController: UIViewController {
    
    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MP3.background.startMusic()
    }
    
    @IBAction func askButtonPressed(_ sender: UIButton) {
        let randomGenerated = Int.random(in: 0..<5)
        imageView.image = ballArray[randomGenerated]
    }
    
}

class MP3{
    static let background = MP3()
    var audioPlayer: AVAudioPlayer?
    
    func startMusic(){
        if let bundle = Bundle.main.path(forResource: "backgroundMusic", ofType: "mp3"){
            let backgroundMusic = NSURL(fileURLWithPath: bundle)
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: backgroundMusic as URL)
                guard let audioPlayer = audioPlayer else {return}
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.play()
            } catch {  
                print(error)
            }
        }
    }
}
