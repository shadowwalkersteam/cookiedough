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
    @IBOutlet weak var dayAndNight: UIBarButtonItem!
    @IBOutlet weak var bkg1: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nccTitle: UILabel!
    @IBOutlet weak var nccDetail: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var countFontSize = 0
    var countDate = 0
    
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
        if (countFontSize % 2 == 0) {
            cookieDoughTitle.font = cookieDoughTitle.font.withSize(23)
            aboutUsDetail.font = aboutUsDetail.font.withSize(20)
            nccTitle.font = nccTitle.font.withSize(23)
            nccDetail.font = nccDetail.font.withSize(20)
            scrollView.contentSize = CGSize(width: 375, height: 2500)
        }
        else {
            cookieDoughTitle.font = cookieDoughTitle.font.withSize(20)
            aboutUsDetail.font = aboutUsDetail.font.withSize(17)
            nccTitle.font = nccTitle.font.withSize(20)
            nccDetail.font = nccDetail.font.withSize(17)
           scrollView.contentSize = CGSize(width: 375, height: 2200)
        }
        countFontSize += 1
    }
    
    @IBAction func copyText(_ sender: Any) {
        
    }
    
    @IBAction func dayAndNight(_ sender: Any) {
        if (countDate % 2 == 0) {
            dayAndNight.image = UIImage(named: "night")
            nccDetail.textColor = UIColor.white
            nccTitle.textColor = UIColor.white
            aboutUsDetail.textColor = UIColor.white
            cookieDoughTitle.textColor = UIColor.white
//            bkg1.image = UIImage(named: "bkg1")
            bkg1.setImageColor(color: UIColor.black)
        }
        else{
            dayAndNight.image = UIImage(named: "day")
            bkg1.image = UIImage(named: "bkg1")
            nccDetail.textColor = UIColor(named: "textColor")
            nccTitle.textColor = UIColor(named: "textColor")
            aboutUsDetail.textColor = UIColor(named: "textColor")
            cookieDoughTitle.textColor = UIColor(named: "textColor")
        }
        countDate += 1
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
extension UIImageView {
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
