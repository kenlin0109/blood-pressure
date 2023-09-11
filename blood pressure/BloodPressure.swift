//
//  ContentView.swift
//  blood pressure
//
//  Created by 林秀謙 on 2023/8/25.
//

import SwiftUI
import CoreData

public class BloodPressure: NSManagedObject {
    @NSManaged public var date: String
    @NSManaged public var bloodPressureHigh: Double
    @NSManaged public var bloodPressureLow: Double
    
}

struct Data: Identifiable {
    let id = UUID()
    var date: String
    var bh: Int
    var bl: Int
}





private let values: [Data] = [
    Data(date: "Aug 25, 2023 12:45", bh: 120, bl: 70),
    Data(date: "Aug 25, 2023 12:45", bh: 125, bl: 65),
    Data(date: "Aug 25, 2023 12:45", bh: 130, bl: 60),
    Data(date: "Aug 25, 2023 12:45", bh: 130, bl: 90),
    Data(date: "Aug 25, 2023 12:45", bh: 130, bl: 90)
]

struct ContentView: View {
    @FetchRequest(entity: BloodPressure.entity(), sortDescriptors: [])
    var BloodPressures: FetchedResults<BloodPressure>
    
    
    
    
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            VStack{
                HStack{
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "arrowshape.left.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 30)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            
                            
                    })
                    .padding(.leading,20)
                    
                    Label("BloodPressure", systemImage: "")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.leading, 26)
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 30)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            .padding(.leading, 26)
                            
                            
                    })
                    
                    
                    Spacer()
                    
                }
                
                HStack{
                    Text("history")
                        .foregroundColor(.white)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 105)
                        
                }
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.secondary)
                        .frame(width:350, height: 50)
                    Text("Aug 25, 2023")
                        .foregroundColor(.white)
                        .font(.title2)
                }
                Spacer()
                
                ScrollView{
                    
                    
                    VStack {
                        ForEach(values){ item in
                            ExtractedView(date: item.date, bh: item.bh, bl: item.bl)
                        }
                    }
                    .padding(20)
//                    .background{
//
//                        RoundedRectangle(cornerRadius: 90)
//
//                            .fill(Color(red: 240/255, green: 240/255, blue: 240/255))
//                            .frame(width:395,  height: 700)
//                            .padding(.top, 150)
//                    }
                }
                
                
                
            }
        }
        
            
           
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {}, label: {
                        Image(systemName: "arrowshape.left.fill")
                    })
                    
                }
                
                
                
                
                
            }
            //padding()
            
            
        
    }
        
        
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}


struct ExtractedView: View {
    @State var date: String
    @State var bh: Int
    @State var bl: Int
    
    
    var body: some View {
 //       Color.white

 //      ZStack(alignment: .leading) {
            
            
            //GeometryReader { geometry in
             //   RoundedRectangle(cornerRadius: 25)
              //      .fill(Color.white)
               //     .padding(10)
               //     .frame(width: geometry.size.width, height: geometry.size.height)
                    
          //  }
            //RoundedRectangle(cornerRadius: 25)
                // .fill(Color.white)
                 //.frame(width:350, height: 150)
            VStack(alignment: .leading){
                Text(date)
                    .foregroundColor(Color(UIColor.darkGray))
                    .font(.title2)
                HStack{
                    VStack(alignment: .center){
                    Text("\(bh)")
                            .foregroundColor(bh>=120 ? Color(UIColor.orange) : Color.green )
                        .font(.title)
                    Text("\(bl)")
                            .foregroundColor(bl>80 ? Color(UIColor.red) : Color.green )
                        .font(.title)
                        
                    }
                    .padding(.bottom, 10)
                    
                    
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.yellow)
                        .frame(width:10, height: 75)
                    //Text("  ")
                    Text("Hypertension")
                        .foregroundColor(Color(UIColor.darkGray))
                        .font(.title)
                        .padding(.leading, 10)
                        
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
                
            }
            .padding(10)
            
//        }
        .background(ContainerRelativeShape().fill(Color(.white)))
        .cornerRadius(20)
        .padding(.horizontal, 5)
           
  //
   }
}

struct ExtractedView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack() {
            Color.gray
            
            ExtractedView(date: "Aug 25, 2023 12:45", bh: 123, bl: 75)
        }
        
            
    }
}


