//
//  AddChecklistItemViewController.swift
//  TableView_Abimael
//
//  Created by Abimael Reyes Lopez on 4/10/18.
//  Copyright © 2018 Abimael Reyes Lopez. All rights reserved.
//

import UIKit

class AddChecklistItemViewController: UIViewController {

    
    @IBOutlet weak var de: UITextView!{
        didSet {
            descriptionTextView.text = "Description"
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "New Item"
    }
    

    
}
