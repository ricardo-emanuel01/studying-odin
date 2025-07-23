package sets_examples

import "core:fmt"


two_sum :: proc(numbers: []int, target: int) -> bool {
    visited_numbers: map[int]struct{}
    for x in numbers {
        to_target := int(target - x)
        if (to_target in visited_numbers) {
            return true
        }
        add_to_set(&visited_numbers, x)
    }

    return false
}

add_to_set :: proc(set: ^map[$T]struct{}, x: T) {
    set[x] = {}
}

main :: proc() {
    target := int(11)
    numbers := []int {1, 5, 6, 2, 9, 3}
    if two_sum(numbers, target) {
        fmt.printfln(
            "It's possible to sum two numbers in the array to get %v!",
            target
        )
    } else {
        fmt.printfln(
            "It's not possible to sum two numbers in the array to get %v.",
            target
        )
    }
}
