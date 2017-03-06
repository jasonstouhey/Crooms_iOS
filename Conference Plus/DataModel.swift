//
//  globals.swift
//  Conference Plus
//
//  Created by Suneet Tipirneni on 2/26/17.
//  Copyright © 2017 Suneet Tipirneni. All rights reserved.
//

import Foundation

class DataModel: NSObject {
    
    // MARK: - Class Variables
    
    let fileName = "workshops.json"
    let filePath = Bundle.main.path(forResource: "workshops", ofType: "json")!
    var sessions:Dictionary<String,Any>!
    let fileManager = FileManager.default
    var workshops = Array<Dictionary<String,Any>>()
    
    
    // MARK: - Initialization
    
    override init() {
        
        if fileManager.fileExists(atPath: Bundle.main.path(forResource: "workshops", ofType: "json")!){
            print("File exists!")
        }else{
            print("file does not exist at \(filePath)")
        }
        
    }
    
    // MARK: - Methods
    
    /// Reads and returns the JSON File.
    public func parseJSON() -> AnyObject?{
        
        var file:AnyObject
        
        do{
            let data = NSData(contentsOf: NSURL(fileURLWithPath: filePath) as URL)
            file = try JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as Any as AnyObject
            return file
            
        }catch{
            print(error)
            return nil
        }
        
        
        
        
    }
    public subscript(itemName:String) -> Any?{
        
        get {
            
            let fileDict = parseJSON() as! Array<Any>
            return fileDict
        }
        set(newValue) {
            
            do{
                var fileDict = parseJSON() as! Dictionary<String,AnyObject>
                
                
                fileDict[itemName] = newValue! as Any? as AnyObject?
                
                
                let newData =  try JSONSerialization.data(withJSONObject: fileDict, options: JSONSerialization.WritingOptions.prettyPrinted)
                try newData.write(to: URL(string:filePath)!, options: .atomicWrite)
            }catch{
                print(error)
            }
            
        }
        
    }



    
    
}
