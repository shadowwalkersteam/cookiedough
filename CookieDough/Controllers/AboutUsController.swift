//
//  AboutUsController.swift
//  CookieDough
//
//  Created by Zohaib on 5/19/19.
//  Copyright © 2019 Zohaib. All rights reserved.
//

import Foundation
import UIKit

class AboutUsController: UIViewController {
    @IBOutlet weak var cookieDoughTitle: UILabel!
    @IBOutlet weak var aboutUsDetail: UILabel!
    @IBOutlet weak var nccTitle: UIImageView!
    @IBOutlet weak var nccDetail: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var mainToolBar: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainToolBar.clipsToBounds = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @IBAction func nccCheckList(_ sender: Any) {
        guard let url = URL(string: "https://cookiedoughboutique.com/wp-content/uploads/2017/03/checklist.pdf") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func workshops(_ sender: Any) {
        guard let url = URL(string: "https://cookiedoughboutique.com/ncc-parents-workshops-and-seminars/") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func babyLogs(_ sender: Any) {
        guard let url = URL(string: "https://cookiedoughboutique.com/babylogbook.pdf") else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func fontsResize(_ sender: Any) {
        
    }
    
    @IBAction func copyText(_ sender: Any) {
        
    }
    
    @IBAction func dayAndNight(_ sender: Any) {
        
    }

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let appURL = NSURL(string: "youtube://www.youtube.com/watch?v=PTH4JZka3z8")!
        let webURL = NSURL(string: "https://www.youtube.com/watch?v=PTH4JZka3z8")!
        let application = UIApplication.shared
        
        if application.canOpenURL(appURL as URL) {
            application.open(appURL as URL)
        } else {
            application.open(webURL as URL)
        }
    }
}
