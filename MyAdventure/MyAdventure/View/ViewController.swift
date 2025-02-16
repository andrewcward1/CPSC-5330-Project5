//
//  ViewController.swift
//  MyAdventure
//
//  Created by Andrew Ward on 2/15/25.
//

import UIKit
import AVFoundation

/*
 ViewController that controls the UI presented to the user for our application.
 */


class ViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var choiceLabel: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    var currentChoice = Choice()
    var progressSound: AVAudioPlayer?
    var victorySound: AVAudioPlayer?
    var defeatSound: AVAudioPlayer?
    
    /*
     On load, the ChoiceTree, exit conditions, background images and current choice are all set.
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setChoiceTree()
        setExits()
        setBgImages()
        currentChoice = enterMine
        backgroundImage.image = enterMine.bgImage
        backgroundImage.alpha = 0.25
        choiceLabel.text = enterMine.label
        buttonOne.setTitle(enterMine.option_one_text, for: .normal)
        buttonTwo.setTitle(enterMine.option_two_text, for: .normal)
        
    }
    
    /*
     Event handler for button one. When button one is pressed, the progress sound is played.
     We check if the current Choice option_one_child is nil. This would indicate there are no more choices after this one and the user
     has chosen to start the game over again, so we call viewDidLoad().
     
     Else, we set the current choice to the option_one_child of the former current choice, load its background image and check the
     new current choices exit status and play either the victory or defeat sound if appropriate.
     
     The label text and buttons are updated to reflect the label and options presented by the new current choice.
     */

    @IBAction func childOneSelect(_ sender: Any) {
        playButtonProgress()
        
        if (currentChoice.option_one_child == nil) {
            viewDidLoad()
            
        } else {
            currentChoice = currentChoice.option_one_child!
            backgroundImage.image = currentChoice.bgImage
            backgroundImage.alpha = 0.25
            
            if (currentChoice.exitStatus == "victory") {
                playVictory()
            }
            
            if (currentChoice.exitStatus == "defeat") {
                playDefeat()
            }
            
            choiceLabel.text = currentChoice.label
            buttonOne.setTitle(currentChoice.option_one_text, for: .normal)
            buttonTwo.setTitle(currentChoice.option_two_text, for: .normal)
        }
    }
    
    /*
     Event handler for button two. When button two is pressed, the progress sound is played.
     We check if the current Choice option_two_child is nil. This would indicate there are no more choices after this one and the user
     has chosen to exit the application, so we call exit(0).
     
     Else, we set the current choice to the option_two_child of the former current choice, load its background image and check the
     new current choices exit status and play either the victory or defeat sound if appropriate.
     
     The label text and buttons are updated to reflect the label and options presented by the new current choice.
     */
    
    @IBAction func childTwoSelect(_ sender: Any) {
        playButtonProgress()
        
        if (currentChoice.option_two_child == nil) {
            exit(0)
            
        } else {
            currentChoice = currentChoice.option_two_child!
            backgroundImage.image = currentChoice.bgImage
            backgroundImage.alpha = 0.25
            
            if (currentChoice.exitStatus == "victory") {
                playVictory()
            }
            
            if (currentChoice.exitStatus == "defeat") {
                playDefeat()
            }
            
            choiceLabel.text = currentChoice.label
            buttonOne.setTitle(currentChoice.option_one_text, for: .normal)
            buttonTwo.setTitle(currentChoice.option_two_text, for: .normal)
        }
    }
    
    /*
     Function to play the button progress sound.
     */
    
    func playButtonProgress() -> Void {
        if let progressURL = Bundle.main.url(forResource: "progress", withExtension: "wav") {
            progressSound = try? AVAudioPlayer(contentsOf: progressURL)
            progressSound?.play()
        }
    }
    
    /*
     Function to play the victory sound for the victory exit status.
     */
    
    func playVictory() -> Void {
        if let victoryURL = Bundle.main.url(forResource: "victory", withExtension: "wav") {
            progressSound = try? AVAudioPlayer(contentsOf: victoryURL)
            progressSound?.play()
        }
    }
    
    /*
     Function to play the defeat sound for the defeat exit status.
     */
    
    func playDefeat() -> Void {
        if let defeatURL = Bundle.main.url(forResource: "defeat", withExtension: "wav") {
            progressSound = try? AVAudioPlayer(contentsOf: defeatURL)
            progressSound?.play()
        }
    }
    
}

