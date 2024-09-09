//
//  MasterViewController.swift
//  UISPlitViewController-programmatically
//
//  Created by REVE Systems on 9/9/24.
//

import UIKit

protocol MonsterSelectionDelegate: AnyObject {
  func monsterSelected(_ newMonster: Monster)
}

class MasterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    weak var delegate: MonsterSelectionDelegate?

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
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
        delegate?.monsterSelected(selectedMonster)
        if let detailViewController = delegate as? DetailViewController,
            let detailNavigationController = detailViewController.navigationController {
            splitViewController?
                .showDetailViewController(detailNavigationController, sender: nil)
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

}
