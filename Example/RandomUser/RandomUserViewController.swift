//
//  RandomUserViewController.swift
//  RandomUser_Example
//
//  Created by Mudox on 15/11/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import Eureka
import RandomUser
import Kingfisher
import FlagKit

class RandomUserViewController: FormViewController {

  lazy var users: [User] = RandomUserGenerator().users(count: 100)
  var user: User! {
    didSet {
      let values = [
        // basic info
        "Name": "\(user.name.first) \(user.name.last)",
        "Gender": user.gender,
        "Birthday": user.dob,
        // address
        "State": user.location.state,
        "City": user.location.city,
        "Street": user.location.street,
        "Postcode": user.location.postcode,
        // credential
        "User ID": user.login.username,
        "Password": user.login.password,
        // contact
        "Email": user.email,
        "Phone": user.phone,
        "Cell": user.cell,
      ]
      form.setValues(values)

      avatarView?.imageView.kf.setImage(with: user.picture.large)
      avatarView?.flagView.image = Flag(countryCode: user.nat)?.image(style: .roundedRect)
    }
  }

  weak var avatarView: AvatarView? {
    return tableView.tableHeaderView as? AvatarView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    let nib = UINib(nibName: "AvatarView", bundle: nil)
    let headerView = nib.instantiate(withOwner: nil, options: nil).first as! AvatarView
    tableView.tableHeaderView = headerView

    let basicSection = Section("Basic Infomation")
    for tag in ["Name", "Gender", "Birthday"] {
      basicSection <<< TextRow(tag) { row in
        row.title = row.tag
      }.cellUpdate { cell, row in
        cell.textField?.isEnabled = false
      }
    }

    let addressSection = Section("Address")
    for tag in ["State", "City", "Street", "Postcode"] {
      addressSection <<< TextRow(tag) { row in
        row.title = row.tag
      }.cellUpdate { cell, row in
        cell.textField?.isEnabled = false
      }
    }

    let credentialSection = Section("Credential")
    for tag in ["User ID", "Password"] {
      credentialSection <<< TextRow(tag) { row in
        row.title = row.tag
      }.cellUpdate { cell, row in
        cell.textField?.isEnabled = false
      }
    }

    let contactSection = Section("Contact")
    for tag in ["Email", "Phone", "Cell"] {
      contactSection <<< TextRow(tag) { row in
        row.title = row.tag
      }.cellUpdate { cell, row in
        cell.textField?.isEnabled = false
      }
    }

    form += [basicSection, addressSection, credentialSection, contactSection]
    user = users[0]
  }
  
  @IBAction func changeSetting(_ sender: UIBarButtonItem) {
    
  }
  
  @IBAction func dice(_ sender: UIBarButtonItem) {
    user = users[Int(arc4random()) % users.count]
    tableView.reloadData()
  }
}
