//
//  SetupView.swift
//  HackMIT2020 (iOS)
//
//  Created by Max Nabokow on 9/20/20.
//

import SwiftUI

let avatarNames = ["avatarF0", "avatarF1", "avatarF2", "avatarF3", "avatarF4", "avatarF5", "avatarF6", "avatarM0", "avatarM1", "avatarM2", "avatarM3", "avatarM4", ]
let schoolNames = [ "MIT", "UNC", "USC", "Michigan", "UT Austin"]

struct SetupView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var tab: Int = 0
    @State var selectedImageIndex: Int = 0
    @State var selectedSchoolIndex: Int = 0
    @State var statusIndex: Int = 0
    
    let columns = [GridItem(), GridItem(), GridItem()]
    
    var first: some View {
        VStack {
            Text("Pick an Avatar!").bold()
                .padding()
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(0..<avatarNames.count, id: \.self) { i in
                    Image(avatarNames[i])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .opacity(selectedImageIndex == i ? 1 : 0.5)
                        .background(Color.primary.opacity(selectedImageIndex == i ? 0.25 : 0))
                        .cornerRadius(selectedImageIndex == i ? 24 : 4)
                        .offset(x: selectedImageIndex == i ? -4: 0, y: selectedImageIndex == i ? -4 : 0)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedImageIndex = i
                            }
                            StudentInfo.current.avatarName = avatarNames[i]
                        }
                    
                }
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
    var second: some View {
        VStack {
            Text("Pick your school!")
                .bold()
                .padding()
            VStack(spacing: 4) {
                ForEach(0..<schoolNames.count, id: \.self) { i in
                    HStack(spacing: 16) {
                        Image(schoolNames[i])
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                        Text(schoolNames[i])
                            .fontWeight(.bold)
                        Color.white.opacity(0.000001)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                    }
                    .padding(.horizontal)
                    .background(Color.primary.opacity(selectedSchoolIndex == i ? 0.25 : 0))
                    .cornerRadius(12)
                    .onTapGesture {
                        withAnimation(.spring()) { selectedSchoolIndex = i }
                        
                        StudentInfo.current.school = .unc
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
    var third: some View {
        VStack {
            Text("What's your COVID-19 Status?")
                .bold()
                .padding()
            VStack(alignment: .leading) {
                ForEach(0..<Student.Status.allCases.count, id: \.self) { i in
                    Label(title: { Text(Student.Status.allCases[i].rawValue.capitalized).bold() }) {
                        Image(systemName: "circlebadge.fill")
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Student.Status.getColor(for: Student.Status.allCases[i]))
                    .background(Color.primary.opacity(statusIndex == i ? 0.25 : 0))
                    .cornerRadius(12)
                    .onTapGesture {
                        withAnimation(.spring()) { statusIndex = i }
                    }
                }
            }
            .padding(.horizontal)
            Spacer()
            Button(action: { self.presentationMode.wrappedValue.dismiss() }) {
                Text("Get Started")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("hRed"))
                    .cornerRadius(12)
                
            }
            .padding(.horizontal)
            .padding(.bottom, 40)
        }
    }
    
    var body: some View {
        TabView(selection: $tab) {
            first
            second
            third
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct SetupView_Previews: PreviewProvider {
    static var previews: some View {
        SetupView()
    }
}
