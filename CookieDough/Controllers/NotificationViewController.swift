//
//  NotificationViewController.swift
//  CookieDough
//
//  Created by Zohaib on 5/27/19.
//  Copyright © 2019 Zohaib. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let placeData = UserDefaults.standard.data(forKey: "places")
        
        if (placeData != nil) {
            let placeArray = try! JSONDecoder().decode([NotificationHandler].self, from: placeData!)
            return placeArray.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationcell", for: indexPath) as? HeadlineTableViewCell
        
        let placeData = UserDefaults.standard.data(forKey: "places")
        if (placeData != nil) {
            let placeArray = try! JSONDecoder().decode([NotificationHandler].self, from: placeData!)
            cell?.title.text = placeArray[indexPath.row].title
            cell?.body.text = placeArray[indexPath.row].body
        }
        return cell!
    }
    
    @IBAction func clearAllNotifications(_ sender: Any) {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
}
