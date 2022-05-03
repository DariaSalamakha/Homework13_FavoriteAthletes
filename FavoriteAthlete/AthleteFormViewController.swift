//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Daria Salamakha on 10.02.2022.
//

import UIKit

class AthleteFormViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    @IBOutlet weak var leageTextField: UITextField!
   
    var athlete: Athlete?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        guard let athlete = athlete else {return}

        nameTextField.text = athlete.name
        ageTextField.text = athlete.age
        leageTextField.text = athlete.league
        teamTextField.text = athlete.team
    }
  
    // MARK: - Action
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        guard let name = nameTextField.text,
            let age = ageTextField.text,
            let league = leageTextField.text,
            let team = teamTextField.text else {return}
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
        
        performSegue(withIdentifier: "unwindToAthleteTable", sender: self)
    }
    
}


