//
//  ContentView.swift
//  Sudoku King
//
//  Created by Seven Chords on 03.06.22.
//

import SwiftUI
let v_padding = 20.0
let h_padding = 50.0
let font_size = 25.0

struct Main_Menu: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Sudoku King")
                    .font(.largeTitle)
                    .padding(.vertical, v_padding)
                
                NavigationLink {
                    Play_Menu()
                } label: {
                    Text("Play")
                        .frame(minWidth: 0, maxWidth: 300)
                        .font(.system(size: font_size))
                        .padding(v_padding)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: v_padding)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                .background(Color.indigo)
                .cornerRadius(v_padding)
                .padding(.horizontal, h_padding)
                .padding(.vertical, v_padding)
                
                NavigationLink {
                    //TODO
                } label: {
                        Text("Statistics")
                            .frame(minWidth: 0, maxWidth: 300)
                            .font(.system(size: font_size))
                            .padding(v_padding)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: v_padding)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                }
                .background(Color.indigo)
                .cornerRadius(v_padding)
                .padding(.horizontal, h_padding)
                .padding(.vertical, v_padding)
                
                NavigationLink {
                    //TODO
                } label: {
                    Text("Account")
                        .frame(minWidth: 0, maxWidth: 300)
                        .font(.system(size: font_size))
                        .padding(v_padding)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: v_padding)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                .background(Color.indigo)
                .cornerRadius(v_padding)
                .padding(.horizontal, h_padding)
                .padding(.vertical, v_padding)
            }
            .navigationBarHidden(true)
            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct Play_Menu: View {
    var body: some View {
        VStack {
            Text("Play")
                .font(.largeTitle)
                .padding(.vertical, v_padding)
            
            NavigationLink {
                //TODO
            } label: {
                Text("Continue")
                    .frame(minWidth: 0, maxWidth: 300)
                    .font(.system(size: font_size))
                    .padding(v_padding)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: v_padding)
                            .stroke(Color.white, lineWidth: 2)
                    )
            }
            .background(Color.indigo)
            .cornerRadius(v_padding)
            .padding(.horizontal, h_padding)
            .padding(.vertical, v_padding)
            
            NavigationLink {
                Mode_Menu()
            } label: {
                Text("New Game")
                    .frame(minWidth: 0, maxWidth: 300)
                    .font(.system(size: font_size))
                    .padding(v_padding)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: v_padding)
                            .stroke(Color.white, lineWidth: 2)
                    )
            }
            .background(Color.indigo)
            .cornerRadius(v_padding)
            .padding(.horizontal, h_padding)
            .padding(.vertical, v_padding)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Mode_Menu: View {
    var body: some View {
        VStack {
            Text("Gamemode")
                .font(.largeTitle)
                .padding(.vertical, v_padding)
            
            NavigationLink {
                //TODO
            } label: {
                Text("Ranked")
                    .frame(minWidth: 0, maxWidth: 300)
                    .font(.system(size: font_size))
                    .padding(v_padding)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: v_padding)
                            .stroke(Color.white, lineWidth: 2)
                    )
            }
            .background(Color.indigo)
            .cornerRadius(v_padding)
            .padding(.horizontal, h_padding)
            .padding(.vertical, v_padding)
            
            NavigationLink {
                Difficulty_Selection()
            } label: {
                Text("Unranked")
                    .frame(minWidth: 0, maxWidth: 300)
                    .font(.system(size: font_size))
                    .padding(v_padding)
                    .foregroundColor(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: v_padding)
                            .stroke(Color.white, lineWidth: 2)
                    )
            }
            .background(Color.indigo)
            .cornerRadius(v_padding)
            .padding(.horizontal, h_padding)
            .padding(.vertical, v_padding)
        }
    }
}

struct Difficulty_Selection: View {
    var body: some View {
        VStack {
            let local_v_padding = v_padding/2
            let local_h_padding = h_padding/5
            var difficulty: Int = -1
            
            Text("Select Difficulty")
                .font(.largeTitle)
                .padding(local_v_padding)
            
            HStack {
                Button(action: {
                    difficulty = 0
                }) {
                    Text("Very Easy")
                        .frame(minWidth: 0, maxWidth: 200)
                        .font(.system(size: font_size))
                        .padding(local_v_padding)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: local_v_padding)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                .background(Color.indigo)
                .cornerRadius(local_v_padding)
                .padding(.horizontal, local_h_padding)
                .padding(.vertical, local_v_padding)

                Button(action: {
                    difficulty = 1
                }) {
                    Text("Easier")
                        .frame(minWidth: 0, maxWidth: 200)
                        .font(.system(size: font_size))
                        .padding(local_v_padding)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: local_v_padding)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                .background(Color.indigo)
                .cornerRadius(local_v_padding)
                .padding(.horizontal, local_h_padding)
                .padding(.vertical, local_v_padding)
            }
            .padding(.horizontal, local_h_padding)

            HStack {
                Button(action: {
                    difficulty = 2
                }) {
                    Text("Easy")
                        .frame(minWidth: 0, maxWidth: 200)
                        .font(.system(size: font_size))
                        .padding(local_v_padding)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: local_v_padding)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                .background(Color.indigo)
                .cornerRadius(local_v_padding)
                .padding(.horizontal, local_h_padding)
                .padding(.vertical, local_v_padding)

                Button(action: {
                    difficulty = 3
                }) {
                    Text("Medium")
                        .frame(minWidth: 0, maxWidth: 200)
                        .font(.system(size: font_size))
                        .padding(local_v_padding)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: local_v_padding)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                .background(Color.indigo)
                .cornerRadius(local_v_padding)
                .padding(.horizontal, local_h_padding)
                .padding(.vertical, local_v_padding)
            }
            .padding(.horizontal, local_h_padding)

            HStack {
                Button(action: {
                    difficulty = 4
                }) {
                    Text("Hard")
                        .frame(minWidth: 0, maxWidth: 200)
                        .font(.system(size: font_size))
                        .padding(local_v_padding)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: local_v_padding)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                .background(Color.indigo)
                .cornerRadius(local_v_padding)
                .padding(.horizontal, local_h_padding)
                .padding(.vertical, local_v_padding)

                Button(action: {
                    difficulty = 5
                }) {
                    Text("Harder")
                        .frame(minWidth: 0, maxWidth: 200)
                        .font(.system(size: font_size))
                        .padding(local_v_padding)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: local_v_padding)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                .background(Color.indigo)
                .cornerRadius(local_v_padding)
                .padding(.horizontal, local_h_padding)
                .padding(.vertical, local_v_padding)
            }
            .padding(.horizontal, local_h_padding)

            HStack {
                Button(action: {
                    difficulty = 6
                }) {
                    Text("Very Hard")
                        .frame(minWidth: 0, maxWidth: 200)
                        .font(.system(size: font_size))
                        .padding(local_v_padding)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: local_v_padding)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                .background(Color.indigo)
                .cornerRadius(local_v_padding)
                .padding(.horizontal, local_h_padding)
                .padding(.vertical, local_v_padding)

                Button(action: {
                    difficulty = 7
                }) {
                    Text("Insane")
                        .frame(minWidth: 0, maxWidth: 200)
                        .font(.system(size: font_size))
                        .padding(local_v_padding)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: local_v_padding)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                .background(Color.indigo)
                .cornerRadius(local_v_padding)
                .padding(.horizontal, local_h_padding)
                .padding(.vertical, local_v_padding)
            }
            .padding(.horizontal, local_h_padding)
        }
    }
}

struct number_overlay_cell: View {
    var number: Int
    var action: () -> Void
    var body: some View {
        Button(action: {self.action()}) {
            Text((number == 0) ? "Clear" :
                 (number == 10) ? "Cancel" : String(number))
                .font(.system(size: font_size))
                .foregroundColor(Color.init("Edited_Font_Color"))
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fill)
                .padding(0)
                .overlay(
                    Rectangle()
                        .stroke(Color.init("Cell_Line_Color"), lineWidth: 2)
                )
                .background(Color.init("Background_Color"))
        }
    }
}

struct note_number: View {
    var number: Int
    var body: some View {
        Text((number != 0) ? String(number) : " ")
            .font(.system(size: font_size/2))
            .foregroundColor(Color.init("Edited_Font_Color"))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .padding(0)
            .aspectRatio(1.0, contentMode: .fill)
    }
}

struct single_cell: View {
    @State var entering_number: Bool = false
    @State var editing_notes: Bool = false
    var pos_x: Int
    var pos_y: Int
    @State var notes: [Bool]
    let screen_size = UIScreen.main.bounds.size
    @State var persistance_interface: Persistance_Interface
    
    func number_action(_index: Int) {
        if(_index == 10) {
            entering_number = false
        } else {
            notes = [false, false, false, false, false, false, false, false, false]
            persistance_interface.number_entry(_x: pos_x, _y: pos_y, _n: _index)
            entering_number = false
        }
    }
    
    func note_action(_index: Int) {
        if(_index == 10) {
            editing_notes = false
        } else {
            if(notes[_index - 1]) {
                notes[_index - 1] = false
            } else {
                notes[_index - 1] = true
            }
        }
    }
    
    var body: some View {
        let cell_content = persistance_interface.get_cell_content(_x: pos_x, _y: pos_y)
        let original_content_check = persistance_interface.get_original_content(_x: pos_x, _y: pos_y)
        ZStack {
            VStack {
                if(!notes.contains(true)) {
                    if(original_content_check) {
                        Text((cell_content != 0) ? String(cell_content) : " ")
                            .font(.system(size: font_size))
                            .foregroundColor(Color.init("Original_Font_Color"))
                            .padding(0)
                            .aspectRatio(1.0, contentMode: .fill)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.init("Cell_Line_Color"), lineWidth: 2)
                                    .aspectRatio(1.0, contentMode: .fill)
                            )
                            .aspectRatio(1.0, contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    } else {
                        Text((cell_content != 0) ? String(cell_content) : " ")
                            .font(.system(size: font_size))
                            .foregroundColor(Color.init("Edited_Font_Color"))
                            .padding(0)
                            .aspectRatio(1.0, contentMode: .fill)
                            .overlay(
                                Rectangle()
                                    .stroke(Color.init("Cell_Line_Color"), lineWidth: 2)
                                    .aspectRatio(1.0, contentMode: .fill)
                            )
                            .aspectRatio(1.0, contentMode: .fill)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    }
                } else {
                    VStack {
                        ForEach(0..<3) { i in
                            HStack {
                                ForEach(0..<3) { j in
                                    note_number(number: notes[i * 3 + j] ? i * 3 + j + 1 : 0)
                                }
                            }
                        }
                    }
                    .aspectRatio(1.0, contentMode: .fit)
                    .frame(width: (screen_size.width-50)/9, height: (screen_size.width-50)/9)
                }
            }
            .onTapGesture {
                if(!original_content_check) {
                    entering_number = true
                }
            }
            .onLongPressGesture {
                if(!original_content_check) {
                    editing_notes = true
                }
            }
            VStack {
                if(entering_number) {
                    HStack {
                        number_overlay_cell(number: 7) {number_action(_index: 7)}
                        number_overlay_cell(number: 8) {number_action(_index: 8)}
                        number_overlay_cell(number: 9) {number_action(_index: 9)}
                    }
                    HStack {
                        number_overlay_cell(number: 4) {number_action(_index: 4)}
                        number_overlay_cell(number: 5) {number_action(_index: 5)}
                        number_overlay_cell(number: 6) {number_action(_index: 6)}
                    }
                    HStack {
                        number_overlay_cell(number: 1) {number_action(_index: 1)}
                        number_overlay_cell(number: 2) {number_action(_index: 2)}
                        number_overlay_cell(number: 3) {number_action(_index: 3)}
                    }
                    HStack {
                        number_overlay_cell(number: 0) {number_action(_index: 0)}
                        number_overlay_cell(number: 10) {number_action(_index: 10)}
                    }
                }
            }
                .frame(width: 300, height: 400)
                .aspectRatio(contentMode: .fit)
            VStack {
                if(editing_notes) {
                    HStack {
                        number_overlay_cell(number: 7) {note_action(_index: 7)}
                        number_overlay_cell(number: 8) {note_action(_index: 8)}
                        number_overlay_cell(number: 9) {note_action(_index: 9)}
                    }
                    HStack {
                        number_overlay_cell(number: 4) {note_action(_index: 4)}
                        number_overlay_cell(number: 5) {note_action(_index: 5)}
                        number_overlay_cell(number: 6) {note_action(_index: 6)}
                    }
                    HStack {
                        number_overlay_cell(number: 1) {note_action(_index: 1)}
                        number_overlay_cell(number: 2) {note_action(_index: 2)}
                        number_overlay_cell(number: 3) {note_action(_index: 3)}
                    }
                    HStack {
                        number_overlay_cell(number: 10) {note_action(_index: 10)}
                    }
                }
            }
                .frame(width: 300, height: 400)
                .aspectRatio(contentMode: .fit)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}

struct square_3x3: View {
    let screen_size = UIScreen.main.bounds.size
    var loc_x: Int
    var loc_y: Int
    @State var persistance_interface: Persistance_Interface
    var body: some View {
        ZStack {
            VStack {
                ForEach(0..<3) { i in
                    HStack {
                        ForEach(0..<3) { j in
                            single_cell(pos_x: loc_x * 3 + i, pos_y: loc_y * 3 + j, notes:
                                        [false, false, false, false, false, false, false, false, false],
                                        persistance_interface: persistance_interface)
                            .padding(0)
                        }
                    }
                }
            }
            .frame(width: (screen_size.width-50)/3, height: (screen_size.width-50)/3)
        }
        .overlay(Rectangle().stroke(Color.init("Cell_Line_Color"), lineWidth: 5))
    }
}

struct Game_View: View {
    let screen_size = UIScreen.main.bounds.size
    let persistance_interface = Persistance_Interface()
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    ForEach(0..<3) { i in
                        HStack {
                            ForEach(0..<3) { j in
                                square_3x3(loc_x: i, loc_y: j,
                                           persistance_interface: persistance_interface)
                            }
                        }
                    }
                }
            }
            .frame(width: screen_size.width-50, height: screen_size.width-50, alignment: .center)
            .aspectRatio(contentMode: .fit)
            HStack {
                NavigationLink {
                    Main_Menu()
                } label: {
                    Text("Back to Menu")
                        .frame(minWidth: 0, maxWidth: 200)
                        .font(.system(size: font_size))
                        .padding(v_padding/2)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: v_padding/2)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                .background(Color.indigo)
                .cornerRadius(v_padding/2)
                .padding(.horizontal, h_padding/3)
                .padding(.vertical, v_padding/2)
                
                NavigationLink {
                    Main_Menu()
                } label: {
                    Text("Abandon Game")
                        .frame(minWidth: 0, maxWidth: 200)
                        .font(.system(size: font_size))
                        .padding(v_padding/2)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: v_padding/2)
                                .stroke(Color.white, lineWidth: 2)
                        )
                }
                .background(Color.indigo)
                .cornerRadius(v_padding/2)
                .padding(.horizontal, h_padding/3)
                .padding(.vertical, v_padding/2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Main_Menu()
    }
}
