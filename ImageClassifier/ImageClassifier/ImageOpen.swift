//
//  ImageOpen.swift
//  ImageClassifier
//
//  Created by 川島 寛隆 on 2019/10/10.
//  Copyright © 2019 川島 寛隆. All rights reserved.
//

import SwiftUI

struct ImageOpen: View {
     @State var selectedURL: URL?
     @State var data: Data?
     var body: some View {
          VStack {
               Button(action: {
                    let panel = NSOpenPanel()
                    panel.allowedFileTypes = ["png", "jpeg", "jpg"]
                    panel.allowsMultipleSelection = false
                    panel.canChooseDirectories = false
                    panel.canChooseFiles = true
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                         let result = panel.runModal()
                         if result == .OK {
                              self.selectedURL = panel.url
                              if panel.url != nil {
                                   let path = self.selectedURL!
                                   do {
                                        self.data = try Data(contentsOf: path)
                                   } catch {
                                        self.data = nil
                                   }
                              }
                         }
                    }
               }) {
                    Text("Open")
               }
            Spacer()
               if self.data != nil {
                    VStack {
                         Image(nsImage: NSImage(data: self.data!)!)
                              .resizable()
                              .frame(width: 512, height: 384, alignment: .center)
                         Text(self.selectedURL!.path)
                    }
               }
            Spacer()
          }
     }
}

struct ImageOpen_Previews: PreviewProvider {
    static var previews: some View {
        ImageOpen()
    }
}
