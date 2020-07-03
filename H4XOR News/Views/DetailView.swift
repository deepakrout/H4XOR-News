//
//  DetailView.swift
//  H4XOR News
//
//  Created by Deepak Rout on 7/03/20.
//  Copyright © 2020 Deepak Rout. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://google.com")
    }
}


