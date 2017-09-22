//
//  JKJSONWriter.swift
//  JSONKit
//
//  Created by Suneet Tipirneni on 4/23/16.
//  Copyright © 2016 Suneet Tipirneni. All rights reserved.
//

import Foundation

public class JKJSONFile: NSObject {
    
    // MARK: - Class Variables
    var fileURL:NSURL!
    var groupKey:String?
    let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "/"
    let fileName = String()
    let fileManager = FileManager.default
    var fileAtPath = String()
    
    /// Initialize using the filename of the JSON file.
    required public init(fileName:String){
        super.init()
        
        // Construct a file path.
        fileAtPath = filePath + fileName + ".json"
        
        // Check if the file already exists
        if fileManager.fileExists(atPath: fileAtPath){
            
            print("File exists on path:\(fileAtPath)")
            
            do{
                //_ = NSData(contentsOf: NSURL(fileURLWithPath: fileAtPath) as URL)
                        
            }catch{
                print(error)
            }

        }else{
            // Create a file to inialize the JSON.
            print("Filepath:\(fileAtPath)")
            let content = "{}"
            do{
                try content.data(using: String.Encoding.utf8)?.write(to: URL(string:fileAtPath)!, options: .atomicWrite)
            }catch{
                print(error)
            }
            
            //content.dataUsingEncoding(NSUTF8StringEncoding)?.writeToFile(fileAtPath, atomically: true)
        }
    }
    
    /// Reads and returns the JSON File.
    public func parseJSON() -> AnyObject?{
        
        var file:AnyObject
        
        do{
            let data = NSData(contentsOf: NSURL(fileURLWithPath: fileAtPath) as URL)
            file = try JSONSerialization.jsonObject(with: data! as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as Any as AnyObject
            return file
            
        }catch{
            print(error)
            return nil
        }
        
        

    }
    
    public subscript(itemName:String) -> AnyObject?{
        
    get {
    
        var fileDict = parseJSON() as! Dictionary<String,AnyObject>
        return fileDict[itemName]
    }
    set(newValue) {
    
        do{
            var fileDict = parseJSON() as! Dictionary<String,AnyObject>
            
            
            fileDict[itemName] = newValue!
            
            
            let newData =  try JSONSerialization.data(withJSONObject: fileDict, options: JSONSerialization.WritingOptions.prettyPrinted)
            try newData.write(to: URL(string:fileAtPath)!, options: .atomicWrite)
        }catch{
            print(error)
        }

    }
    
    }

}
