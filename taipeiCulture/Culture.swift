//
//  File.swift
//  taipeiCulture
//
//  Created by Jason Hsu on 2018/8/19.
//  Copyright © 2018 junchoon. All rights reserved.
//

import Foundation

struct Event {
    var EventName: String
    var ShowGroupName: String
    var EventTypeID: String
    var DurationStart: String
    var DurationEnd: String
    var ContactTel: String
    var BriefIntroduction: String
    var vContent: String
    var EventUrl: String
    var ImageFile: String
    var Location: String
    var Address: String
    
    init?(json: [String: Any]) {
        guard let EventName = json["EventName"] as? String, let ShowGroupName = json["ShowGroupName"] as? String, let EventTypeID = json["EventTypeID"] as? String, let DurationStart = json["DurationStart"] as? String, let DurationEnd = json["DurationEnd"] as? String, let ContactTel = json["ContactTel"] as? String, let BriefIntroduction = json["BriefIntroduction"] as? String, let vContent = json["vContent"] as? String, let EventUrl = json["EventUrl"] as? String, let ImageFile = json["ImageFile"] as? String, let Location = json["Location"] as? String, let Address = json["Address"] as? String else {
            return nil
        }
        
        self.EventName = EventName
        self.ShowGroupName = ShowGroupName
        self.EventTypeID = EventTypeID
        self.DurationStart = DurationStart
        self.DurationEnd = DurationEnd
        self.ContactTel = ContactTel
        self.BriefIntroduction = BriefIntroduction
        self.vContent = vContent
        self.EventUrl = EventUrl
        self.ImageFile = ImageFile
        self.Location = Location
        self.Address = Address
    }
}
    


