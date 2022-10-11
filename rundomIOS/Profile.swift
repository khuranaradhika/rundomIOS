//
//  Profile.swift
//  rundomIOS
//
//  Created by Henry Webb on 10/10/22.
//

import Foundation
struct Profile{
     var firstname = ""
     var lastname = ""
     var birthdate = Date()
     var goal_runs = ""
    static let `default` = Profile(firstname: "Tommy", lastname: "Bird", birthdate: Date(), goal_runs: "69")
}
