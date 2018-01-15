//
//  AlertViewController.swift
//  Senuti
//
//  Created by Iago Albuquerque on 14/01/18.
//  Copyright © 2018 Andre Iago. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    @IBOutlet var allContentView: UIView!
    @IBOutlet weak var alertTitle: UILabel!
    @IBOutlet weak var cardContent: UIView!
    @IBOutlet weak var logoContent: UIView!
    @IBOutlet weak var alertMessage: UILabel!

    var alertMessageString : String!
    
    @IBAction func onOkClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.logoContent.layer.cornerRadius = self.logoContent.frame.size.width / 2
        self.logoContent.clipsToBounds = true
        
        self.cardContent.layer.cornerRadius = 10
        self.cardContent.layer.borderWidth = 0
        self.cardContent.layer.shadowRadius = 5
        self.cardContent.layer.shadowColor = UIColor.black.cgColor;
        self.cardContent.layer.shadowRadius = 5.0
        self.cardContent.layer.shadowOpacity = 0.6
        self.cardContent.layer.shadowOffset = CGSize(width: -5, height: 5);
        
        if(alertMessageString != nil){
            self.alertMessage.text = alertMessageString
        }
        
        self.view.backgroundColor = UIColor.clear
    }



}
