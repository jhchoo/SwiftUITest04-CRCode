//
//  QRCodeScannerExampleView.swift
//  SwiftUITest04-QRCode
//
//  Created by jae hwan choo on 2020/10/21.
//

import SwiftUI

struct QRCodeScannerExampleView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String?

    var body: some View {
            ZStack {
                if let scannedCode = self.scannedCode {
                    // NavigationLink("Next page", destination: NextView(scannedCode: scannedCode!), isActive: .constant(true)).hidden()
                    //Text("scanCode ; \(scannedCode)")
                    
                    MyWebview(urlToLoad: scannedCode)
                } else {
                    MyWebview(urlToLoad: "https://m.dhlottery.co.kr/")
                }
                
                VStack {
                    Spacer()
                    
                    Button(action: {
                        self.isPresentingScanner = true
                    }) {
                        Text("로또번호 확인")
                            .fontWeight(.heavy)
                            .font(.system(size: 40))
                            .foregroundColor(Color.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(20)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.blue, lineWidth: 4)
                                )
                    }
                    .sheet(isPresented: $isPresentingScanner) {
                        self.scannerSheet
                    }
                    
                    Spacer().frame(height: 30)
                }
                
            }

    }

    var scannerSheet : some View {
        ZStack {
            CodeScannerView(
                codeTypes: [.qr],
                completion: { result in
                    if case let .success(code) = result {
                        self.scannedCode = code
                        self.isPresentingScanner = false
                    }
                }
            )
            
            QRCodeGuideView()
        }
    }
}

struct QRCodeScannerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScannerExampleView()
    }
}
