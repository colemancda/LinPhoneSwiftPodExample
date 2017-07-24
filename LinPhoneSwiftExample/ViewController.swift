//
//  ViewController.swift
//  LinPhoneSwiftExample
//
//  Created by Alsey Coleman Miller on 7/24/17.
//  Copyright © 2017 Alsey Coleman Miller. All rights reserved.
//

import UIKit

// Linphone
import BelledonneToolbox
import LinPhoneSwift
import CLinPhone

class ViewController: UIViewController {
    
    //lazy var core: LinPhoneSwift.Core = LinPhoneSwift.Core()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let uri = URI()
        
        let _ = CLinPhone.LinphoneReason()
        
        self.core.iterate()
    }
}
