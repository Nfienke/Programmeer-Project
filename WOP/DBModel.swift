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
    
    //TABLE 1
    let Table1 = Table("Table1")
    let idWO = Expression<Int64>("idWO")
    let nameWO = Expression<String?>("nameWO")
    //let idWOType = Expression<Double>("idWOType")
    
    //Table 2
    let Table2WO = Table("Table2WO")
    let WOType = Expression<String?>("WOType")
    let min = Expression<Int64>("min")
    
    //insert dingen
    var valueNameWO = String()
    var valueIdWO = Int64()
    var valueWOType = String()
    var valueMin = Int64()
    
    //
    var WOview = [String]()
    var WOOverview = [String]()
    
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
            try db.run(Table1.create(ifNotExists: true){ t in
                t.column(idWO, primaryKey: true)
                t.column(nameWO, unique: true)
                })

            print("Table create gelukt") // kan eruit
        }
        
        catch{
           
            print("Could not create table Logs \(error)")
        }

    }
    
    func createTable2() {// hier maken.
        
        do{
            try db.run(Table2WO.create(ifNotExists: true){ t in
                t.column(idWO)
                t.column(WOType)
                t.column(min)
                })
            
            print("Table 2 create gelukt") // kan eruit
        }
            
        catch{
            
            print("Could not create table Logs \(error)")
        }
        
    }
    
    
    
    func insertNewWO() {
        
        do {
            let idWO = try db.run(Table1.insert(nameWO <- valueNameWO))
            valueIdWO = idWO
            print("inserted idWO: \(idWO)")
            //print("h1",valueIdWO)
            //print("h2 \(nameWO)")
            print(" insert gelukt")// kan eruit
        }
        
        catch {
            print("insertion failed: \(error)")
        }
    }
    
        func insertNewExercises() {
            
            do{
                try db.run(Table2WO.insert(idWO <- valueIdWO, WOType <- valueWOType, min <- valueMin))
                print("insert gelukt")
                print(idWO)
                print(WOType)
                print(min)
                
            }
            catch {
                print("insertion failed: \(error)")
            }
     }
    
    func selectWO() { // niet nuttig alleen voor testen
        do{
            for row in try db.prepare(Table1){
                print("idWO: \(row[idWO]), NameWO: \(row[nameWO])")
                print("Selection completed")//kan eruit
            }
            for row in try db.prepare(Table2WO){
                print("idWO: \(row[idWO]), WOType: \(row[WOType]), min: \(row[min])")
                print("Selection  2 completed")//kan eruit
            }

        }
        catch{
            print("selection failed: \(error)")
        }

    }
    
    func selectViewWO() { // for overview of the wo's.
        do{
            for row in try db.prepare(Table1){
                print("id WO: \(row[idWO]), Name WO: \(row[nameWO])")
                WOview.append("\(row[nameWO]!)")
                
            }
            print("selection is completed")
        }
        catch{
            print("selection failed: \(error)")
        }
    }
    
    func selectWOName() { // select info about the wo selecting on name.
        do{
            for row in try db.prepare(Table1){
                Table1.filter(nameWO.like(valueNameWO))
                //print(row[idWO])
                valueIdWO = row[idWO]
            }
            for row in try db.prepare(Table2WO){
                Table2WO.filter(idWO == valueIdWO)
                valueWOType = row[WOType]!
                //print(valueWOType,"h1")
                valueMin = row[min]
                //print(valueMin,"h2")
                WOOverview.append("WorkOut: \(valueWOType) Minutes: \(valueMin)")
            }
            print("Selection completed")
            print("wooverview:", WOOverview)

        }
            
        catch{
            print("selection failed: \(error)")
        }

            
       
    }
    
}