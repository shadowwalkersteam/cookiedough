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
    var itemIndex = 0
    var section = 2
    
    
    //var dataArray = ["Notifications", "About Us","Event Planning","NCC"]
    
    let dataArray = [["Notifications", "About Us", "Event Planning","NCC"], ["Gift Cards", "Baby Goods","Boys","Girls","Furniture"],["Angel Care", "Baby Mori", "Babyzen", "Bebe au Lait", "Bloom", "Boxbo", "Ergobaby", "Gardner and the Gang", "Go Baby Go", "Lorena Canals", "Mommy Hooks", "Nose Frida", "Orbit Baby", "Organic Zoo","Sleepyhead", "Snuglo", "Stokke", "Tiba+Marl", "ToteSavvy", "Tutu du Monde"],["Events", "Baby Registry", "Blog","Contact Us"]]
    
    let headerTitles = ["","Shop +","By Brands", ""]
    
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
        if section == 3 {
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
        }
        if section == 2 {
            return 30
        }
        if section == 3 {
            return 30
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    
        if section == 0 || section == 1 || section == 2{
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
//        if (cell?.textLabel?.text == "By Brands") {
//            cell?.textLabel?.font = cell?.textLabel?.font.bold()
//        }
        return cell!
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setToolbarHidden(false, animated: false)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemIndex = indexPath.row
        section = indexPath.section
//        self.revealViewController().revealToggle(animated: true)
        if (section == 0 && itemIndex == 0) {
            return
        }
        performSegue(withIdentifier: SWSegueFrontIdentifier, sender: nil)
    }

    private func loadURL(progressWebViewController: ProgressWebViewController, url: String, title: String) {
        let url = URL(string: url)
        progressWebViewController.disableZoom = true
        progressWebViewController.navigationItem.title = title
        //progressWebViewController.navigationWay = .browser
        //progressWebViewController.pullToRefresh = true
        progressWebViewController.doneBarButtonItemPosition = .right
        progressWebViewController.rightNavigaionBarItemTypes = [.done]
        progressWebViewController.toolbarItemTypes = [.back, .forward, .reload, .activity]
        progressWebViewController.url = url
        progressWebViewController.headers = ["browser": "in-app browser"]
        progressWebViewController.tintColor = UIColor(named: "colorPrimaryDark")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationController = segue.destination as? UINavigationController, let progressWebViewController = navigationController.topViewController as? ProgressWebViewController else {
            return
        }
        
        if (section == 0) {
            switch itemIndex {
            case 1:
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "aboutus") as! AboutUsController
                self.present(newViewController, animated: true, completion: nil)
                break
                
            case 2:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/event-planning-meeting-request/", title: "Event Planning")
                
            case 3:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/nursery-consulting-center/", title: "NCC Checklist")
                
            default:
                print("Unknown segue \(itemIndex)")
            }
        }
        else if (section == 1) {
            switch itemIndex {
            case 0:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/gift-card/", title: "Gift Cards")
                
            case 1:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/shop/baby-goods/", title: "Baby Goods")
                
            case 2:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/shop/boys/", title: "Boys")
                
            case 3:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/shop/girls/", title: "Girls")
                
            case 4:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/shop/furniture/room-accessories/", title: "Furniture")
                
            default:
                print("Unknown segue \(itemIndex)")
            }
        }
        else if (section == 2) {
            switch itemIndex {
            case 0:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/angel-care/", title: "Angel Care")
                
            case 1:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/baby-mori/", title: "Baby Mori")
                
            case 2:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/babyzen/", title: "Babyzen")
                
            case 3:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/bebe-au-lait/", title: "Bebe au Lait")
                
            case 4:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/bloom/", title: "Bloom")
                
            case 5:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/boxbo/", title: "Boxbo")
                
            case 6:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/ergobaby/", title: "Ergobaby")
                
            case 7:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/gardner-the-gang/", title: "Gardner and the Gang")
                
            case 8:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/go-baby-go/", title: "Go Baby Go")
                
            case 9:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/lorena-canals/", title: "Lorena Canals")
                
            case 10:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/mommy-hooks/", title: "Mommy Hooks")
                
            case 11:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/nose-frida/", title: "Nose Frida")
                
            case 12:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/orbit-baby/", title: "Orbit Baby")
                
            case 13:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/organic-zoo/", title: "Organic Zoo")
                
            case 14:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/sleepyhead/", title: "Sleepyhead")
                
            case 15:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/shop/snuglo/", title: "Snuglo")
                
            case 16:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/stokke/", title: "Stokke")
                
            case 17:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/tibamarl/", title: "Tiba+Marl")
                
            case 18:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/totesavvy/", title: "ToteSavvy")
                
            case 19:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/product-category/tutu-du-monde/", title: "Tutu du Monde")
                
            default:
                print("Unknown segue \(itemIndex)")
            }
        }
            
        else if (section == 3) {
            switch itemIndex {
            case 0:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/ncc-parents-workshops-and-seminars/", title: "Events")
                
            case 1:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/baby-registry/", title: "Baby Registry")
                
            case 2:
                loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/blog/", title: "Blog")
                
            case 3:
                 loadURL(progressWebViewController: progressWebViewController ,url: "https://cookiedoughboutique.com/contact/", title: "Contact US")
                
            default:
                print("Unknown segue \(itemIndex)")
            }
        }
    }
}
extension UIFont {
    
    func withTraits(traits:UIFontDescriptorSymbolicTraits...) -> UIFont {
        let descriptor = self.fontDescriptor
            .withSymbolicTraits(UIFontDescriptorSymbolicTraits(traits))
        return UIFont(descriptor: descriptor!, size: 0)
    }
    
    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }
}
    
