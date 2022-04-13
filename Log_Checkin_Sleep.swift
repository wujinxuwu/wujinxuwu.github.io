//
//  Log_Checkin_Sleep.swift
//  COMPASS_PAIN_APP
//
//  Created by luke_zhu on 1/30/22.
//

import SwiftUI

struct Log_Checkin_Sleep: View {
    @ObservedObject var input : usersettings
    @State var isLinkActive = false
    @State var sliderValue: Double = 0
    @State var title = "Sleeping time"
    @State var sleep7hrs = true

    var body: some View {
        
            
            VStack {
                
                Image("step3")
                    .resizable()
                    .scaledToFill()
                    .frame(width:400, height: 72,alignment: .top)
                  
                Spacer()

                Group{
                    VStack{
                        Text("Did you sleep for at least 7 \n          hours yesterday?")
                            .bold()
                            .font(.title)
                        HStack{
                            Button {
                                self.sleep7hrs = true
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 60, height: 60)
                                        .foregroundColor(Color.blued)
                                    
                                    Text("Yes")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.yellowed)
                                }
                            }
                            Spacer()
                                .frame(width: 50)
                            Button {
                                self.sleep7hrs = false
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 60, height: 60)
                                        .foregroundColor(Color.blued)
                                    
                                    Text("No")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color.yellowed)
                                }
                            
                            }
                            
                    }


                    
                }
                    if sleep7hrs == true{
                        Spacer()
                            .frame(height:266)
                    }
                Spacer()
                    if sleep7hrs == false{
                    Text("How many hours did you sleep yesterday?")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    Spacer()
                        .frame(height:50)
                    VStack{
                        Text(title)
                            .font(.title)
                            .foregroundColor(.blued)
                        Text(
                            String(format: "%.1f", sliderValue)
                        )
                            .font(.title)
                            .foregroundColor(.blued)
                        Slider(value:$sliderValue, in: 1...7, step: 0.5, minimumValueLabel: Text("1.0"), maximumValueLabel:Text("7.0"), label: {Text("sleep time")})
                            .accentColor(Color.blued)
                            .padding()
                    }}
                Spacer()

                    NavigationLink(destination: Log_Checkin_Sit(input:self.input), isActive: $isLinkActive)
                {
                    Button {
                        self.isLinkActive = true
                        self.input.sleep7hrs = sleep7hrs
                        self.input.sleephours = Int(sliderValue)
                    }label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width:300, height:80)
                            .foregroundColor(Color.blued)
                        Text("Next")
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(Color.yellowed)
                    }
                }
                
                }.padding()
                .frame(alignment:.bottom)
            
        }
        
    }
    
    }
    
}
                
           
                
                

struct Log_Checkin_Sleep_Previews: PreviewProvider {
    static var previews: some View {
        Log_Checkin_Sleep(input:usersettings())
    }
}
