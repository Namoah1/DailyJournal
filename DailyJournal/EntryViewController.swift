//
//  EntryViewController.swift
//  DailyJournal
//
//  Created by Nana Adwoa Odeibea Amoah on 7/6/21.
//

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet weak var entryDatePicker: UIDatePicker!
    @IBOutlet weak var entryTextView: UITextView!
    
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if entry == nil {
            //Create Entry
        } else {
            //Fill in info about existing entry
            entryTextView.text = entry!.text
            if let dateDisplay = entry!.date {
                entryDatePicker.date = dateDisplay
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //Create an entry object using CoreData
        if entry == nil{
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                let newEntry = Entry(context: context)
                newEntry.text = entryTextView.text
                newEntry.date = entryDatePicker.date
            }
        }
            
        //Save into CoreData
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
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
    
    
}
