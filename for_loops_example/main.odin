package for_loops_example

import "core:fmt"


main :: proc() {
    // Infinite loop
    for {
        fmt.println("Inside the inf. loop!")
        break
    }

    // Seems like an while loop
    i := 0
    for i < 10 {
        fmt.printfln("%v", i)
        i += 1
    }

    // Regular for loop
    for k := 0; k < 10; k += 1 {
        fmt.printfln("Iteration number %v", k);
    }

    // For each
    for j in 0..<10 {
        fmt.printfln("%v", j)
    }

    // Using labels
    // It's possible to use labels on continue statement
    outer: for x in 0..<20 {
        for y in 0..<10 {
            if x == 10 || y == 3 {
                fmt.printfln("Breaking the outer loop! [x=%v; y=%v]", x, y);
                break outer
            }
        }
    }
}
