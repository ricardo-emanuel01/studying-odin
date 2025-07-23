package maps_examples

import "core:fmt"
import "core:math/rand"


set_ages :: proc(age_by_name: ^map[string]int, names: []string) {
    for value in names {
        age_by_name[value] = rand.int_max(50) + 1
    }
}

get_ages :: proc(age_by_name: map[string]int, names: []string) {
    fmt.printfln("\nGetting ages:")
    for value in names {
        /*
            Could be like that
            if age, ok := age_by_name[value]; ok {
        */
        // Should use '()' in that case
        if (value in age_by_name) {
            fmt.printfln("%v has %v y.o.", value, age_by_name[value])
        // For the sake of the example
        } else if (value not_in age_by_name) {
            fmt.printfln("%v is not on the database.", value)
        }
    }
}

main :: proc() {
    age_by_name: map[string]int
    names1 := []string {"Mario", "Link", "Zelda", "Luigi"}
    names2 := []string {"Mario", "Link", "Zelda", "Luigi", "Wario", "Donkey Kong", "Samus"}

    set_ages(&age_by_name, names1)
    // Iterate through all pairs
    for key, &value in age_by_name {
        fmt.printfln("%v has %v y.o.", key, value)
        if value < 20 {
            value += 10
            fmt.printfln("%v aged 10 YEARS now! %v has %v y.o.", key, key, value)
        }
    }
    get_ages(age_by_name, names2)

    delete(age_by_name)
}
