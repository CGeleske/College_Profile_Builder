//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by Christopher Geleske on 7/6/15.
//  Copyright © 2015 Christopher Geleske. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var collegeTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var populationField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var college : College!
    
    let webURL = NSURL(string: "http://google.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collegeTextField.text = college.name
        stateTextField.text = college.state
        populationField.text = String(college.population)
        imageView.image = college.image
    }
    
    @IBAction func onSaveButtonTapped(sender: AnyObject) {
        college.name = collegeTextField.text!
        college.state = stateTextField.text!
        college.population = Int(populationField.text!)!
        
    }
    
    @IBAction func websiteFieldHeld(sender: UILongPressGestureRecognizer) {
    }
    


}
