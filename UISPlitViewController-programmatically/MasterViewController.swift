//
//  MasterViewController.swift
//  UISPlitViewController-programmatically
//
//  Created by REVE Systems on 9/9/24.
//

import UIKit

class MasterViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    let monsters = [
        Monster(name: "Cat-Bot", description: "MEE-OW",
                iconName: "meetcatbot", weapon: .sword),
        Monster(name: "Dog-Bot", description: "BOW-WOW",
                iconName: "meetdogbot", weapon: .blowgun),
        Monster(name: "Explode-Bot", description: "BOOM!",
                iconName: "meetexplodebot", weapon: .smoke),
        Monster(name: "Fire-Bot", description: "Will Make You Steamed",
                iconName: "meetfirebot", weapon: .ninjaStar),
        Monster(name: "Ice-Bot", description: "Has A Chilling Effect",
                iconName: "meeticebot", weapon: .fire),
        Monster(name: "Mini-Tomato-Bot", description: "Extremely Handsome",
                iconName: "meetminitomatobot", weapon: .ninjaStar)
      ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }
}

extension MasterViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return monsters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else {
            return UITableViewCell()
        }
        let monster = monsters[indexPath.row]
        cell.nameLabel.text = monster.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMonster = monsters[indexPath.row]
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detailVC.monster = selectedMonster
        splitViewController?
            .showDetailViewController(detailVC, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}
