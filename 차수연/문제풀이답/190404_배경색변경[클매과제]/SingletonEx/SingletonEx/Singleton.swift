//
//  Singleton.swift
//  SingletonEx
//
//  Created by Kira on 04/04/2019.
//  Copyright © 2019 Kira. All rights reserved.
//

import UIKit

class Singleton {
    static let shared = Singleton()
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
}

