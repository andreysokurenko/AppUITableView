//
//  EateriesDetailViewController.swift
//  AppUITableView
//
//  Created by Admin on 03.08.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class EateriesDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var restuarant: Restuarant?
    
    override func viewDidAppear(_ animated: Bool) {
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: restuarant!.image)
//        tableView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
//        tableView.separatorColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        title = restuarant!.name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesDeteilTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Название"
            cell.valueLabel.text = restuarant!.name
        case 1:
            cell.keyLabel.text = "Тип"
            cell.valueLabel.text = restuarant!.type
        case 2:
            cell.keyLabel.text = "Адрес"
            cell.valueLabel.text = restuarant!.location
        case 3:
            cell.keyLabel.text = "Я там был?"
            cell.valueLabel.text = restuarant!.isVisited ? "Да" : "Нет"
            
        default:
            break
        }
        
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
