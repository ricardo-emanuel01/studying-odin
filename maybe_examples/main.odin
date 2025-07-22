package maybe_examples

import "core:fmt"


generate_number :: proc(arg: int) -> Maybe(int) {
    if arg == 0 {
        return nil
    } else {
        return arg
    }
}

main :: proc() {
    something := generate_number(0)
    // Same for union but how there is only one possible type
    // compiler knows what to do
    if something_val, something_val_ok := something.?; something_val_ok {
        fmt.printfln("The returned value is %v", something_val)
    } else {
        fmt.println("The returned value is nil")
    }

    something = generate_number(2)
    if something_val, something_val_ok := something.(int); something_val_ok {
        fmt.printfln("The returned value is %v", something_val)
    } else {
        fmt.println("The returned value is nil")
    }
}
