//
//  ChoiceLogic.swift
//  MyAdventure
//
//  Created by Andrew Ward on 2/15/25.
//


/*
 Below our Choice class variables for our game are defined and their relevant data populated.
 Each Choice at minimum contains the question or status text, and the text for two choices that are placed
 on the UI buttons in the ViewController.
 */

import Foundation
import UIKit

var enterMine = Choice(
    """
    You have arrived at the Doors of Durin...
    Enter the Mines of Moria?
    """,
    "Enter the mines",
    "Take the Misty Mountain Pass")

var mineEntered = Choice(
    "You have entered the mines and encountered a Balrog!",
    "Fight!",
    "Flee!")

var balrogFight = Choice("The Balrog has slain your entire party! The forces of Sauron are victorious...",
                         "Try Again",
                         "End Game")

var balrogFlee = Choice("You successfully fled from the Balrog, but Gandalf fell during the fight...",
                        "Try Again",
                        "End Game")

var mistyMountains = Choice("You have taken the Misty Mountain pass and encountered a pack of wargs!",
                            "Fight!",
                            "Flee!")

var wargsFight = Choice("You defeated the wargs in battle and reached Lothlorien safely...",
                        "Try Again",
                        "End Game")

var wargsFlee = Choice("The wargs have slain your entire party! The forces of Sauron are victorious...",
                       "Try Again",
                       "End Game")


/*
 Here the "tree" or flow of the choices are set. This is what controls what choices will be presented based on
 the options selected by the user.
 This function is ran by the viewDidLoad function of the ViewController.
 */

func setChoiceTree() -> Void {
    enterMine.set_opt_one_child(mineEntered)
    enterMine.set_opt_two_child(mistyMountains)
    mineEntered.set_opt_one_child(balrogFight)
    mineEntered.set_opt_two_child(balrogFlee)
    mistyMountains.set_opt_one_child(wargsFight)
    mistyMountains.set_opt_two_child(wargsFlee)
    
}

/*
 The background images are set here. These are ImageSets located in the Assets directory.
 This function is ran by the viewDidLoad function of the ViewController.
 */


func setBgImages() -> Void {
    enterMine.set_BG_Image(UIImage(named: "moria_door")!)
    mineEntered.set_BG_Image(UIImage(named: "moria_mine")!)
    balrogFight.set_BG_Image(UIImage(named: "sauron")!)
    balrogFlee.set_BG_Image(UIImage(named: "gandalfbalrog")!)
    mistyMountains.set_BG_Image(UIImage(named: "mistymountains")!)
    wargsFight.set_BG_Image(UIImage(named: "lothlorien")!)
    wargsFlee.set_BG_Image(UIImage(named: "sauron")!)
}


/*
 The Choices that have "exit statuses" are set here.
 Certain choices are the end of the game, and offer a choice of restarting or exiting the application.
 This function is ran by the viewDidLoad function of the ViewController.
 */

func setExits() -> Void {
    balrogFight.exitStatus = "defeat"
    balrogFlee.exitStatus = "victory"
    wargsFight.exitStatus = "victory"
    wargsFlee.exitStatus = "defeat"
}




