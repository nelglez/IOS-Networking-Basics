//
//  ViewController.swift
//  Stuff
//
//  Created by Nelson Gonzalez on 1/21/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    
    func fetchData(_ completionHandler: @escaping () -> Void ) {
        DispatchQueue.global().async {
            let url = URL(string: "https://httpbin.org/delay/10")!
            _ = try! Data(contentsOf: url)

            DispatchQueue.main.async {
                completionHandler()
            }
            
        }
    }

    @IBAction func goButtonPressed(_ sender: UIButton) {
        title = "Starting"
        fetchData {
            self.title = "Done"
        }
//        DispatchQueue.global().async {
//            let url = URL(string: "https://httpbin.org/delay/10")!
//            _ = try! Data(contentsOf: url)
//            //USING UIKIT NOT ON MAIN THREAD!!!!!!!!!!!!!!
//            //Perform all updates of UI on main thread
//            DispatchQueue.main.async {
//                 self.title = "Done"
//            }
//
//        }
        
        
    }
    
}

