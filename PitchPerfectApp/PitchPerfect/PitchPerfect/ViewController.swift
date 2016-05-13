//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Yang Zhou on 2016-05-06.
//  Copyright © 2016 Yang Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var RecordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: AnyObject) {
        print("Record button pressed")
        RecordingLabel.text = "Recording in prgress"
        stopRecordingButton.enabled = true
        recordButton.enabled = false
    }
    
    @IBAction func stopRecording(sender: AnyObject) {
        recordButton.enabled = true
        stopRecordingButton.enabled = false
        RecordingLabel.text = "Tap to Record"
    }
    override func viewWillAppear(animated: Bool) {
        stopRecordingButton.enabled = false
    }
}

