//
//  ViewController.swift
//  DocSample
//
//  Created by Gabriel Theodoropoulos on 26/4/16.
//  Copyright © 2016 Appcoda. All rights reserved.
//

import UIKit

/**
    The purpose of the `ViewController` view controller is to provide a user interface where a fullname can be created by a first and last name, and to break a fullname into its components at the same time.
 
    There's a matching scene in the *Main.storyboard* file, and in that scene there are three textfields and two buttons. Go to Interface Builder for details.
 
    The `ViewController` class is a subclass of the `UIViewController`, and it conforms to the `UITextFieldDelegate` protocol.
*/
class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: IBOutlet Properties
    
    /// The textfield for the first name.
    @IBOutlet weak var txtFirstName: UITextField!
    
    /// The textfield for the lastname.
    @IBOutlet weak var txtLastName: UITextField!
    
    /// The textfield for the fullname.
    @IBOutlet weak var txtFullName: UITextField!
    
    
    // MARK: Default View Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        txtFirstName.delegate = self
        txtLastName.delegate = self
        txtFullName.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: IBAction Methods

    /**
        It triggers the creation of the full name by concatenating the first and last names.
    
        - Parameter sender: The button that invokes this IBAction method.
    
        ### How it works ###
        If the `txtFirstName` or the `txtLastName` does not contain any text, the full name is not created. In any other case, the fullname is set to the `txtFullname` textfield once it's created.
    
        - Remark:
            It calls the `createFullName(_:lastname:)` custom method to compose the fullname.
    
        - SeeAlso:
            `createFullName(_:lastname:)`
    */
    @IBAction func composeFullname(sender: AnyObject) {
        if txtFirstName.text?.characters.count > 0 && txtLastName.text?.characters.count > 0 {
            txtFullName.text = createFullName(txtFirstName.text!, lastname: txtLastName.text!)
        }
    }
    
    
    /**
        It triggers the breaking of the fullname being in the `txtFullName` textfield into its components.
     
        If the `txtFullName` *does not contain any text* then nothing happens. In the opposite case, the fullname is broken into its parts (first name and last name) and each value is set to the `txtFirstName` and `txtLastName` respectively.
     
        - Parameter sender: The button that invokes this IBAction method.
     
        - SeeAlso: `breakFullNameIntoParts(_:)`
    */
    @IBAction func breakFullname(sender: AnyObject) {
        if txtFullName.text?.characters.count > 0 {
            let nameParts = breakFullNameIntoParts(txtFullName.text!)
            txtFirstName.text = nameParts.firstname
            txtLastName.text = nameParts.lastname
        }
    }
    
    
    
    // MARK: Custom Methods
    
    /**
        It composes a fullname based on the first and last names given as parameters.
    
        - Parameter firstname: The first part of the full name.
        - Parameter lastname: The second part of the fullname.
        - Returns: The full name as a string value.
        
        - Warning:
            Both the first and last name should not be *nil* values.
    */
    func createFullName(firstname: String, lastname: String) -> String {
        return "\(firstname) \(lastname)"
    }
 
    
    /**
        It breaks the fullname given as a parameter into its components.
     
        - Remark:
        There's a counterpart method that concatenates the first and last name into a full name.
     
        - SeeAlso:  `createFullName(_:lastname:)`
     
        - Precondition: `fullname` should not be nil.
        - Requires: Both first and last name should be parts of the full name, separated with a *space character*.
     
        - Warning: A *crash* will occur if the parameter is a *nil* value.
     
        - Parameter fullname: The fullname that will be broken into its parts.
        - Returns: A **tuple** with the first and last name.
     */
    func breakFullNameIntoParts(fullname: String) -> (firstname: String, lastname: String) {
        let fullnameInPieces = fullname.componentsSeparatedByString(" ")
        return (fullnameInPieces[0], fullnameInPieces[1])
    }
    
    
    // MARK: UITextFieldDelegate Methods
    
    /// It's used to dismiss the keyboard.
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

