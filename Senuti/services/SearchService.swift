//
//  SearchService.swift
//  Senuti
//
//  Created by Iago Albuquerque on 13/01/18.
//  Copyright © 2018 Andre Iago. All rights reserved.
//

import Foundation
import SwiftyJSON

var taskCreator : URLSessionDataTask!

/**
 Do a asynchronous task to search music 
 */
func searchMusic(viewController vc : MainViewController, artist : String){
    var request = URLRequest(url: URL(string: Constants.ItunesUrl + Constants.term + artist + Constants.entity)! )
    request.httpMethod = Constants.HTTP.Get
    request.addValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
    
    // Async task
    taskCreator = URLSession.shared.dataTask(with: request) { data, response, error in
        DispatchQueue.main.async {
            
            do {
                
                guard let data = data, error == nil else { // check for fundamental networking error
                    print("error=\(String(describing: error))")
                    
                    if let errorHandle = error as NSError? {
                        print(errorHandle.code) // this will print -1009
                        _ = errorHandle.userInfo["NSLocalizedDescription"] as Any
                        
                    }
                    
                    return
                }
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != Constants.HTTP.HttpOK { // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    
                    print("response = \(String(describing: response))")
                    return
                }
                
                var musicVideoArray = Array<MusicVideo>()
                
                do {
                    _ = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                    
                    let json = try JSON(data: data)
                    let jsonResultCount = json.dictionary!["resultCount"]!
                    let jsonResult = json.dictionary!["results"]!
                    for (_,subJson):(String, JSON) in jsonResult {
                        let musicVideoObj = MusicVideo.init(json: subJson)
                        musicVideoArray.append(musicVideoObj!)
                    }
                    
                    vc.returnOfService(musicVideo: musicVideoArray, count: jsonResultCount.stringValue)
                } catch {
                    print("Json Error = \(error)")
                    return
                }
                
            }
        }
        
    }
    taskCreator.resume()
    
}
