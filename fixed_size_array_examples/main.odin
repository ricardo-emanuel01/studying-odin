package fixed_size_array_examples

import "core:fmt"


Vector4 :: [4]f32

main :: proc() {
    numbers: [5]int = {1, 2, 3, 4, 5}

    // For each loop being able to modify each element
    // The & returns v as an addressable
    for &v, i in numbers {
        if v % 2 == 0 {
            v = 0
        }

        fmt.printfln(
            "The element at index %v after the processing is: %v",
            i,
            v
        )
    }

    current_position: Vector4 = {1, 3, 5, 1}
    velocity: Vector4 = {0, 0, 2, 1}
    /* 
        For arrays of 4 dimensions at max one can use
        x, y, z and w for each index on the conventional
        order. It also possible to use r, g, b and a.
    */
    fmt.printfln(
        "The current position is: (%v, %v, %v, %v)",
        current_position.x,
        current_position.y,
        current_position.z,
        current_position.w
    )

    pixel_color: Vector4 = {0.5, 0.5, 0.5, 1}
    fmt.printfln(
        "The current color is: (%v, %v, %v, %v)",
        pixel_color.r,
        pixel_color.g,
        pixel_color.b,
        pixel_color.a
    )

    // Swizzling!!!
    xz_pos := current_position.xz
    fmt.printfln("X: %v and Z: %v", xz_pos[0], xz_pos[1])

    // It's also possible to perform array programming
    // For the sake of the example
    next_position := current_position + velocity
    next_position.w = 1
    fmt.printfln(
        "The position after one time step will be: " +
        "(%v, %v, %v)",
        next_position.x,
        next_position.y,
        next_position.z
    )

    // It's possible to create fixed-arrays based on enums,
    // on which the respective enum works as an index for the array
}
