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
    var workshops:[workshopData]!
    
    override init() {
        super.init()
        
        filePath = Bundle.main.path(forResource: "workshops", ofType: "json")
        contentData = FileManager.default.contents(atPath: filePath!)
        content = NSString(data: contentData!, encoding: String.Encoding.utf8.rawValue) as String?
        let decoder = JSONDecoder()
        do {
            workshops = try decoder.decode(Array<workshopData>.self, from: contentData!)
            //print(workshops)
            
        }catch{
            print(error)
        }
        
    }
    
    
    
   
    
    public struct workshopData: Codable{
        let room:String
        let presenter:String
        let time:String
        let grade:[Int]
        let name:String
    }
    
    
    

}


