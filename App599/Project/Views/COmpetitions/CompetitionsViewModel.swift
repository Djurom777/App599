//
//  CompetitionsViewModel.swift
//  App599
//
//  Created by IGOR on 09/06/2024.
//

import SwiftUI
import CoreData

final class CompetitionsViewModel: ObservableObject {
    
    @AppStorage("categoties") var categories: [String] = []
    @Published var category = ""
    @Published var currentCategory = ""

    @Published var teamPhotos: [String] = ["team1", "team2"]
    @Published var currentT1Photo = ""
    @Published var currentT2Photo = ""
    
    @Published var isAdd: Bool = false
    @Published var isAddCat: Bool = false
    @Published var isDelete: Bool = false
    @Published var isReset: Bool = false
    @Published var isDetail: Bool = false
    @Published var isMore: Bool = false
    
    @Published var currentGame = ""

    @Published var matPhoto1 = ""
    @Published var matPhoto2 = ""
    @Published var matName1 = ""
    @Published var matName2 = ""
    @Published var matCat = ""

    @Published var matches: [MatchModel] = []
    @Published var selectedMatch: MatchModel?
    
    func addMatch() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "MatchModel", into: context) as! MatchModel
        
        loan.matPhoto1 = matPhoto1
        loan.matPhoto2 = matPhoto2
        loan.matName1 = matName1
        loan.matName2 = matName2
        loan.matCat = matCat

        CoreDataStack.shared.saveContext()
    }
    
    func fetchMatches() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<MatchModel>(entityName: "MatchModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.matches = result.filter{($0.matCat ?? "") == currentCategory}
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.matches = []
        }
    }
}

