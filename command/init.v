module command

import cli { Command, Flag }
import os

pub fn init_func(cmd Command) {
    print("Checking target directory ... ")
    base_path := cmd.flags.get_string('path') or {
        panic('Failed to get `path` flag: $err')
    }
    if os.exists(base_path) {
        panic("Failed, directory already exist")
    } else {
        println("[OK]")
    }
    
}
