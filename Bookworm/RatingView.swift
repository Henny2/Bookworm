//
//  RatingView.swift
//  Bookworm
//
//  Created by Henrieke Baunack on 12/13/23.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating : Int
    
    var label = ""
    var maximumRating = 5
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack{
            if label.isEmpty == false {
                Text(label)
            }
            ForEach(1..<maximumRating+1, id: \.self) { number in
                Button{
                    rating = number
                    print(number)
                } label: {
                    image(for: number)
                        .foregroundColor(number > rating ? offColor : onColor)
                }
            }
        }
        // need to change the button style here bc otherwise the whole row in the form would be clicked which would trigger every button in the view
        .buttonStyle(.plain)
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            offImage ?? onImage
        } else {
            onImage
        }
    }
}

#Preview {
    // handing in a constant preview to make the preview work
    RatingView(rating: .constant(3))
}
