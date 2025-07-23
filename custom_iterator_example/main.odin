package custom_iterator_example

import "core:fmt"


main :: proc() {
    persons := make([]Person, 128)
    persons[10] = {
        name = "Bob",
        age = 10,
        used = true,
    }

    it := make_persons_iterator(persons[:])

    // In that case is possible to change the current element
    // val is now a ptr
    for val in persons_iterator_ptr(&it) {
        val.age += 1
        fmt.println(val^)
    }
}

Person :: struct {
    name: string,
    age: int,
    used: bool,
}

Persons_Iterator :: struct {
    index: int,
    data: []Person,
}

make_persons_iterator :: proc(data: []Person) -> Persons_Iterator {
    return Persons_Iterator {data=data}
}

persons_iterator :: proc(
    it: ^Persons_Iterator
) -> (val: Person, idx: int, cond: bool) {
    cond = it.index < len(it.data)

    // That's like a while loop
    for ; cond; cond = it.index < len(it.data) {
        if !it.data[it.index].used {
            it.index += 1
            continue
        }

        val = it.data[it.index]
        idx = it.index
        it.index += 1
        break
    }

    return
}

persons_iterator_ptr :: proc(
    it: ^Persons_Iterator
    // Returns a ptr for a Person
) -> (val: ^Person, idx: int, cond: bool) {
    cond = it.index < len(it.data)

    // That's like a while loop
    for ; cond; cond = it.index < len(it.data) {
        if !it.data[it.index].used {
            it.index += 1
            continue
        }

        // assigns the address of the current Person
        val = &it.data[it.index]
        idx = it.index
        it.index += 1
        break
    }

    return
}
