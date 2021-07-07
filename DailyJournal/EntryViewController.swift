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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //Create an entry object using CoreData
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newEntry = Entry(context: context)
            newEntry.text = entryTextView.text
            newEntry.date = entryDatePicker.date
            
            //Save into CoreData
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
        
    }
    


}
