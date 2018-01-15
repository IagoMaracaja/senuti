//
//  MainViewController.swift
//  Senuti
//
//  Created by Iago Albuquerque on 13/01/18.
//  Copyright © 2018 Andre Iago. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var indicatorView: NVActivityIndicatorView!
    
    @IBOutlet weak var resultsFoundText: UILabel!
    @IBOutlet weak var searchText: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    private var musicVideoList = Array<MusicVideo>()
    
    @IBAction func search(_ sender: Any) {
        
        
        if (searchTextField.text?.isEmpty)!{
            let storyboard: UIStoryboard = UIStoryboard(name: "Alerts", bundle: nil)
            let alertVc : AlertViewController = storyboard.instantiateViewController(withIdentifier: "alertViewController") as! AlertViewController
            alertVc.modalPresentationStyle = .overCurrentContext
            self.present(alertVc, animated: true, completion: nil)
        }else{
            if (!indicatorView.isAnimating){
                indicatorView.startAnimating()
            }
            self.searchText.text = self.searchTextField.text
            searchMusic(viewController: self, artist: searchTextField.text!)
            self.searchTextField.text = ""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(indicatorView.isAnimating){
            indicatorView.stopAnimating()
        }
        
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        self.tableView.contentInset = UIEdgeInsets.zero
        // Do any additional setup after loading the view.
    }

    func returnOfService(musicVideo list : Array<MusicVideo>, count : String){
        if(indicatorView.isAnimating){
            indicatorView.stopAnimating()
        }
        
        if(list.count <= 0){
            let storyboard: UIStoryboard = UIStoryboard(name: "Alerts", bundle: nil)
            let alertVc : AlertViewController = storyboard.instantiateViewController(withIdentifier: "alertViewController") as! AlertViewController
            alertVc.modalPresentationStyle = .overCurrentContext
            alertVc.alertMessageString = "There are no results to display, please try again."
            self.present(alertVc, animated: true, completion: nil)
        }else{
            self.musicVideoList = list
            self.tableView.reloadData()
        }
        
        self.resultsFoundText.text = "Result found " + count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MusicVideoTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "MusicVideoCell") as! MusicVideoTableViewCell!;
        
        let musicVideo = self.musicVideoList[indexPath.row]
        cell.artistName.text = musicVideo.artistName
        cell.trackTime.text = getTime(millisenconds:musicVideo.trackTimeMillis) 
        cell.songsName.text = musicVideo.trackCensoredName
        cell.urlPreview = musicVideo.previewUrl
        cell.urlItunes = musicVideo.artistViewUrl
        cell.viewController = self
        //downloadImageFromURL(urlImage: musicVideo.artworkUrl100, imageView: cell.artistImage)
        let url = URL(string: musicVideo.artworkUrl100)
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                cell.artistImage.image = UIImage(data: data!)
            }
        }
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 153;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicVideoList.count;
    }
    

}



