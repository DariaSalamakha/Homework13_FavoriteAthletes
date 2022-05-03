import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
        static let EditAthlete = "EditAthlete"
    }

    var athletes: [Athlete] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = athlete.name
        content.secondaryText = athlete.description
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let atleteFormViewController = segue.destination as? AthleteFormViewController else {return}
        
        if let indexPath = tableView.indexPathForSelectedRow, segue.identifier == PropertyKeys.EditAthlete {
            atleteFormViewController.athlete = athletes[indexPath.row]
        }
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard let source = segue.source as? AthleteFormViewController, let athlete = source.athlete else {return}
        
        if let indePath = tableView.indexPathForSelectedRow {
            athletes.remove(at: indePath.row)
            athletes.insert(athlete, at: indePath.row)
            tableView.deselectRow(at: indePath, animated: true)
        } else {
            athletes.append(athlete)
        }
    }
}
