//
//  RosterDetailViewController.swift
//  Offical Class Roster
//
//  Created by Jacquin Wynn Jr on 3/3/15.
//  Copyright (c) 2015 JMW. All rights reserved.
//

import UIKit

class RosterDetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var firstNameTextBox: UITextField!
    @IBOutlet weak var lastNameTextBox: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedPerson = Person(firstName: "Dummy", lastName: "Dummy")

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.firstNameTextBox.delegate = self
        self.lastNameTextBox.delegate = self
        
        self.title = selectedPerson.firstName + "'s" + " " + "Details"
        
        self.nameLabel.text = selectedPerson.firstName + " " + selectedPerson.lastName
        
        self.firstNameTextBox.text = selectedPerson.firstName
        self.lastNameTextBox.text = selectedPerson.lastName
        
        if self.selectedPerson.image == nil {
            self.imageView.image = UIImage(named: "smiley.png")
        } else {
            self.imageView.image = selectedPerson.image
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.selectedPerson.firstName = self.firstNameTextBox.text
        self.selectedPerson.lastName = self.lastNameTextBox.text
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


    
    @IBAction func photoPressed(sender: AnyObject) {
        //Creates an Image Picker -- required
        let imagePickerController = UIImagePickerController()
        //Delegate the controller -- required
        imagePickerController.delegate = self
        
        //Checks if device has a camera
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
        } else {
            imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as UIImage
        self.imageView.image = image
        self.selectedPerson.image = image
        
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
        
        
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
