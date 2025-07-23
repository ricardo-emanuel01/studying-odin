package slices_examples

import "core:fmt"


// Global slices
numbers_with_elements := []int {1, 2, 3, 4}
numbers_wout_elements: []int

set_numbers :: proc(numbers: []int) {
    if len(numbers) > 0 {
        // That changes each element
        for &value in numbers {
            value = 0
        }
    } else {
        // Allocates that slice on the stack
        numbers_wout_elements = {1, 2, 3, 4}
        print_numbers(numbers_wout_elements)
    }
}

print_numbers :: proc(numbers: []int) {
    if len(numbers) > 0 {
        for value, index in numbers {
            fmt.printfln("Element %v at index %v", value, index)
        }
    } else {
        fmt.println("The slice does not have elements")
    }
    fmt.println("")
}

main :: proc() {
    print_numbers(numbers_with_elements)
    set_numbers(numbers_with_elements)
    print_numbers(numbers_with_elements)
    fmt.println("--------------------------")
    print_numbers(numbers_wout_elements)

    // unpredictable behaviour
    set_numbers(numbers_wout_elements)
    // That call tries to print deallocated memory from stack
    print_numbers(numbers_wout_elements)
}
