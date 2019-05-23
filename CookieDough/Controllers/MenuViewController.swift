//
//  MenuViewController.swift
//  CookieDough
//
//  Created by Umair Ahmad on 5/21/19.
//  Copyright © 2019 Zohaib. All rights reserved.
//

import UIKit
import ProgressWebViewController

class MenuViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var menutableView: UITableView!
    
    
    //var dataArray = ["Notifications", "About Us","Event Planning","NCC"]
    
    let dataArray = [["Notifications", "About Us", "Event Planning","NCC"], ["By brands", "Gift Cards", "Baby Goods","Boys","Girls","Furniture"],["Events", "Baby Registry", "Blog","Contact Us"]]
    
    let headerTitles = ["","Shop +", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menutableView.delegate = self
        menutableView.dataSource = self
        
        
        menutableView.tableFooterView = UIView()
        menutableView.separatorStyle = .none

    
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return dataArray.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitles.count {
            return headerTitles[section]
        }
        
        return nil
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if section == 2 {
            let v = UIView(frame: CGRect(x: 0, y:0, width: tableView.frame.width, height: 30))
            //v.backgroundColor = .yellow
            let label = UILabel(frame: CGRect(x: 8.0, y: 4.0, width: v.bounds.size.width - 16.0, height: v.bounds.size.height - 8.0))
            label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            label.text = ""
            v.addSubview(label)
            return v
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 1 {
            return 30
        }else if section == 2 {
            return 10
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    
        if section == 0 || section == 1 {
            let v = UIView(frame: CGRect(x: 0, y:0, width: tableView.frame.width, height: 1))
            v.backgroundColor = UIColor.purple
            
//            let label = UILabel(frame: CGRect(x: 8.0, y: 4.0, width: v.bounds.size.width - 16.0, height: v.bounds.size.height - 8.0))
//            label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//            //label.text = "Header for Third Section"
//            v.addSubview(label)
            
            return v
        }
        
        
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? UITableViewCell
        
        cell?.textLabel?.text = dataArray[indexPath.section][indexPath.row]
        
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         self.navigationController?.setNavigationBarHidden(false, animated: false)
         performSegue(withIdentifier: "webview", sender: self)
    }

    private func loadURL(progressWebViewController: ProgressWebViewController, url: String, title: String) {
        let url = URL(string: url)
        progressWebViewController.disableZoom = true
        progressWebViewController.navigationItem.title = title
        //progressWebViewController.navigationWay = .browser
        //progressWebViewController.pullToRefresh = true
        progressWebViewController.toolbarItemTypes = [.back, .forward, .reload, .activity]
        progressWebViewController.url = url
        progressWebViewController.doneBarButtonItemPosition = .none
        progressWebViewController.headers = ["browser": "in-app browser"]
        progressWebViewController.tintColor = UIColor(named: "colorPrimaryDark")
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let progressWebViewController = segue.destination as? ProgressWebViewController
            loadURL(progressWebViewController: progressWebViewController! ,url: "https://cookiedoughboutique.com/ncc-parents-workshops-and-seminars/", title: "Events")
    }
    
}
    
