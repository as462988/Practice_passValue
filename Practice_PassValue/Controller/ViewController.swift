//
//  ViewController.swift
//  Practice_PassValue
//
//  Created by yueh on 2019/8/20.
//  Copyright © 2019 yueh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var showArray = ["2", "3", "4", "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
       
    }

}

extension ViewController:UITableViewDelegate{
    
}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        cell.label.text = showArray[indexPath.row]
        
        return cell
    }
    
    
}

