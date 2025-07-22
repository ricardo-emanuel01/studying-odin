package structs_example

import "core:fmt"


Rectangle :: struct {
    bottom_left: [2]int,
    top_right: [2]int,
}

main :: proc() {
    rect1 := Rectangle {
        {0, 0}, {2, 2}
    }
    rect2 := Rectangle {
        bottom_left = {-1, -1},
        top_right = {3, 2}
    }

    fmt.printfln(
        "The first rectangle has height: %v and width: %v",
        get_height(rect1),
        get_width(rect1)
    )
    fmt.printfln(
        "The second rectangle has height: %v and width: %v",
        get_height(rect2),
        get_width(rect2)
    )
}

get_height :: proc(rect1: Rectangle) -> int {
    return rect1.top_right[1] - rect1.bottom_left[1]
}

get_width :: proc(rect1: Rectangle) -> int {
    return rect1.top_right[0] - rect1.bottom_left[0]
}
