//
//  KeyboardViewController.swift
//  RealtyQuesterKeyboard
//
//  Created by ghada Mohammad on 18/06/1445 AH.
//

import UIKit
import SwiftUI
import KeyboardKit



class KeyboardViewController: KeyboardInputViewController {
  
    override func viewWillSetupKeyboard() {
        super.viewWillSetupKeyboard()
        
       
        
        setup { controller in
            
            SystemKeyboard(
                
                state: controller.state,
                services: controller.services,
                buttonContent: { $0.view },
                buttonView: { $0.view },
                emojiKeyboard: { $0.view },
                toolbar: { _ in KeyboardView(controller: controller) }
            )
        }
      
     
                
    }
}

struct KeyboardView: View {
    let controller: KeyboardInputViewController
    let arabic = KeyboardLocale.arabic.locale
    
    var body: some View {
        let local = KeyboardContext().locale.localizedName(in: arabic)
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                Button(action: {
                    insertText("Hello, how can i serve you?")
                }, label: {
                    Text("Hello, how can i serve you?")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
            
                })
                Button(action: {
                    insertText("Realty price")
                }, label: {
                    Text("Realty price")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
                Button(action: {
                    insertText("Realty unavailable")
                }, label: {
                    Text("Realty unavailable")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
                Button(action: {
                    insertText("Bedrooms")
                }, label: {
                    Text("Bedrooms")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
                Button(action: {
                    insertText("Kitchen")
                }, label: {
                    Text("Kitchen")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
                Button(action: {
                    insertText("Rent contract")
                }, label: {
                    Text("Rent contract")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
                Button(action: {
                    insertText("Bathrooms")
                }, label: {
                    Text("Bathrooms")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
            
                Button(action: {
                    insertText("Apartment")
                }, label: {
                    Text("Apartment")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
                Button(action: {
                    insertText("Villa")
                }, label: {
                    Text("Villa")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
            
                Button(action: {
                    insertText("Deluxe")
                }, label: {
                    Text("Deluxe")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
            
                Button(action: {
                    insertText("Realty location")
                }, label: {
                    Text("Realty location")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
            
            
                Button(action: {
                    insertText("‎Realty area")
                }, label: {
                    Text("Realty area")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
            
            
                Button(action: {
                    insertText("Number of floors")
                }, label: {
                    Text("Number of floors")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
            
            
            
                Button(action: {
                    insertText("Number of rooms")
                }, label: {
                    Text("Number of rooms")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
            
            
            
                Button(action: {
                    insertText("Sales contract")
                }, label: {
                    Text("Sales contract")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
            
                Button(action: {
                    insertText(" Monthly rent ")
                }, label: {
                    Text(" Monthly rent ")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
                Button(action: {
                    insertText("Annual rent")
                }, label: {
                    Text("Annual rent")
                        .padding(8)
                        .foregroundStyle(.white)
                        .background(.blue)
                        .cornerRadius(10)
                })
            
            }
        }.padding(.horizontal)
    }

    
    private func insertText(_ text: String) {
        controller.textDocumentProxy.insertText(text)
    }
}

//            HStack(spacing: 20) {
//                Button(action: {
//                    insertText("مرحبا، كيف اقدر اخدمك؟")
//                }, label: {
//                    Text("مرحبا، كيف اقدر اخدمك؟")
//                        .padding(8)
//                        .foregroundStyle(.white)
//                        .background(.blue)
//                        .cornerRadius(10)
//
//                })
//                Button(action: {
//                    insertText("العقار بسعر")
//                }, label: {
//                    Text("العقار بسعر")
//                        .padding(8)
//                        .foregroundStyle(.white)
//                        .background(.blue)
//                        .cornerRadius(10)
//                })
//                Button(action: {
//                    insertText("العقار لم يعد متاح")
//                }, label: {
//                    Text("العقار لم يعد متاح")
//                        .padding(8)
//                        .foregroundStyle(.white)
//                        .background(.blue)
//                        .cornerRadius(10)
//                })
//                Button(action: {
//                    insertText("غرف نوم")
//                }, label: {
//                    Text("غرف نوم")
//                        .padding(8)
//                        .foregroundStyle(.white)
//                        .background(.blue)
//                        .cornerRadius(10)
//                })
//                Button(action: {
//                    insertText("مطبخ")
//                }, label: {
//                    Text("مطبخ")
//                        .padding(8)
//                        .foregroundStyle(.white)
//                        .background(.blue)
//                        .cornerRadius(10)
//                })
//                Button(action: {
//                    insertText("عقد إيجار")
//                }, label: {
//                    Text("عقد إيجار")
//                        .padding(8)
//                        .foregroundStyle(.white)
//                        .background(.blue)
//                        .cornerRadius(10)
//                })
//                Button(action: {
//                    insertText("دورات مياة")
//                }, label: {
//                    Text("دورات مياة")
//                        .padding(8)
//                        .foregroundStyle(.white)
//                        .background(.blue)
//                        .cornerRadius(10)
//                })
//
//                Button(action: {
//                    insertText("شقة ")
//                }, label: {
//                    Text("شقة")
//                        .padding(8)
//                        .foregroundStyle(.white)
//                        .background(.blue)
//                        .cornerRadius(10)
//                })
//                Button(action: {
//                    insertText("فيلا ")
//                }, label: {
//                    Text("فيلا")
//                        .padding(8)
//                        .foregroundStyle(.white)
//                        .background(.blue)
//                        .cornerRadius(10)
//                })
//
//                Button(action: {
//                    insertText("ديبلوكس")
//                }, label: {
//                    Text("ديبلوكس")
//                        .padding(8)
//                        .foregroundStyle(.white)
//                        .background(.blue)
//                        .cornerRadius(10)
//                })
//
//                Button(action: {
//                    insertText("موقع العقار")
//                }, label: {
//                    Text("موقع العقار")
//                        .padding(8)
//                        .foregroundStyle(.white)
//                        .background(.blue)
//                        .cornerRadius(10)
//                })
//
//
//                Button(action: {
//                    insertText("‎مساحة العقار ")
//                }, label: {
//                    Text("مساحة العقار ")
//                        .padding(8)
//                        .foregroundStyle(.white)
//                        .background(.blue)
//                        .cornerRadius(10)
//                })
//
//
//                Button(action: {
//                    insertText("عدد الأدوار")
//                }, label: {
//                    Text("عدد الأدوار")
//                        .padding(8)
//                        .foregroundStyle(.white)
//                        .background(.blue)
//                        .cornerRadius(10)
//                })
//
//
//
//                Button(action: {
//                    insertText("عدد الغرف")
//                }, label: {
//                    Text("عدد الغرف")
//                        .padding(8)
//                        .foregroundStyle(.white)
//                        .background(.blue)
//                        .cornerRadius(10)
//                })
//
//
//
//                Button(action: {
//                    insertText("عقد البيع ")
//                }, label: {
//                    Text("عقد البيع ")
//                        .padding(8)
//                        .foregroundStyle(.white)
//                        .background(.blue)
//                        .cornerRadius(10)
//                })
//
//                Button(action: {
//                    insertText(" إيجار شهري ")
//                }, label: {
//                    Text("إيجار شهري ")
//                        .padding(8)
//                        .foregroundStyle(.white)
//                        .background(.blue)
//                        .cornerRadius(10)
//                })
//                Button(action: {
//                    insertText(" إيجار سنوي ")
//                }, label: {
//                    Text("إيجار سنوي ")
//                        .padding(8)
//                        .foregroundStyle(.white)
//                        .background(.blue)
//                        .cornerRadius(10)
//                })
//
//            }




