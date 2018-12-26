//
//  TableViewController.swift
//  itmo-dlc-app
//
//  Created by Pomavau on 26.12.2018.
//  Copyright © 2018 Andrei Vlasov. All rights reserved.
//

import Foundation
import UIKit

class TableViewController : UITableViewController
{
    @IBOutlet weak var subjectTitleLabel: UILabel!
    @IBOutlet weak var subjectMarkLabel: UILabel!
    
    private let subjectsArray = ["Архитектура вычислительных систем", "Вычисилительная математика", "Физика", "Математика"]
    private let marksArray = [100, 95, 5, 0]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshControl = UIRefreshControl()
        //refreshControl?.attributedTitle = NSAttributedString(string: "Идет обновление...")
        refreshControl?.addTarget(self, action: #selector(TableViewController.refresh), for: UIControl.Event.valueChanged)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "subjectInfoSegue" {
            
            let detailViewController = segue.destination
                as! UITableViewController
            
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            //detailViewController.webSite = webAddresses[row]
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjectsArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(80)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.subjectLabel!.text = subjectsArray[indexPath.row]
        cell.markLabel!.text = String(marksArray[indexPath.row])
        
        //cell.textLabel!.font = UIFont.systemFont(ofSize: 16.0)
        //cell.textLabel!.text = subjectsArray[indexPath.row]
        
        return cell
    }
    
    

    // ASYNC : https://www.electrollama.net/blog/2017/1/6/updating-ui-from-background-threads-simple-threading-in-swift-3-for-ios
    func BG(_ block: @escaping ()->Void) {
        DispatchQueue.global(qos: .default).async(execute: block)
    }
    
    @objc func refresh(sender:AnyObject) {
        refreshBegin(newtext: "Refresh",
                     refreshEnd: {() -> () in
                        self.tableView.reloadData()
                        self.refreshControl!.endRefreshing()
        })
    }
//
    func refreshBegin(newtext:String, refreshEnd:@escaping () -> ()) {
        BG {
            //sleep(2)
            for i in 0..<100000 // testing async
            {
                print(i)
            }
        }
        refreshEnd()
    }
    
}
