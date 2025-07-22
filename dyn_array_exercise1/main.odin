package dyn_array_exercise1

import "core:fmt"


Cat :: struct {
    age: int,
    name: string,
}

main :: proc() {
    numbers: [dynamic]int
    numbers_fixed_size, alloc_err := new([64]int)
    // In that case the brackets automatically
    // dereferences the pointer to integer
    if alloc_err != nil {
        // If there's no error on the allocation
        numbers_fixed_size[5] = 15
    }

    for i in 0..<1024 {
        print_info(numbers)
        append(&numbers, 23)
    }

    cat_simulation()

    delete(numbers)
}

make_cat :: proc(name: string, age: int) -> ^Cat {
    // For the sake of studies
    cat: ^Cat = new(Cat)
    cat^ = {
        name=name,
        age=age,
    }

    return cat
}

meow :: proc(cat: ^Cat) {
    // Automatically dereference cat
    fmt.printfln("%v says meow!", cat.name)
}

cat_simulation :: proc() {
    cat := make_cat("Tom", 10)

    meow(cat)
    
    // Uses 'free' whenever the memory was allocated with 'new'
    free(cat)
}

print_info :: proc(numbers: [dynamic]int) {
    fmt.printfln("The length is: %v", len(numbers))
    fmt.printfln("The capacity is: %v", cap(numbers))
    fmt.printfln("The array is at address: %p", raw_data(numbers))
}
