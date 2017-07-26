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
import CBelledonneSIP

final class ViewController: UIViewController {
    
    lazy var caller: Caller = Caller(name: "Caller")
    
    lazy var receiver: Caller = Caller(name: "Receiver")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let list = LinkedList(strings: ["test1", "test2"])
        
        print("List:", list)
        
        list.withUnsafeRawPointer { assert($0 != nil) }
        
        let rawReason = CLinPhone.LinphoneReason(rawValue: 0)
        
        let reason = Reason(rawReason)
        
        print("Reason:", reason)
        
        // parse address and create new call
        guard let call = caller.call(receiver)
            else { return }
        
        print("Calling \(call.remoteAddress))")
    }
}

/// Object for making and receiving calls on localhost (.e.g 127.0.0.1)
class Caller {
    
    let name: String
    
    let core: Core
    
    private var timer: Timer?
    
    deinit {
        
        timer?.invalidate()
    }
    
    init(name: String) {
        
        // set properties
        
        self.name = name
        
        let callbacks = Core.Callbacks()
        
        self.core = Core(callbacks: callbacks)
        
        self.core.sipTransports.tcp = SipTransports.random
        
        callbacks.callStateChanged = { [weak self] in self?.call($0.1, stateChanged: $0.2, message: $0.3) }
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { [weak self] _ in self?.iterate() }
    }
    
    func call(_ other: Caller) -> Call? {
        
        // localhost address
        var address = Address(rawValue: "sip:127.0.0.1;transport=tcp")!
        
        address.port = other.core.usedSipTransports.tcp
        
        print("Calling \(other.name) \(address)")
        
        return core.invite(address)
    }
    
    private func iterate() {
        
        core.iterate()
    }
    
    private func call(_ call: Call?, stateChanged state: Call.State, message: String?) {
        
        print("\(name): Call state changed to \(state)")
        
        switch state {
            
        case .incomingReceived:
            
            let call = core.currentCall!
            
            guard call.accept()
                else { fatalError("Could not accept incoming call") }
            
            print("Received call from \(call.remoteAddress)")
            
        case .outgoingRinging, .outgoingProgress:
            
            print("Ringing")
            
        case .streamsRunning:
            
            print("Call connected")
            
        default: break
        }
    }
}
