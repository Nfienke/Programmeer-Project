//
//  DBModel.swift
//  WOP
//
//  Created by Nienke Pot on 12-01-16.
//  Copyright © 2016 Nienke Pot. All rights reserved.
//
//http://stackoverflow.com/questions/34001805/how-to-declare-database-connection-variable-globally-in-swift
// https://github.com/stephencelis/SQLite.swift/blob/master/Documentation/Index.md#cocoapods
//tim baard heeft me geholpen om de database iets meer op orde en vooral wat netter te krijgen. //in progress.

import Foundation
import SQLite
var DB = DBModel()
var db = DB.Database()

public class DBModel{
    
    public static let sharedInstance = DBModel()
    private init() {}
    
    //TABLE 1.
    let Table1 = Table("Table1")
    let idWO = Expression<Int64>("idWO")
    let nameWO = Expression<String?>("nameWO")
    //Table 2.
    let Table2WO = Table("Table2WO")
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
    var WOOverview = [String]()
    var WODict = Dictionary <String, Int>()
    
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
        }
        
        catch{
            print("Could not create table1: \(error)")
        }
    }
    
    func createTable2() {
        
        do{
            try db.run(Table2WO.create(ifNotExists: true){ t in
                t.column(idWO)
                t.column(WOType)
                t.column(min)
                })
        }
            
        catch{
            print("Could not create table2: \(error)")
        }
    }
    
    // Inserts a new Work Out in NameNewWOPView.
    func insertNewWO() {
       
        do {
            let idWO = try db.run(Table1.insert(nameWO <- valueNameWO))
            valueIdWO = idWO
            uniqueNameCheck = true
        }
        
        catch {
            print("insertion failed: \(error)")
            uniqueNameCheck = false
        }
    }
    
    // Inserts excercises for the new Work Out in NewWOPView.
    func insertNewExercises() {
       
        do{
            try db.run(Table2WO.insert(idWO <- valueIdWO, WOType <- valueWOType, min <- valueMin))
            print("\(valueIdWO),\(WOType), \(min)")
        }
            
        catch {
            print("insertion failed: \(error)")
            
        }
    }
    
    // Selects an overview of al the Work Outs for MyWOPView.
    func selectViewWO() {
        
        do{
            for row in try db.prepare(Table1){
                WOview.append("\(row[nameWO]!)")
            }
        }
            
        catch{
            print("selection failed: \(error)")
        }
    }
    
    // Selects the exercises of the selected Work Out for MyWOPOVerviewView en WOView.
    func selectWOName() {
        
        //WOOverview = []
        
        print("name:", DB.valueNameWO)
        
        
        do{
            let WOselect = Table1.filter(nameWO.like(DB.valueNameWO))
            for row in try db.prepare(WOselect){
                valueIdWO = row[idWO]
                
                let WOTypeSelect = Table2WO.filter(idWO == valueIdWO)
                for row in try db.prepare(WOTypeSelect){
                    valueWOType = row[WOType]!
                    valueMin = row[min]
                    WOOverview.append("\(valueWOType) \(valueMin) min")
                    WODict[valueWOType] = Int(valueMin)
                }
            }
        }
            
        catch{
            print("selection failed: \(error)")
        }
    }
    
    //Removes a Work Out. (MyWOPView)
    func removeWO() {
        let WOselect = Table1.filter(nameWO.like(DB.valueNameWO))
        let WOremove = Table1.filter(nameWO.like(DB.valueNameWO))
        var id = Int64()
        let WO2remove = Table2WO.filter(idWO == id)
        
        do {
            
            for row in try db.prepare(WOselect){
                id = row[idWO]
                
            }
            
            if try db.run(WOremove.delete()) > 0 {
                print("deleted WO")//
            }
            
            if try db.run(WO2remove.delete()) > 0 {
                 print("deleted WO2")////
            }
               
            else {
                print("WO not found")
            }
        }
            
        catch {
            print("delete failed: \(error)")
        }
    }
    
    // to see what is in the DB.-> in menu weghalen en outcommenten
        func selectWO() {
            do{
                for row in try db.prepare(Table1){
                    print("idWO: \(row[idWO]), NameWO: \(row[nameWO])")
                    print("Selection completed")
                }
                for row in try db.prepare(Table2WO){
                    print("idWO: \(row[idWO]), WOType: \(row[WOType]), min: \(row[min])")
                    print("Selection 2 completed")
                }
            }
    
            catch{
                print("selection failed: \(error)")
            }
        }
    
}