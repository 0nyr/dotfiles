"""
This script is used to open a project in VS Code or Kitty terminal.
"""

import os
import sys
import subprocess
import json
import enum

# create command enum
class Command(enum.Enum):
    CODE = "nix develop && code"
    KITTY = "kitty"

# take parameter -c "code" or "kitty"
if len(sys.argv) > 1:
    if sys.argv[1] == "-c":
        if len(sys.argv) > 2:
            if sys.argv[2] == "code":
                input_command = Command.CODE
            elif sys.argv[2] == "kitty":
                input_command = Command.KITTY
            else:
                print("Error: invalid command")
                sys.exit(1)
        else:
            print("Error: no command specified")
            sys.exit(1)
    else:
        print("Error: invalid parameter")
        sys.exit(1)

# load dir_list.json
list_of_projects: list[str] = []
json_dir_path = os.path.join(os.path.dirname(__file__), "dir_list.json")
with open(json_dir_path) as f:
    dir_list = json.load(f)
    print("dir_list:", dir_list)

    # append directories from dir_list.manual_projects (just check if they exist)
    for project_dir in dir_list["manual_projects"]:
        # replace ~ with home directory
        project_dir_expanded = os.path.expanduser(project_dir)

        if os.path.isdir(project_dir_expanded):
            list_of_projects.append(project_dir)

    # list subdirectories (level 1) or every directory in dir_list.dir_with_projects
    for project_dir in dir_list["dir_with_projects"]:
        # replace ~ with home directory
        project_dir_expanded = os.path.expanduser(project_dir)

        if os.path.isdir(project_dir_expanded):
            for dir in os.listdir(project_dir_expanded):
                if os.path.isdir(os.path.join(project_dir_expanded, dir)):
                    list_of_projects.append(os.path.join(project_dir, dir))


# print list_of_projects
print("List of projects:", list_of_projects)
if len(list_of_projects) == 0:
    print("Error: no projects found")
    sys.exit(1)

def execute(command: str) -> str:
    """
    Execute command and return its output
    """
    print("Executing:", command)
    command_return = subprocess.run(
        command, shell=True, capture_output=True, text=True
    )
    return command_return.stdout.strip()  # Added strip() to remove any trailing newlines


# execute command and wait for its return string
rofi_command = "echo \"" + "\n".join(list_of_projects) + "\" | rofi -dmenu -p \"code menu\""
rofi_return = execute(rofi_command)
print("rofi_return:", rofi_return)
rofi_return_expanded = os.path.expanduser(rofi_return)

# if return is empty, exit
if rofi_return_expanded == "":
    sys.exit(0)

# match rofi_return with list_of_projects
project_dir = ""
for project in list_of_projects:
    if rofi_return_expanded == os.path.expanduser(project):
        project_dir = project
        break

# open project in VS Code or Kitty terminal
if input_command == Command.CODE:
    # in this situation, we have two cases:
    # 1. project_dir is a directory containing a flake.nix file -> need to run nix develop before opening VS Code
    # 2. project_dir is a directory contains no flake.nix file -> just open VS Code*
    potential_flake_nix_path = os.path.expanduser(os.path.join(project_dir, "flake.nix"))
    print("potential_flake_nix_path:", potential_flake_nix_path)
    is_flake_nix = os.path.isfile(potential_flake_nix_path)
    print("flake.nix exists:", is_flake_nix)
    if is_flake_nix:
        # example: cd ~/code/phdtrack/data_processing_masterarbeit && nix develop && code .
        final_command_to_execute = "cd " + project_dir + " && nix develop --command bash -c \"code .\""
    else:
        # example: code ~/.config
        final_command_to_execute = "cd " + project_dir + " && code ."
    print("final_command_to_execute:", final_command_to_execute)
elif input_command == Command.KITTY:
    final_command_to_execute = input_command.value + " " + rofi_return_expanded

execute(final_command_to_execute)
