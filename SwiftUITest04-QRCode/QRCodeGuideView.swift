//
//  QRCodeGuideView.swift
//  SwiftUITest04-QRCode
//
//  Created by jae hwan choo on 2020/10/21.
//

import SwiftUI

struct QRCodeGuideView: View {
    var body: some View {
        GeometryReader { geo in
            let getFrame: CGRect = geo.frame(in: .global)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 10, dash: [11]))
                .frame(width: geo.size.width * 0.5, height: geo.size.width * 0.5, alignment: .trailing)
                    .foregroundColor(.yellow)
                .position(x: getFrame.midX, y: getFrame.midY)
            
        }
        
    }
}

struct QRCodeGuideView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeGuideView()
    }
}
