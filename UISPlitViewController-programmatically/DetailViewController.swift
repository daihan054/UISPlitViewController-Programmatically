//
//  DetailViewController.swift
//  MathMonsters
//
//  Created by REVE Systems on 9/9/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var weaponImageView: UIImageView!

    var monster: Monster? {
      didSet {
        refreshUI()
      }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func refreshUI() {
      loadViewIfNeeded()
      nameLabel.text = monster?.name
      descriptionLabel.text = monster?.description
      iconImageView.image = monster?.icon
      weaponImageView.image = monster?.weapon.image
      
    }

}

extension DetailViewController: MonsterSelectionDelegate {
  func monsterSelected(_ newMonster: Monster) {
    monster = newMonster
  }
}
