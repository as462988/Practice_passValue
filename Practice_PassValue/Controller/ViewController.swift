//
//  ViewController.swift
//  Practice_PassValue
//
//  Created by yueh on 2019/8/20.
//  Copyright © 2019 yueh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!{
        
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    var showArray = ["2", "3", "4", "5"]
    
    var selectIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let  textVC = segue.destination as? TextViewController  else { return }
        
        //        textVC.handler = { [weak self] text in
        //
        //            self?.showArray.append(text)
        //            self?.tableView.reloadData()
        //        }
        
        textVC.addDelegate = self
    }
}


extension ViewController: UITableViewDataSource{
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
        
        cell.deleteHandler = { [weak self] in
            self?.showArray.remove(at: indexPath.row)
            self?.tableView.reloadData()
        }
        
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

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let textVC = storyboard?.instantiateViewController(withIdentifier: "textVC") as? TextViewController else {
            return
        }
        
        textVC.text = showArray[indexPath.row]
        
        //        textVC.handler = { [weak self] (text) in
        //
        //            self?.showArray[indexPath.row] = text
        //
        //            tableView.reloadData()
        //
        //        }
        textVC.changeDelegate = self
        selectIndex = indexPath.row
        
        navigationController?.pushViewController(textVC, animated: true)
        
    }
}

//Mark: - Delegate Pattern
extension ViewController: TableViewCellDelegate {
    
    func clickBtn(_ cell: TableViewCell){
        guard let index = tableView.indexPath(for: cell) else {return}
        showArray.remove(at: index.row)
        tableView.deleteRows(at: [index], with: .fade)
        tableView.reloadData()
    }
}

extension ViewController: TextViewControllerDelegate {
    
    //    func passText(text: String) {
    //
    //        if selectIndex == nil {
    //        showArray.append(text)
    //        tableView.reloadData()
    //        } else {
    //
    //        showArray[selectIndex ?? 0] = text
    //        tableView.reloadData()
    //        selectIndex = nil
    //        }
    //    }
    //
    func passText(text: String) {
        
        showArray.append(text)
        tableView.reloadData()
    }
    
    func changeText(text: String) {
        
        guard let selectIndex = selectIndex else { return }
        showArray[selectIndex] = text
        tableView.reloadData()
    }
}




