//
//  collgeViewModel.swift
//  CPB_Firebase
//
//  Created by carina gatta on 11/14/23.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class CollegeViewModel: ObservableObject {
    @Published var colleges: [College] = []
    init() {
        PullFromFireBase()
    }
    func AddTask(currentCollege : College){
        colleges.append(currentCollege)
        AddToFireBase(college: currentCollege)
    }
    func AddToFireBase(college: College){
        let database = Database.database().reference()
        database.child("Colleges").child(college.name).child("name").setValue(college.name)
        database.child("Colleges").child(college.name).child("students").setValue(college.student)
        database.child("Colleges").child(college.name).child("location").setValue(college.location)
       database.child("Colleges").child(college.name).child("URL").setValue(college.URL)
    }
    func PullFromFireBase(){
        let databaseRef = Database.database().reference().child("Colleges")
        databaseRef.getData{ myError, myDataSnapshot in
            var newList:[College] = []
            for college in myDataSnapshot?.children.allObjects as! [DataSnapshot]{
                let nameOfCollege = college.key
                let dictionary = college.value as! [String: Any]
                guard let numberOfStudents = dictionary["students"] else { return }
                guard let nameOfLocation = dictionary["location"]  else { return }
                guard let nameOfURL = dictionary["URL"] else { return }
        
                let currentCollege = College(name: nameOfCollege, student: numberOfStudents as! String, location: nameOfLocation as! String, URL: nameOfURL as! String)
                newList.append(currentCollege)
            }
            self.colleges = newList
        }
    }
    }
