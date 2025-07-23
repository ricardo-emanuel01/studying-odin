package dyn_array_exercises2

import "core:fmt"
import "core:slice"


main :: proc() {
    numbers1: [dynamic]int
    append(&numbers1, 15)

    numbers_miscopied := numbers1
    append(&numbers1, 5)
    append(&numbers1, 4)
    append(&numbers1, 20)
    append(&numbers1, 124)
    fmt.printfln("The length of 'numbers_miscopied' is: %v", len(numbers_miscopied))
    fmt.printfln("The correct length of the address of memory pointed is: %v", len(numbers1))
    // That clones correctly the array
    numbers_properly_copied := slice.clone_to_dynamic(numbers1[:])
    append(&numbers_properly_copied, 2)

    fmt.print("First array: ")
    print_array(numbers1)

    fmt.print("Second array: ")
    print_array(numbers_properly_copied)
}

print_array :: proc(numbers: [dynamic]int) {
    for v in numbers {
        fmt.printfln("%v ", v)
    }
}
