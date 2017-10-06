//
//  Configuration.swift
//  bcard
//
//  Created by Alican Karayelli on 6.10.2017.
//  Copyright © 2017 Alican Karayelli. All rights reserved.
//

import Foundation
import XCGLogger

let appDelegate = UIApplication.shared.delegate as! AppDelegate

let log: XCGLogger = {
    let log = XCGLogger.default
    
    #if USE_NSLOG
        log.removeLogDestination(XCGLogger.Constants.baseConsoleLogDestinationIdentifier)
        log.addLogDestination(XCGNSLogDestination(owner: log, identifier: XCGLogger.Constants.nslogDestinationIdentifier))
        log.logAppDetails()
    #else
        let currentDate = Date().formattedWith(Constants.DateFormats.YYYY_MM_DD_HH_MM_SS)
        let filePath = "Log-" + currentDate + ".txt"
        let logPath = logsDirectory.appendingPathComponent(filePath)
        
        log.setup(level: .debug, showLevel: false, showFileNames: true, showLineNumbers: true, writeToFile: logPath)
    #endif
    
    return log
}()


/////////////// Logger Helper functions  /////////////////

let documentsDirectory: URL = {
    let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return urls[urls.endIndex - 1]
}()

let logsDirectory: URL = {
    
    let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
    let documentsDirectory: String = paths[0] as String
    let dataPath = documentsDirectory.appending("/Logs")
    
    do {
        try FileManager.default.createDirectory(atPath: dataPath, withIntermediateDirectories: false, attributes: nil)
    } catch let error as NSError {
        print(error.localizedDescription);
    }
    
    return URL(fileURLWithPath: dataPath)
}()

let cacheDirectory: URL = {
    let urls = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)
    return urls[urls.endIndex - 1]
}()

//////////////////////////////////////////////////////////////
