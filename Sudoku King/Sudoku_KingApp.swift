//
//  Sudoku_KingApp.swift
//  Sudoku King
//
//  Created by Seven Chords on 03.06.22.
//

import SwiftUI
import Foundation
import CoreData

enum Intentional_Error: Error {
    case error
}

func import_sudoku(_index: Int, _difficulty: Int) -> [[UInt8]] {
    let file_path = Bundle.main.path(forResource: "sudoku_data", ofType: "")!
    let raw_data = NSData(contentsOfFile: file_path)
    var temp: [[UInt8]] = [[], []]
    temp[0].append(contentsOf: raw_data![(_index * 162)..<(_index * 162 + 81)])
    temp[1].append(contentsOf: raw_data![(_index * 162 + 81)..<(_index * 162 + 162)])
    var counter = 0
    while(counter < 64 - _difficulty) {
        let pos_x = Int.random(in: 0...8)
        let pos_y = Int.random(in: 0...8)
        if(temp[0][pos_x * 9 + pos_y] == 0) {
            temp[0][pos_x * 9 + pos_y] = temp[1][pos_x * 9 + pos_y]
            counter += 1
        }
    }
    let shuffle_key = [UInt8]([1,2,3,4,5,6,7,8,9].shuffled())
    print(shuffle_key)
    var to_return: [[UInt8]] = [[], []]
    for _ in 0...80 {
        to_return[0].append(0)
        to_return[1].append(0)
    }
    for n in 1...9 {
        for i in 0...80 {
            for j in 0...1 {
                if(temp[j][i] == n) {
                    to_return[j][i] = shuffle_key[n-1]
                }
            }
        }
    }
    return to_return
}

func store_puzzle(_puzzle: [UInt8], _solution: [UInt8]) {
    var container: NSPersistentContainer
    container = NSPersistentContainer(name: "Main")
    container.loadPersistentStores { store_description, error in
        if let error = error {
            fatalError("Fatal Error loading store: \(error.localizedDescription)")
        }
    }
    let fetch_request: NSFetchRequest<Persistant_Data>
    fetch_request = Persistant_Data.fetchRequest()
    let context = container.viewContext
    do {
        let object_array = try context.fetch(fetch_request)
        let object = object_array[0]
        object.current_puzzle = Data(_puzzle)
        object.current_puzzle_edited = Data(_puzzle)
        object.current_puzzle_solved = Data(_solution)
        try context.save()
    } catch {
        exit(-1)
    }
}

func load_original_content() -> [[Bool]] {
    var container: NSPersistentContainer
    container = NSPersistentContainer(name: "Main")
    container.loadPersistentStores { store_description, error in
        if let error = error {
            fatalError("Fatal Error loading store: \(error.localizedDescription)")
        }
    }
    let fetch_request: NSFetchRequest<Persistant_Data>
    fetch_request = Persistant_Data.fetchRequest()
    let context = container.viewContext
    do {
        let object_array = try context.fetch(fetch_request)
        let object = object_array[0]
        let puzzle: [UInt8] = [UInt8](object.current_puzzle!)
        var to_return: [[Bool]] = [[]]
        for i in 0..<9 {
            to_return.append([])
            for j in 0..<9 {
                to_return[i].append(puzzle[i * 9 + j] != 0)
            }
        }
        return to_return
    } catch {
        exit(-1)
    }
}

func load_cell_content() -> [[Int]] {
    var container: NSPersistentContainer
    container = NSPersistentContainer(name: "Main")
    container.loadPersistentStores { store_description, error in
        if let error = error {
            fatalError("Fatal Error loading store: \(error.localizedDescription)")
        }
    }
    let fetch_request: NSFetchRequest<Persistant_Data>
    fetch_request = Persistant_Data.fetchRequest()
    let context = container.viewContext
    do {
        let object_array = try context.fetch(fetch_request)
        let object = object_array[0]
        let puzzle_edited: [UInt8] = [UInt8](object.current_puzzle_edited!)
        var to_return: [[Int]] = [[]]
        for i in 0..<9 {
            to_return.append([])
            for j in 0..<9 {
                to_return[i].append(Int(puzzle_edited[i * 9 + j]))
            }
        }
        return to_return
    } catch {
        exit(-1)
    }
}

func write_number_to_cell(_x: Int, _y: Int, _n: Int) {
    var container: NSPersistentContainer
    container = NSPersistentContainer(name: "Main")
    container.loadPersistentStores { store_description, error in
        if let error = error {
            fatalError("Fatal Error loading store: \(error.localizedDescription)")
        }
    }
    let fetch_request: NSFetchRequest<Persistant_Data>
    fetch_request = Persistant_Data.fetchRequest()
    let context = container.viewContext
    do {
        let object_array = try context.fetch(fetch_request)
        let object = object_array[0]
        object.current_puzzle_edited![_x * 9 + _y] = UInt8(_n)
        try context.save()
    } catch {
        exit(-1)
    }
}

class Persistance_Interface {
    var has_changes: Bool
    var cell_content: [[Int]]
    var original_content: [[Bool]]
    func get_cell_content(_x: Int, _y: Int) -> Int {
        if(has_changes) {
            cell_content = load_cell_content()
            original_content = load_original_content()
            has_changes = false
        }
        return cell_content[_x][_y]
    }
    func get_original_content(_x: Int, _y: Int) -> Bool {
        if(has_changes) {
            cell_content = load_cell_content()
            original_content = load_original_content()
            has_changes = false
        }
        return original_content[_x][_y]
    }
    func number_entry(_x: Int, _y: Int, _n: Int) {
        write_number_to_cell(_x: _x, _y: _y, _n: _n)
        has_changes = true
    }
    init() {
        has_changes = true
        cell_content = [[]]
        original_content = [[]]
        for i in 0..<9 {
            cell_content.append([])
            original_content.append([])
            for _ in 0..<9 {
                cell_content[i].append(0)
                original_content[i].append(false)
            }
        }
    }
}

@main
struct Sudoku_KingApp: App {
    init() {
        var container: NSPersistentContainer
        container = NSPersistentContainer(name: "Main")
        container.loadPersistentStores { store_description, error in
            if let error = error {
                fatalError("Fatal Error loading store: \(error.localizedDescription)")
            }
        }
        let fetch_request: NSFetchRequest<Persistant_Data>
        fetch_request = Persistant_Data.fetchRequest()
        let context = container.viewContext
        do {
            let object_array = try context.fetch(fetch_request)
            if(object_array.isEmpty) {
                throw Intentional_Error.error
            }
            let object = object_array[0]
            object.current_game_ranked = false
            object.current_game_timer = 0
            object.fast_solve_streak = 0
            object.solve_streak = 0
            object.current_puzzle = nil
            object.current_puzzle_edited = nil
            object.current_puzzle_solved = nil
            object.game_active = false
            object.total_abandoned = 0
            object.total_solved = 0
            object.total_fast_solved = 0
            do {
                try context.save()
            } catch {
                exit(-1)
            }
        } catch {
            let object = Persistant_Data(context: context)
            object.current_game_ranked = false
            object.current_game_timer = 0
            object.fast_solve_streak = 0
            object.solve_streak = 0
            object.current_puzzle = nil
            object.current_puzzle_edited = nil
            object.current_puzzle_solved = nil
            object.game_active = false
            object.total_abandoned = 0
            object.total_solved = 0
            object.total_fast_solved = 0
            do {
                try context.save()
            } catch {
                exit(-1)
            }
        }
        let test_game = import_sudoku(_index: 17, _difficulty: 31)
        store_puzzle(_puzzle: test_game[0], _solution: test_game[1])
    }
    var body: some Scene {
        WindowGroup {
            Game_View()
        }
    }
}
