package strings_examples

import "core:fmt"
import "core:strings"


main :: proc() {
    /*
        It's possible to use normal slices on strings
        but it counts the number of bytes and not necessarily
        the characters. In that case we use strings.substring(...)
        or strings.substring_to(...) or strings.substring_from()
    */
    name := "Mariana"
    age := int(22)
    chinese_name := "小猫咪"
    name_slice, _ := strings.substring(name, 2, 5)
    fmt.printfln("%v", name_slice)
    fmt.printfln("%v", name[2:5])

    // The first character is not full
    fmt.printfln("%v", chinese_name[1:])
    chinese_name_slice, _ := strings.substring(chinese_name, 1, 2)
    fmt.printfln("%v", chinese_name_slice)

    for r, i in name {
        fmt.printfln("%v: %v", i, r)
    }

    // One could specify some allocator as the final argument
    // Could put the formatted string on a buffer with fmt.bprintf
    greetings := fmt.aprintln(name, "is", age, "y.o.")
    greetings_formated := fmt.aprintfln("%v is %v y.o.", name, age)
    fmt.println(greetings)
    fmt.println(greetings_formated)

    // Snippet from the book
    lines := []string {
        "I like",
        "I look for",
        "Where are the",
    }
    b := strings.builder_make()

    for line, i in lines {
        strings.write_string(&b, line)
        if i != len(lines) - 1 {
            strings.write_string(&b, " cats.\n")
        } else {
            strings.write_string(&b, " cats?\n")
        }
    }

    // That does not allocate any memory!
    str := strings.to_string(b)
    fmt.println(str)
    strings.builder_destroy(&b)

    // Good way to work with string builder without the extra memory
    str_builder := strings.builder_make(context.temp_allocator)
    strings.write_string(&str_builder, "I have ")
    strings.write_int(&str_builder, 1)
    strings.write_str(&str_builder, " cat.")

    // The size of current_str will be smaller than the size of the builder
    current_str := strings.clone(string.to_string(str_builder))

    // Don't forget to free all memory allocated by the temp_allocator in some specific times
    free_all(context.temp_allocator)
}
