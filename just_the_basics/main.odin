package just_the_basics

import "core:fmt"


main :: proc() {
    comp := 6
    numbers := [10]int {
        20, 10, 5, 8, 2, 5, 1, 4, 3, 11
    }

    for i in numbers {
        if is_bigger_than(i, comp) {
            fmt.printfln("%v is bigger than %v", i, comp)
        } else {
            fmt.printfln("%v is not bigger than %v", i, comp)
        }
    }
}


is_bigger_than :: proc(number: int, compare_to: int) -> bool {
    return number > compare_to
}
