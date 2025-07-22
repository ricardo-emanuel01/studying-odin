package procedures_examples

import "core:fmt"
import "core:math"


// Enforce to capture the values returned
@require_results
// Named parameters provide naked return
// m has a default value
// If the data passed as argument is larger than 16 bytes it will be passed
// as a constant reference, so one have not to use pointers for optimization
divide_and_double :: proc(n: f32, m: f32 = f32(12)) -> (res: f32, ok: bool) {
    if n == 0 {
        // Uses naked return, res and ok are initialized to the respectives
        // zero value: 0 and false
        return
    }

    // Naked return would seem strange here
    return (n / m) * 2, true
}

// Explicit overloading
// Allow to use length as a proc and to choose a specific one
length :: proc {
    length_float2,
    length_float3,
}

length_float2 :: proc(v: [2]f32) -> f32 {
    return math.sqrt(v[0]*v[0] + v[1]*v[1])
}

length_float3 :: proc(v: [3]f32) -> f32 {
    return math.sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}

// Runs when the program is initialized
@init
startup :: proc() {
    fmt.println("Program started.")
}

// Runs when the program is shutting down
@fini
shutdown :: proc() {
    fmt.println("Program shutting down.")
}

main :: proc() {
    n, m := f32(4), f32(3)
    if res, ok := divide_and_double(n, m); ok {
        fmt.printfln("The result is: %.3v", res)
    } else {
        fmt.println("The argument was zero, please try again")
    }

    vector_2d: [2]f32 = {2, 9}
    vector_3d: [3]f32 = {1, 2, 3}
    fmt.printfln("The length of the first vector is: %.3v", length(vector_2d))
    fmt.printfln("The length of the second vector is: %.3v", length(vector_3d))
    fmt.printfln("The length of the first vector is: %.3v", length_float2(vector_2d))
}
