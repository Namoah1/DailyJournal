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
    
    var entriesVC: EntriesTableViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //make an entry object
        let newEntry = Entry()
        newEntry.text = entryTextView.text
        newEntry.date = entryDatePicker.date
        
        //Add entry to TV array
        entriesVC?.entries.append(newEntry)
        entriesVC?.tableView.reloadData()
    }
    


}
