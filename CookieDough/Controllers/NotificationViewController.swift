//
//  NotificationViewController.swift
//  CookieDough
//
//  Created by Zohaib on 5/26/19.
//  Copyright © 2019 Zohaib. All rights reserved.
//

import Foundation


class HeadlineTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var body: UILabel!
    
}

class NotificationViewController:  UITableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let placeData = UserDefaults.standard.data(forKey: "places")
        if (placeData != nil) {
            let placeArray = try! JSONDecoder().decode([NotificationHandler].self, from: placeData!)
            return placeArray.count
        }
        else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! HeadlineTableViewCell
        
        let placeData = UserDefaults.standard.data(forKey: "places")
        let placeArray = try! JSONDecoder().decode([NotificationHandler].self, from: placeData!)
        
        for place in placeArray {
            cell.title?.text = place.title
            cell.body?.text = place.body
        }
        return cell
    }
}
