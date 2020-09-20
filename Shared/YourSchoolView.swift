//
//  YourSchoolView.swift
//  HackMIT2020 (iOS)
//
//  Created by Max Nabokow on 9/20/20.
//

import SwiftUI

struct YourSchoolView: View {
    
    let school = StudentInfo.current.school
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                HStack {
                    Image(school.logoName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, height: 45)
                    Text("COVID-19").bold()
                        .font(.largeTitle)
                    Spacer()
                }
                .padding()
                
                VStack(alignment: .leading) {
                    ForEach(0..<school.phones.count, id: \.self) { i in
                        HStack {
                            Text(school.phones[i].0).bold()
                                .foregroundColor(.white)
                                .padding(4)
                                .background(Color("hRed").opacity(0.25))
                            Spacer()
                            Text(school.phones[i].1)
                        }
                    }
                }
                    
                VStack(alignment: .leading) {
                    ForEach(0..<school.emails.count, id: \.self) { i in
                        HStack {
                            Text(school.emails[i].0).bold()
                                .foregroundColor(.white)
                                .padding(4)
                                .background(Color("hRed").opacity(0.25))
                            Spacer()
                            Text(school.emails[i].1)
                        }
                    }
                }
                        
                VStack(alignment: .leading) {
                    ForEach(0..<school.urls.count, id: \.self) { i in
                        HStack {
                            Text(school.urls[i].0).bold()
                                .foregroundColor(.white)
                                .padding(4)
                                .background(Color("hRed").opacity(0.25))
                            Spacer()
                            Text(school.urls[i].1)
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(0..<school.sections.count, id: \.self) { i in
                        VStack(alignment: .leading) {
                            Text(school.sections[i].sectionTitle)
                                .font(.title)
                            Text(school.sections[i].text)
                        }
                    }
                }
            }
            .padding()
            .padding(.bottom)
        }
        .navigationBarHidden(true)
    }
}

struct YourSchoolView_Previews: PreviewProvider {
    static var previews: some View {
        YourSchoolView()
    }
}
