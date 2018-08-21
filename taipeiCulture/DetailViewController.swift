//
//  DetailViewController.swift
//  taipeiCulture
//
//  Created by Jason Hsu on 2018/8/20.
//  Copyright © 2018 junchoon. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var eventDetail: Event?
    
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var groupNameLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let url = URL(string: (eventDetail?.ImageFile)!)
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                self.eventImageView.image = UIImage(data: data)
                }
            }
        }
        task.resume()
        
        eventNameLabel.text = eventDetail?.EventName
        eventNameLabel.numberOfLines = 0
        typeLabel.text = eventDetail?.EventTypeID
        groupNameLabel.text = eventDetail?.ShowGroupName
        startTimeLabel.text = eventDetail?.DurationStart
        endTimeLabel.text = eventDetail?.DurationEnd
        telLabel.text = eventDetail?.ContactTel
        urlLabel.text = eventDetail?.EventUrl
        locationLabel.text = eventDetail?.Location
        addressLabel.text = eventDetail?.Address
    
        introScrollView.bottomAnchor.constraint(equalTo: introLabel.bottomAnchor)
        introLabel.text = (eventDetail?.BriefIntroduction)! + "\n" + (eventDetail?.vContent)!
        
        introLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        introLabel.numberOfLines = 0
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
