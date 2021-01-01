//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Joey on 11/17/17.
//  Copyright © 2017 Joey. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate
{
    var randomBall: Int = 0
    var audioPlayer : AVAudioPlayer!
    
    let ballArray = ["ball1", "ball2", "ball3", "ball4"]
    let ball4 = "ball4"

    @IBOutlet weak var ballImage: UIImageView!
    
    func changeBall()
    {
        randomBall = Int(arc4random_uniform(4))
        ballImage.image = UIImage(named: ballArray[randomBall])
    }
    
    func playsound()
    {
        let soundURL = Bundle.main.url(forResource: "crystal_ball", withExtension: "mp3")
        
        do
        {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch
        {
            print(error)
        }
        audioPlayer.play()
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ballImage.image = UIImage(named: ball4)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ask(_ sender: Any)
    {
       changeBall()
        playsound()
    }
    
    @IBAction func YessButton(_ sender: Any)
    {
        ballImage.image = UIImage(named: ballArray[0])
        playsound()
    }
    
    
    @IBAction func NoButton(_ sender: Any)
    {
        ballImage.image = UIImage(named: ballArray[1])
        playsound()
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?)
    {
        changeBall()
        playsound()
    }
}

