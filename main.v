module main

import cli { Command, Flag }
import os
import command

fn main() {
	mut cmd := Command{
		name: 'cohubagent'
		description: 'Coofis Hub Agent'
		version: '0.9.0'
	}
    // List Start
	mut list_cmd := Command{
		name: 'list'
		description: 'List all archive letter'
		execute: command.list_func
	}
    // List End

    // Scaffold Start
	mut init_cmd := Command{
		name: 'init'
		description: 'Bootstrap directory and file structure for cohub'
		usage: '<path>'
		required_args: 1
		execute: command.init_func
	}
	init_cmd.add_flag(Flag{
		flag: .string
		required: true
		name: 'path'
		abbrev: 'p'
		description: 'Base path for module to create.'
	})
    // Scaffold End

	cmd.add_command(list_cmd)
	cmd.add_command(init_cmd)
	cmd.parse(os.args)
}


