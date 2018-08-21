//
//  SpotViewController.swift
//  taipeiCulture
//
//  Created by Jason Hsu on 2018/8/21.
//  Copyright © 2018 junchoon. All rights reserved.
//

import UIKit
import Foundation
import SDWebImage

class SpotViewController: UIViewController {
    
    var introSpot: Spot?
    
    @IBOutlet weak var introSpotImageView: UIImageView!
    @IBOutlet weak var introSpotNameLabel: UILabel!
    @IBOutlet weak var introParkNameLabel: UILabel!
    @IBOutlet weak var introductionLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlstr = introSpot!.Image.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlstr!)
        introSpotImageView.sd_setImage(with: url, placeholderImage: UIImage(named: "defaultPhoto"))
        introSpotNameLabel.text = introSpot?.Name
        introParkNameLabel.text = introSpot?.ParkName
        introductionLabel.text = introSpot?.Introduction

        introductionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        introductionLabel.numberOfLines = 0
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
