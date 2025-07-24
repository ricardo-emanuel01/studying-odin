package strings_examples1

import "core:fmt"
import vmem "core:mem/virtual"
import "core:strings"


main :: proc() {
    /*
        What happens when one create a string that is composed
        of static and dynamic allocated strings appended??
    */
    strs := make_some_strings_all_dynamic()

    // Do some important stuff

    // That is a silent crash :(
    // When tries to delete a string constant
    for s in strs {
        delete(s)
    }

    delete(strs)

    strs_using_arena, strs_arena := make_some_strings_mem_arena()
    vmem.arena_destroy(&strs_arena)
    delete(strs_using_arena)

    // fmt.println("Probably didn't get here due to `delete(s)` crashing.")
}

// Snippet from book
make_some_strings :: proc() -> [dynamic]string {
    strs: [dynamic]string

    append(&strs, "Hellope!")
    append(&strs, "Hi!")

    // Dynamically allocated string and appended on strs
    /*
        In that case append uses append_elem_string which uses
        _append_elem_string which in its turn uses _append_elems.
        The function _append_elems does some safety checking and
        after that uses a mem_copy from the argument string to the
        string which is receiving the append.
    */
    append(&strs, strings.clone("Dynamically allocated!"))
    append(&strs, "Constant!")
    append(&strs, strings.clone("Dynamic!"))

    return strs
}

// First way of fixing it
// Dynamic allocate all strings
make_some_strings_all_dynamic :: proc() -> [dynamic]string {
    strs: [dynamic]string

    strs_add :: proc(strs: ^[dynamic]string, s: string) {
        append(strs, strings.clone(s))
    }

    strs_add(&strs, "Hellope!")
    strs_add(&strs, "Hi!")
    strs_add(&strs, "Dynamically allocated!")
    strs_add(&strs, "Not constant anymore!")
    strs_add(&strs, "Dynamic!")

    return strs
}

make_some_strings_mem_arena :: proc() -> ([dynamic]string, vmem.Arena) {
    arena: vmem.Arena

    strs: [dynamic]string
    arena_allocator := vmem.arena_allocator(&arena)

    append(&strs, "Hellope!")
    append(&strs, "Hi!")
    append(&strs, strings.clone("Dynamically allocated!", arena_allocator))
    append(&strs, "Constant!")
    append(&strs, strings.clone("Dynamic!", arena_allocator))

    return strs, arena
}