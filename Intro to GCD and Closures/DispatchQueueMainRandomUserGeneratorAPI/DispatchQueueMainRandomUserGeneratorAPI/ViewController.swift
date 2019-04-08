//
//  ViewController.swift
//  DispatchQueueMainRandomUserGeneratorAPI
//
//  Created by Nelson Gonzalez on 1/24/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

import UIKit

//enum RandomUserApiError: Error {
//    case noDataReturned
//}

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func fetch(_ sender: UIButton) {
        //jsonprettyprint.net see nice json..
        //jsonlint.com { = dictionary [ = array
        let url = URL(string: "https://randomuser.me/api/?format=json")!
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if error != nil {
                //handle error
                NSLog("Error fetching user: \(error!.localizedDescription)")
                //http://osstatus.com to check error code.
        
                return
            }
            guard let data = data else {return}
            
            let decoder = JSONDecoder()
            
           
                //returns an array of people
                //type: should be representative of the top level structure of the joson which is not an array of person, its a dictionary with string keys "results" and the values are ANY. Because one is array and one is a dictionary value
            //need to make another struct
                let results = try! decoder.decode(PersonResults.self, from: data)
                let people = results.results
            
            //All UIKit needs to be done in the main queue
            
            
            DispatchQueue.main.async {
                self.textView.text = String(describing: people)
            }
   
        }.resume()
    }
    
}

