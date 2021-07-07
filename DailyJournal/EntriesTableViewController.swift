//
//  EntriesTableViewController.swift
//  DailyJournal
//
//  Created by Nana Adwoa Odeibea Amoah on 7/6/21.
//

import UIKit

class EntriesTableViewController: UITableViewController {
    
    var entries: [Entry] = []

    override func viewDidLoad() {
        super.viewDidLoad()

    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let entry = entries[indexPath.row]
        
        cell.textLabel?.text = entry.text
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let entryVC = segue.destination as? EntryViewController{
            entryVC.entriesVC = self
        }
    }


}
