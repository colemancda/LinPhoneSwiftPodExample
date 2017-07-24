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
    
    var core: LinPhoneSwift.Core!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
                
        self.core = Core()
        
        let list = LinkedList(strings: ["test1", "test2"])
        
        print("List:", list)
        
        let rawReason = CLinPhone.LinphoneReason(rawValue: 0)
        
        let reason = Reason(rawReason)
        
        print("Reason:", reason)
        
        self.core.iterate()
    }
}
