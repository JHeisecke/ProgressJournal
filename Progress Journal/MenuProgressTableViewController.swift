//
//  MenuProgressTableViewController.swift
//  Progress Journal
//
//  Created by User on 2/16/20.
//  Copyright © 2020 jheisecke. All rights reserved.
//

import UIKit

class MenuProgressTableViewController: UITableViewController {

    var progresses: [Progress] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        updateCoreData()
    }

    func updateCoreData() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let progressFromCoreData = try? context.fetch(Progress.fetchRequest()) as? [Progress] {
                //solo entra en el if si no retorna nil, no ocurre ningun error y si el array que retorna el fetch es del tipo ToDoItem
                progresses = progressFromCoreData
            }
        }
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return progresses.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = progresses[indexPath.row].title
        if let imageData = progresses[indexPath.row].image {
            cell.imageView?.image = UIImage(data: imageData)
        }

        return cell
    }
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
                context.delete(progresses[indexPath.row])
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()

            }
        }
        updateCoreData() 
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProgress = progresses[indexPath.row]
        performSegue(withIdentifier: "gotoprogress", sender: selectedProgress)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let showProgressVC = segue.destination as? ShowProgressViewController {
            if let selectedProg = sender as? Progress {
                showProgressVC.progress = selectedProg
            }
        }
    }
}
