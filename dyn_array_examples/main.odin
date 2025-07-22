package dyn_array_examples

import "core:fmt"


print_data :: proc(dyn_arr: [dynamic]int) {
    fmt.printfln("Current capacity: %v", cap(dyn_arr))
    fmt.printfln("Current length: %v", len(dyn_arr))
}

main :: proc() {
    dyn_arr: [dynamic]int
    // The second argument is the initial length
    // in that case the array have 5 elements with value 0
    dyn_arr_with_make := make([dynamic]int, 5, 25)

    append(&dyn_arr, 15)
    print_data(dyn_arr)

    for i in 0..<7 {
        append(&dyn_arr, i)
    }
    print_data(dyn_arr)

    append(&dyn_arr, 22)
    print_data(dyn_arr)

    delete(dyn_arr)
    delete(dyn_arr_with_make)
}
