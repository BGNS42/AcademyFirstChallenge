//
//  HomePageNav.swift
//  AcademyFirstChallenge
//
//  Created by IGOR TEIXEIRA CARRASCO on 10/04/26.
//

import SwiftUI

struct HomePageNav: View {
    var body: some View {
        NavigationStack{
            HomePage()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    HomePageNav()
}
