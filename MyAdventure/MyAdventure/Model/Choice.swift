//
//  choice.swift
//  MyAdventure
//
//  Created by Andrew Ward on 2/15/25.
//

import Foundation
import UIKit

/*
 Choice class used to present the user with a series of text labels that each contain two possible choices.
 Each choice has a background image associated with it, as well as an optional exit status.
 The exit statuses are used for the last choices, and provide the user the ability to start the game over
 or exit the app.
 Each of the two options have the capability of linking to a "child" choice, which is the choice that will be
 presented to the user if that choice is chosen via button click.
 */

class Choice {
    
    init(_ labelIn: String, _ o_oneIn:String, _ o_twoIn: String) {
        label = labelIn
        option_one_text = o_oneIn
        option_two_text = o_twoIn
        option_one_child = nil
        option_two_child = nil
    }
    
    convenience init() {
           self.init("", "", "")
       }
    
    var label: String?
    var option_one_text: String?
    var option_two_text: String?
    var option_one_child: Choice?
    var option_two_child: Choice?
    var bgImage: UIImage?
    var exitStatus: String?
    
    func set_opt_one_child(_ childIn: Choice) -> Void {
        self.option_one_child = childIn
    }
    
    func set_opt_two_child(_ childIn: Choice) -> Void {
        self.option_two_child = childIn
    }
    
    func set_BG_Image(_ imageIn: UIImage) {
        self.bgImage = imageIn
    }
    
    func set_Exit_Status(_statusIn: String) {
        self.exitStatus = _statusIn
    }
    
}
