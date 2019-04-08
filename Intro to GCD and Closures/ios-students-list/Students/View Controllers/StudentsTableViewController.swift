//
//  StudentsTableViewController.swift
//  Students
//
//  Created by Nelson Gonzalez on 1/19/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController {

    var students: [Student] = [] {
        didSet {
            DispatchQueue.main.async {
                 self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return students.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentsCell", for: indexPath)
        
        cell.textLabel?.text = students[indexPath.row].name
        
        return cell
    }
   

   
}
