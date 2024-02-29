//
//  Utilities.swift
//  Royal'sHospital
//
//  Created by Bilal's MacBook👑 on 08/02/2024.
//


import UIKit
import SwiftUI


class Utilities {
    //Checks if password is strong enough according to firebase need
  static func isPasswordValid(_ password: String) -> Bool {
    let passwordRegex = "^(?=.*[a-z])(?=.*[$Q$#1%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
    return passwordTest.evaluate(with: password)
  }
}



