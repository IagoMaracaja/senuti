//
//  Utils.swift
//  Senuti
//
//  Created by Iago Albuquerque on 14/01/18.
//  Copyright © 2018 Andre Iago. All rights reserved.
//

import Foundation
import UIKit


func getTime(millisenconds s : String) -> String {
    let interval = Double(s)
    let time = interval?.minuteSecondMS
    return time!
}

extension TimeInterval {
    var minuteSecondMS: String {
        return String(format:"%d:%02d", minute, second, millisecond)
    }
    var minute: Int {
        return Int((self/60).truncatingRemainder(dividingBy: 60))
    }
    var second: Int {
        return Int(truncatingRemainder(dividingBy: 60))
    }
    var millisecond: Int {
        return Int((self*1000).truncatingRemainder(dividingBy: 1000))
    }
}

extension Int {
    var msToSeconds: Double {
        return Double(self) / 1000
    }
}

func downloadImageFromURL (urlImage urlImg : String, imageView : UIImageView) {
    let url = URL(string: urlImg)
    
    DispatchQueue.global().async {
        let data = try? Data(contentsOf: url!)
        DispatchQueue.main.async {
            imageView.image = UIImage(data: data!)
        }
    }
}
