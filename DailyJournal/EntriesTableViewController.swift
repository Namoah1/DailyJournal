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

    override func viewWillAppear(_ animated: Bool) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            //Conduct a fetch request
            if let entriesFromCoreData = try? context.fetch(Entry.fetchRequest()) as? [Entry] {
                entries = entriesFromCoreData
                self.tableView.reloadData()
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell") as? EntryTableViewCell {
            let entry = entries[indexPath.row]
            cell.entryTextLabel.text = entry.text
            cell.monthLabel.text = entry.month()
            cell.dayLabel.text = entry.day()
            
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entry = entries[indexPath.row]
        performSegue(withIdentifier: "segueToEntry", sender: entry)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let entryVC = segue.destination as? EntryViewController{
            if let entryToBeSent = sender as? Entry{
                entryVC.entry = entryToBeSent
            }
        }
    }


}
