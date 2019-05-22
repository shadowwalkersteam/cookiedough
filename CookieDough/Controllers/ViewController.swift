//
//  ViewController.swift
//  CookieDough
//
//  Created by Zohaib on 5/15/19.
//  Copyright © 2019 Zohaib. All rights reserved.
//

import UIKit
import ProgressWebViewController

class ViewController: UIViewController {
    @IBOutlet weak var webview: UIWebView!
    
    @IBOutlet weak var menuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.navigationController?.navigationBar.topItem?.title = " "
        self.navigationController?.setToolbarHidden(true, animated: false)
        let url = URL(string: "https://cookiedoughboutique.com/mobileslider/")
        let requestObj = URLRequest(url: url! as URL)
        webview.loadRequest(requestObj)
        webview.scrollView.isScrollEnabled = false
        
        menuBtn.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        
        
        //menuBtn.actions(forTarget: revealViewController(), forControlEvent: .touchUpInside)
        //menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
      
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        let progressWebViewController = segue.destination as? ProgressWebViewController
        
        switch identifier {
        case "events":
            loadURL(progressWebViewController: progressWebViewController! ,url: "https://cookiedoughboutique.com/ncc-parents-workshops-and-seminars/", title: "Events")
            
        case "shops":
            loadURL(progressWebViewController: progressWebViewController! ,url: "https://cookiedoughboutique.com/product-category/shop/", title: "Shops")
            
        case "ncc":
            loadURL(progressWebViewController: progressWebViewController! ,url: "https://cookiedoughboutique.com/nursery-consulting-center/", title: "NCC Checklist")
            
        case "babyRegistry":
            loadURL(progressWebViewController: progressWebViewController! ,url: "https://cookiedoughboutique.com/baby-registry/", title: "Baby Registry")
            
        case "aboutUSPage":
            _ = segue.destination as! AboutUsController
            
        default:
            print("Unknown segue \(identifier)")
        }
    }
    
    private func loadURL(progressWebViewController: ProgressWebViewController, url: String, title: String) {
        let url = URL(string: url)
        progressWebViewController.disableZoom = true
        progressWebViewController.navigationItem.title = title
        //progressWebViewController.navigationWay = .browser
        //progressWebViewController.pullToRefresh = true
        //progressWebViewController.toolbarItemTypes = [.back, .forward, .reload, .activity]
        progressWebViewController.url = url
        progressWebViewController.headers = ["browser": "in-app browser"]
        progressWebViewController.tintColor = UIColor(named: "colorPrimaryDark")
    }
    
    @IBAction func location(_ sender: Any) {
       if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
            UIApplication.shared.openURL(URL(string:"https://www.google.com/maps/place/Cookie+Dough+Boutique/@33.897451,35.4904273,17z/data=!3m1!4b1!4m5!3m4!1s0x151f16d91aa5c681:0x530326459cfe5bb1!8m2!3d33.897451!4d35.492616?hl=en-US")!)
        }
        else {
        UIApplication.shared.openURL(NSURL(string: "https://maps.apple.com/?address=May%20Ziadeh%20Street,%20%D8%A8%D9%8A%D8%B1%D9%88%D8%AA,%20%D9%84%D8%A8%D9%86%D8%A7%D9%86&auid=1739460782726829717&ll=33.897468,35.492648&lsp=9902&q=Cookie%20Dough&_ext=ChkKBQgEEJgBCgQIBRADCgQIBhAWCgQIChAAEiQpaNbhy8LyQEAxuYhbouu+QUA5tJocq/3yQEBBv1OojzK/QUA%3D&t=m")! as URL)
        }
    }
}
