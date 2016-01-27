//
//  DBModel.swift
//  WOP
//
//  Created by Nienke Pot on 12-01-16.
//  Copyright © 2016 Nienke Pot. All rights reserved.
//
//http://stackoverflow.com/questions/34001805/how-to-declare-database-connection-variable-globally-in-swift
// https://github.com/stephencelis/SQLite.swift/blob/master/Documentation/Index.md#cocoapods
//Tim Baard heeft me geholpen om de database iets meer op orde en vooral wat netter te krijgen. 

import Foundation
import SQLite

public class DBModel {
    
    public static let sharedInstance = DBModel()
    
    private init() {}
    
    //Table Work Out.
    let TableWO = Table("TableWO")
    let idWO = Expression<Int64>("idWO")
    let nameWO = Expression<String?>("nameWO")
    
    //Table Exercises.
    let TableExercises = Table("TableExercises")
    let WOType = Expression<String?>("WOType")
    let min = Expression<Int64>("min")
    
    //Insert en delete functies.
    var valueNameWO = String()
    var valueIdWO = Int64()
    var valueWOType = String()
    var valueMin = Int64()
    var uniqueNameCheck = Bool()
    
    //Select functies.
    var WOview = [String]()
    var ExerciseOverview = [String]()
    var ExerciseDict = Dictionary <String, Int>()
    
    //Makes a connection to the database.
    public func Database() -> Connection {
    
        let path = NSSearchPathForDirectoriesInDomains(
            .DocumentDirectory, .UserDomainMask, true
            ).first!
        
        return try! Connection("\(path)/db.sqlite3")
    }
    
    //Creates the first table: the id of the work out and the name of the work out.
    func createTable() {
        
        do {
            try self.Database().run(TableWO.create(ifNotExists: true) { t in
                t.column(idWO, primaryKey: true)
                t.column(nameWO, unique: true)
                })
        }
        
        catch {
            print("Could not create TableWO: \(error)")
        }
    }
    
    //Creates the second table: the id of the work out, the exercises and their time.
    func createTable2() {
        
        do {
            try self.Database().run(TableExercises.create(ifNotExists: true) { t in
                t.column(idWO)
                t.column(WOType)
                t.column(min)
                })
        }
            
        catch {
            print("Could not create TableExercises: \(error)")
        }
    }
    
    // Inserts a new Work Out (NameNewWOPView).
    func insertNewWO() {
       
        do {
            let idWO = try self.Database().run(TableWO.insert(nameWO <- valueNameWO))
            valueIdWO = idWO
            uniqueNameCheck = true
        }
        
        catch {
            print("insertion failed: \(error)")
            uniqueNameCheck = false
        }
    }
    
    // Inserts excercises for the new Work Out (NewWOPView).
    func insertNewExercises() {
       
        do {
            try self.Database().run(TableExercises.insert(idWO <- valueIdWO, WOType <- valueWOType, min <- valueMin))
        }
            
        catch {
            print("insertion failed: \(error)")
            
        }
    }
    
    // Selects an overview of al the Work Outs (MyWOPView).
    func selectViewWO() {
        
        do {
            for row in try self.Database().prepare(TableWO) {
                WOview.append("\(row[nameWO]!)")
            }
        }
            
        catch {
            print("selection failed: \(error)")
        }
    }
    
    // Selects the exercises of the selected Work Out (MyWOPOVerviewView and WOView).
    func selectWOName() {
     
        do {
            let WOselect = TableWO.filter(nameWO.like(valueNameWO))
            for row in try self.Database().prepare(WOselect) {
                valueIdWO = row[idWO]
                
                let WOTypeSelect = TableExercises.filter(idWO == valueIdWO)
                for row in try self.Database().prepare(WOTypeSelect) {
                    valueWOType = row[WOType]!
                    valueMin = row[min]
                    ExerciseOverview.append("\(valueWOType) \(valueMin) min")
                    ExerciseDict[valueWOType] = Int(valueMin)
                }
            }
        }
            
        catch {
            print("selection failed: \(error)")
        }
    }
    
    //Removes a Work Out (MyWOPView).
    func removeWO() {
        
        let WOselect = TableWO.filter(nameWO.like(valueNameWO))
        let WOremove = TableWO.filter(nameWO.like(valueNameWO))
        var id = Int64()
        let WO2remove = TableExercises.filter(idWO == id)
        
        do {
            
            for row in try self.Database().prepare(WOselect) {
                id = row[idWO]
            }
            
            if try self.Database().run(WOremove.delete()) > 0 {
            }
            
            if try self.Database().run(WO2remove.delete()) > 0 {
            }
        }
            
        catch {
            print("delete failed: \(error)")
        }
    }    
}