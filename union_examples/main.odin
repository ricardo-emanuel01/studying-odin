package union_examples

import "core:fmt"


Person_Data :: struct {
    health: int,
    age: int,
}

Some_Union :: union {
    f32,
    int,
    Person_Data,
}

main :: proc() {
    val: Some_Union = Person_Data {
        health=100,
        age=22
    }

    // Do something different depending on which type is on val
    // 'switch in' has the 'in' in comparison with switch on an enum
    switch v in val {
    case f32:
        // Something
    case int:
        // Other thing
    case Person_Data:
        fmt.printfln("The health is: %v", v.health)
        fmt.printfln("The age is: %v", v.age)
    }

    val = f32(2.5)

    // If only one case matters
    if f32_val, f32_val_ok := val.(f32); f32_val_ok {
        fmt.printfln("The person is a float right now, which is: %v", val)
    }

    // If one wanted to change the content of val
    if f32_val, f32_val_ok := &val.(f32); f32_val_ok {
        // Cannot change the type here, because f32_val^ is a pointer to f32 (probably)
        f32_val^ = 2.0
    }
}
