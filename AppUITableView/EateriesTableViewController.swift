//
//  EateriesTableViewController.swift
//  AppUITableView
//
//  Created by Admin on 01.08.18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class EateriesTableViewController: UITableViewController {
    
    
    var restuarants = [
        Restuarant(name: "Example 1", type: "Cafe", location: "Example 1", image: "images.jpg", isVisited: false),
        Restuarant(name: "Example 2", type: "Cafe", location: "Example 2", image: "images2.jpg", isVisited: false),
        Restuarant(name: "Example 3", type: "Cafe", location: "Example 3", image: "images3.jpg", isVisited: false),
        Restuarant(name: "Example 4", type: "Cafe", location: "Example 4", image: "images4.jpg", isVisited: false),
        Restuarant(name: "Example 5", type: "Cafe", location: "Example 5", image: "images5.jpg", isVisited: false),
        Restuarant(name: "Example 6", type: "Cafe", location: "Example 6", image: "images6.jpg", isVisited: false),
        Restuarant(name: "Example 7", type: "Cafe", location: "Example 7", image: "images7.jpg", isVisited: false),
        Restuarant(name: "Example 8", type: "Cafe", location: "Example 8", image: "images8.jpg", isVisited: false),
        Restuarant(name: "Example 9", type: "Cafe", location: "Example 9", image: "images9.jpg", isVisited: false),
        Restuarant(name: "Example 10", type: "Cafe", location: "Example 10", image: "images10.jpg", isVisited: false),
        Restuarant(name: "Example 11", type: "Cafe", location: "Example 11", image: "images11.jpg", isVisited: false),
        Restuarant(name: "Example 12", type: "Cafe", location: "Example 12", image: "images12.jpg", isVisited: false),

        ]
    override func viewDidAppear(_ animated: Bool) {
        
        navigationController?.hidesBarsOnSwipe = true
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restuarants.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell
        cell.logoImageView.image = UIImage(named: restuarants[indexPath.row].image)
        cell.nameLabel.text = restuarants[indexPath.row].name
        cell.logoImageView.layer.cornerRadius = 32.5
        cell.logoImageView.clipsToBounds = true
        cell.locationLabel.text = restuarants[indexPath.row].location
        cell.typeLabel.text = restuarants[indexPath.row].type
        
        if self.restuarants[indexPath.row].isVisited {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }
    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let ac = UIAlertController(title: nil, message: "Выбирете действие", preferredStyle: .actionSheet)
//        let alertAction = UIAlertAction(title: "Позвонить: 066-999-99-9\(indexPath.row)", style: .default){
//            (action: UIAlertAction) -> Void in
//            let alertC = UIAlertController(title: nil, message: "Вызов не может быть совершен", preferredStyle: .alert)
//            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alertC.addAction(ok)
//            self.present(alertC, animated: true, completion: nil)
//        }
//        let isVisitedTitle = self.restaurantIsVisited[indexPath.row] ? "Я был здесь" : "Я не был здесь"
//        let isVisited = UIAlertAction(title: isVisitedTitle, style: .default) { (action) in
//            let cell = tableView.cellForRow(at: indexPath)
//            self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
//            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .checkmark : .none
//            
//        }
//        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//        ac.addAction(cancel)
//        ac.addAction(isVisited)
//        ac.addAction(alertAction)
//        present(ac, animated: true, completion: nil)
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            self.restaurantNames.remove(at: indexPath.row)
//            self.restuarantImage.remove(at: indexPath.row)
//            self.restaurantIsVisited.remove(at: indexPath.row)
//        }
//       // tableView.reloadData()
//        tableView.deleteRows(at: [indexPath], with: .fade)
//        
//    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let share = UITableViewRowAction(style: .default, title: "Поделиться") { (action, indexPath) in
            let defaultText = "Я сейчас в" + self.restuarants[indexPath.row].name
            if   let image = UIImage(named: self.restuarants[indexPath.row].image) {
                let activityControl = UIActivityViewController(activityItems: [defaultText, image ], applicationActivities: nil)
                self.present(activityControl, animated: true, completion: nil)
            }
        }
        
        let delete = UITableViewRowAction(style: .default, title: "Удалить") { (action, indexPath) in
            self.restuarants.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)

        }
        share.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        delete.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
     return [delete, share]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! EateriesDetailViewController
                dvc.restuarant = self.restuarants[indexPath.row]
                
            }
        }
    }
    
    
    
}
