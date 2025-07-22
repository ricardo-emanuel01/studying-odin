package enum_examples

import "core:fmt"


// Each value could be explicitly setted
Computer_Type :: enum {
    Laptop,
    Desktop,
    Mainframe,
    Cluster,
    Grid,
}

main :: proc() {
    // computer_mari := .Laptop // Cannot determine the type
    computer_mari := Computer_Type.Laptop

    // All values must have a case
    switch computer_mari {
    case .Laptop:
        fmt.println("Mari has a Laptop")
    case .Desktop:
        fmt.println("Mari has a Desktop")
    case .Mainframe:
        fmt.println("Mari has a Mainframe")
    case .Cluster:
        fmt.println("Mari has a Cluster")
    case .Grid:
        fmt.println("Mari has a Grid")
    }
}
