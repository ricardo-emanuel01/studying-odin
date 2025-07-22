package dyn_array_exercises2

import "core:fmt"
import "core:slice"


main :: proc() {
    numbers1: [dynamic]int
    append(&numbers1, 15)

    // That clones correctly the array
    numbers2 := slice.clone_to_dynamic(numbers1[:])
    append(&numbers2, 2)

    fmt.print("First array: ")
    print_array(numbers1)

    fmt.print("Second array: ")
    print_array(numbers2)
}

print_array :: proc(numbers: [dynamic]int) {
    for v in numbers {
        fmt.printfln("%v ", v)
    }
}
