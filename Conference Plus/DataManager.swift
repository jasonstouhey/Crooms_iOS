//
//  Globals.swift
//  TechFest
//
//  Created by Suneet Tipirneni on 9/25/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import Foundation

class DataManager:NSObject{
    
    var filePath:String!
    var contentData:Data!
    var content:String!
    var workshops:[sessionData]!
    
    override init() {
        super.init()
        
        filePath = Bundle.main.path(forResource: "workshops", ofType: "json")
        contentData = FileManager.default.contents(atPath: filePath!)
        content = NSString(data: contentData!, encoding: String.Encoding.utf8.rawValue) as String?
        let decoder = JSONDecoder()
        do {
            workshops = try decoder.decode(Array<sessionData>.self, from: contentData!)
            print(workshops)
        }catch{
            print(error)
        }
        
    }
    
    
    
    struct sessionData: Codable{
        let sessionStartTime:String
        let sessionEndTime:String
        let sessionNumber:Int
        let presentations:[presentationData]
        
        
    }
    public struct keynoteData: Codable{
        let gradeLevels:[Int]
        
    }
    public struct presentationData: Codable{
        let gradeLevels:[Int]
        let workshops:[workshopData]
    }
    
    public struct workshopData: Codable{
        let room:String
        let presenter:[String]
        let business:String
        let presenterPhoto:String
        let title:String
    }
    
    
    

}


