//
//  ViewController.swift
//  counterApp
//
//  Created by Matheus Mandotti on 09/04/20.
//  Copyright © 2020 Matheus Mandotti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // An INOutlet is used to modify piece of Ui
    @IBOutlet weak var label: UILabel!
    var number: Int = 0
    
    // This is a link to the button
    @IBAction func perform(_ sender: Any) {
        self.number += 1
        self.label.text = String( number )
//        let example: String? = nil
//
//        // this is another way to unwrap
//        if let value = example {
//            print( example )
//        } else {
//            print( "No data in example variable" )
//        }
     
//        // It unwraps the variable
//        guard let number = self.label.text else { return }
//            print( number )
//

    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

