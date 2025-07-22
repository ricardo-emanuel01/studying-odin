package small_array_examples

import "core:fmt"
import sa "core:container/small_array"


main :: proc() {
    // Initialize 3 elements wiht value 1 (?)
    arr: sa.Small_Array(1024, int) = {1, 3}
    fmt.printfln("len: %v", sa.len(arr))
    for v in 0..<sa.len(arr) {
        fmt.printfln("%v: %v ", v, sa.get(arr, v))
    }

    sa.append(&arr, 10)
    fmt.printfln("len: %v", sa.len(arr))
    for v, i in sa.slice(&arr) {
        fmt.printfln("%v: %v ", i, v)
    }

    sa.append(&arr, 22)
    fmt.printfln("len: %v", sa.len(arr))
    for v in 0..<sa.len(arr) {
        fmt.printfln("%v: %v ", v, sa.get(arr, v))
    }

    // Swap with the last element and remove it
    sa.unordered_remove(&arr, 0)
    fmt.printfln("arr[0]: %v", sa.get(arr, 0))

    for v in 0..<sa.len(arr) {
        fmt.printfln("%v: %v ", v, sa.get(arr, v))
    }
}
