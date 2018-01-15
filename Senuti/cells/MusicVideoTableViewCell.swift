//
//  MusicVideoTableViewCell.swift
//  Senuti
//
//  Created by Iago Albuquerque on 13/01/18.
//  Copyright © 2018 Andre Iago. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class MusicVideoTableViewCell: UITableViewCell {

    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var cardContent: UIView!
    
    @IBOutlet weak var trackTime: UILabel!
    @IBOutlet weak var songsName: UILabel!
    
    var urlPreview : String!
    var urlItunes : String!
    var viewController: MainViewController!
    
    @IBAction func onPreviewClick(_ sender: Any) {
        let videoURL = URL(string: urlPreview)
        let player = AVPlayer(url: videoURL!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        viewController.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
    }

    @IBAction func onVisitItunesClick(_ sender: Any) {
        
        let url = URL(string: urlItunes)!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cardContent.layer.cornerRadius = 10
        self.cardContent.layer.borderWidth = 0.5
        self.cardContent.layer.shadowRadius = 5
        self.cardContent.layer.shadowColor = UIColor.black.cgColor;
        self.cardContent.layer.shadowRadius = 5.0
        self.cardContent.layer.shadowOpacity = 0.6
        self.cardContent.layer.shadowOffset = CGSize(width: -5, height: 5);
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
