//
//  EventsViewModel.swift
//  App599
//
//  Created by IGOR on 09/06/2024.
//

import SwiftUI
import CoreData

final class EventsViewModel: ObservableObject {

    @Published var evPhotos: [String] = ["ev1", "ev2", "ev3"]
    @Published var currentPhoto = ""
    
    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    
    @Published var evTitle = ""
    @Published var evLocation = ""
    @Published var evDate = ""
    @Published var evPhoto = ""

    @Published var events: [EventsModel] = []
    @Published var selectedEvent: EventsModel?
    
    func addEvent() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "EventsModel", into: context) as! EventsModel
        
        loan.evTitle = evTitle
        loan.evLocation = evLocation
        loan.evDate = evDate
        loan.evPhoto = evPhoto

        CoreDataStack.shared.saveContext()
    }
    
    func fetchEvents() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<EventsModel>(entityName: "EventsModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.events = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.events = []
        }
    }
}
