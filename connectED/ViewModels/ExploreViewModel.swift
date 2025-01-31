//
//  ExploreViewModel.swift
//  connectED
//
//  Created by Frank Schweitzer on 1/30/25.
//

import SwiftUI
import FirebaseFirestore

class ExploreViewModel: ObservableObject {
    @Published var schools: [School] = []
    @Published var degrees: [Degree] = []
    
    private var db = Firestore.firestore()
    
    init() {
        self.getSchools()
    }
    
    /* retrieve all schools from schools collection */
    func getSchools() {
        db.collection("schools").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.schools = documents.compactMap { doc in
                    do {
                        let school = try doc.data(as: School.self)
                        print("Decoded school: \(school)")
                        return school
                    } catch {
                        print("Error decoding school: \(error)")
                        return nil
                    }
                    
                }
            }
        }
    }
    
    /* get the degrees offered by the school the user clicked on */
    func getDegrees(schoolId: String) {
        db.collection("schools").document(schoolId).collection("degrees").getDocuments { snapshot, error in
            guard let documents = snapshot?.documents, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.degrees = documents.compactMap { doc in
                    do {
                        let degree = try doc.data(as: Degree.self)
                        print("Decoded degree: \(degree)")
                        return degree
                    } catch {
                        print("Error decoding degrees: \(error)")
                        return nil
                    }
                }
            }
            
        }
    }
}
