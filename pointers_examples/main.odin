package pointers_examples

import "core:fmt"


Cat_Color :: enum {
    Black,
    White,
    Calico,
    Orange,
    Tabby,
}

Cat :: struct {
    name: string,
    age: int,
    color: Cat_Color,
}

// Does not use the arrow as in C
process_cat_birthday :: proc(cat: ^Cat) {
    cat.age += 1
    fmt.printfln("Happy birthday, %v! You're %v y.o.", cat.name, cat.age)
}

modify_number :: proc(number: ^int) {
    if number == nil {
        return
    }
    number^ = 5
}

/*
// That does not work, because is trying to change a parameter
// without passing a pointer
modify_number_mistakenly :: proc(number: int) {
    number = 10
}
*/

main :: proc() {
    number := 8
    modify_number(&number)
    fmt.printfln("The current value of number is: %v", number)

    tonzinho := Cat {
        name="Tonzinho",
        age=10,
        color=Cat_Color.Orange,
    }

    fmt.printfln("Tonzinho's age was: %v y.o.", tonzinho.age)
    process_cat_birthday(&tonzinho)
    fmt.printfln("Tonzinho's age now is: %v y.o.", tonzinho.age)
}
