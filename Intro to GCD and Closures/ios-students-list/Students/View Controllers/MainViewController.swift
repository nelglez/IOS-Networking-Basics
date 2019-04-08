//
//  MainViewController.swift
//  Students
//
//  Created by Nelson Gonzalez on 1/19/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var sortSelector: UISegmentedControl!
    
    //reference to table VC
    private var studentsTableVC: StudentsTableViewController!
    private let networkClient = NetworkClient()
    private var students: [Student] = [] {
        didSet {
            updateSort()
            //pass it off to the tableVC
            //*Gets set in updateSort() so we dont need it.
          //  studentsTableVC.students = students
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        networkClient.fetchStudents { (students, error) in
            if let error = error {
                NSLog("Error getting recipes: \(error)")
                return
            }
            self.students = students ?? []
        }
    }
    

   
    // MARK: - Segue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "embedStudentsTableView" {
            let destinationVC = segue.destination as! StudentsTableViewController
            studentsTableVC = destinationVC
        }
    }
    
    
    @IBAction func sort(_ sender: UISegmentedControl) {
   
        updateSort()
    }
    
    private func updateSort() {
        
         DispatchQueue.main.async {
        let sortedStudents: [Student]
        //sort by first name
        
            if self.sortSelector.selectedSegmentIndex == 0 {
//            sortedStudents = students.sorted(by: { (student1, student2) -> Bool in
//                return student1.firstName < student2.firstName
                sortedStudents = self.students.sorted { $0.firstName < $1.firstName }
         //   })
            
        } else {
           //sort by last name
//            sortedStudents = students.sorted(by: { (student1, student2) -> Bool in
//                return (student1.lastName ?? "") < (student2.lastName ?? "")
//            })
                sortedStudents = self.students.sorted { ($0.lastName ?? "") < ($1.lastName ?? "")}
        }
            self.studentsTableVC.students = sortedStudents
        }
    }

}
