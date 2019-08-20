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
        cell.delegate = self
        cell.label.text = showArray[indexPath.row]
        cell.deleteBtn.tag = indexPath.row
//        cell.deleteBtn.addTarget(self, action: #selector(deleteBtnClick(_:)), for: .touchUpInside)
//
        return cell
    }
    
    //Mark: - Target-Action
//    @objc func deleteBtnClick(_ sender: UIButton){
//
//        let index = IndexPath(row: sender.tag, section: 0)
//        showArray.remove(at: sender.tag)
//        tableView.deleteRows(at: [index], with: .fade)
//        tableView.reloadData()
//    }
}

extension ViewController: TableViewCellDelegate {
    
    func clickBtn(_ cell: TableViewCell){
        guard let index = tableView.indexPath(for: cell) else {return}
        showArray.remove(at: index.row)
        tableView.deleteRows(at: [index], with: .fade)
        tableView.reloadData()
    }
}


