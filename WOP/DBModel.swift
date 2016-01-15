//
//  DBModel.swift
//  WOP
//
//  Created by Nienke Pot on 12-01-16.
//  Copyright © 2016 Nienke Pot. All rights reserved.
//

import Foundation
import SQLite
var DB = DBModel()
var db = DB.Database()


public class DBModel{
    
    public static let sharedInstance = DBModel()
    private init() {}
    
    //
    let WOTable = Table("WOTable")
    let idWO = Expression<Int64>("idWO")
    let nameWO = Expression<String?>("nameWO")
    let idWOType = Expression<Double>("idWOType")
    
    //http://stackoverflow.com/questions/34001805/how-to-declare-database-connection-variable-globally-in-swift
    // https://github.com/stephencelis/SQLite.swift/blob/master/Documentation/Index.md#cocoapods
    //creates a writable database in your app’s Documents directory.
    //tim baard heeft me geholpen om de database iets meer op orde en vooral wat netter te krijgen.
    public func Database() -> Connection{
    
        let path = NSSearchPathForDirectoriesInDomains(
            .DocumentDirectory, .UserDomainMask, true
            ).first!
        
        return try! Connection("\(path)/db.sqlite3")//path?
    }
    
   
    
    func createTable() {
        
        do{
            try db.run(WOTable.create(ifNotExists: true){ t in
                t.column(idWO, primaryKey: true)
                t.column(nameWO, unique: true)
                t.column(idWOType, unique: true)
                
            })

            print("WOTable create gelukt") // kan eruit
        }
        
        catch{
           
            print("Could not create table Logs \(error)")
        }

    }
    
    func insertWO() {
        
        do {
            let idWO = try db.run(WOTable.insert(nameWO <- "kim", idWOType <- 2))
            print("inserted id: \(idWO)")
            print(nameWO, idWOType)
            print(" insert gelukt")// kan eruit
        }
        
        catch {
            print("insertion failed: \(error)")
        }
    }
    
    func selectWO() {
        do{
            for row in try db.prepare(WOTable){
                print("id: \(row[idWO]), email: \(row[nameWO]), name: \(row[idWOType])")
        }
        }
        catch{
            print("selection failed: \(error)")
        }

    
    
    }
    
}