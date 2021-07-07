//
//  EntryViewController.swift
//  DailyJournal
//
//  Created by Nana Adwoa Odeibea Amoah on 7/6/21.
//

import UIKit

class EntryViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var entryDatePicker: UIDatePicker!
    @IBOutlet weak var entryTextView: UITextView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)

        if entry == nil {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                entry = Entry(context: context)
                entry?.text = "Today was... "
                entry?.date = entryDatePicker.date
                entryTextView.becomeFirstResponder()
            }
        }
        
        entryTextView.text = entry?.text
        if let dateDisplay = entry?.date {
            entryDatePicker.date = dateDisplay
        }
        
        entryTextView.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //Create an entry object using CoreData
        if entry == nil{
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                entry = Entry(context: context)
                entry?.text = entryTextView.text
                entry?.date = entryDatePicker.date
            }
        }
        
        // Saves when the user goes into already saved entry and makes changes to text
        entry?.text = entryTextView.text
        entry?.date = entryDatePicker.date
            
        //Save into CoreData
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    //obj added so #selector thing works
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            bottomConstraint.constant = keyboardHeight
        }
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        if entry != nil {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                context.delete(entry!)
                
                //Function is a function that throws so need to use 'try?'
                try? context.save()
            }
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func datePickerChanged(_ sender: Any) {
        entry?.date = entryDatePicker.date
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        entry?.text = entryTextView.text
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()

    }
    
    
}
