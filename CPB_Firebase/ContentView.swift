//
//  ContentView.swift
//  CPB_Firebase
//
//  Created by carina gatta on 11/6/23.
//

import SwiftUI
import FirebaseDatabase
import FirebaseDatabaseSwift
struct ContentView: View {
//    @Environment(\.modelContext) var context
    
    @ObservedObject var viewModel = CollegeViewModel()
//    @Query var colleges: [College]
    @State var names = ""
    @State var students = ""
    @State var locations = ""
    @State var URLS = ""
    var body: some View {
        NavigationStack{
            List {
                ForEach(viewModel.colleges,id: \.name){ currentCollege in
//                    Text("\(currentCollege.name)")
//                    Text("\(currentCollege.student)")
//                    Text("\(currentCollege.location)")
//                    Text("\(currentCollege.URL)")
                    Text(" College name: \(currentCollege.name) number of students: \(currentCollege.student) location of college: \(currentCollege.location) college URL: \(currentCollege.URL)  ")
                }
                
            } .toolbar{
                VStack{
                    HStack{
                        TextField("enter college", text: $names)
                        TextField("enter # of students", text: $students)
                    }
                    HStack{
                        TextField("enter location", text: $locations)
                        TextField("entera URL", text: $URLS)
                        Button("+"){
                            let newCollege = College(name: names, student: students, location: locations, URL: URLS)
                            viewModel.AddTask(currentCollege: newCollege)
                            names  = ""
                            students = ""
                            locations = ""
                            URLS = ""
                        }
                    }
                }
            }
        } .navigationTitle("CPBFirebase")
//        VStack{
//            HStack{
//                
//                TextField(text: $names) {
//                    Text("enter college name")
//                }
//                TextField(text: $students) {
//                    Text("enter # of students")
//                }
//                Button("+"){
//                    let Colleges = College(name: names, student: students, location: locations, URL: URLS)
//                    viewModel.AddcCollege(currentCollege: newCollege)
//                    names = ""
//                    students = ""
//                    locations = ""
//                    URLS = ""
//                    
//                }}
//            HStack{
//                TextField(text: $locations) {
//                    Text("enter college Location")
//                }
//                TextField(text: $URLS) {
//                    Text("enter college URL")
//                }
//                
//            }
//            
//        }
//     
//        .padding()
//        List{
//            ForEach(colleges) { currentCollege in
//                VStack{
//                    HStack{
//                        Text(currentCollege.name)
//                            .font(.title)
//                        Text(currentCollege.location)}
//                    HStack{
//                        Text(currentCollege.student)
//                        
//                        Text(currentCollege.URL) }
//                }
//                Text(currentCollege.name)
//                Text(currentCollege.student)
//                Text(currentCollege.location)
//                Text(currentCollege.URL)
//            }
//            .onDelete { indexSet in
//            colleges.remove(atOffsets: indexSet)
//        }
//        }
    }
//    func removeItems(at offsets: IndexSet){
//        colleges.remove(atOffsets: offsets)
//    }
        
}
    #Preview {
        ContentView()
    }

