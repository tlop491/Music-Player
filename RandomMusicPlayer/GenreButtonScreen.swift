//
//  GenreButtonScreen.swift
//  RandomMusicPlayer
//
//  Created by Tim Lopez on 15/02/19.
//  Copyright © 2019 Tim Lopez. All rights reserved.
//

import UIKit
import MediaPlayer

class GenreButtonScreen: UIViewController {

    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func GenreButtonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization{ (status) in
            if status == .authorized{
            self.playGenre(genre: sender.currentTitle!)

            }
        }
    }
    @IBAction func StopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func NextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre : String) {
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
    }
}
