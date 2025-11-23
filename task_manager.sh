#!/bin/bash

# Core functions for managing tasks

TASK_FILE="tasks.txt"

# Function to add a task
add_task() {
    read -p "Enter task description: " task_description
    if [[ -z "$task_description" ]]; then
        echo "Task description cannot be empty."
        return
    fi

    echo "[ ] $task_description" >> "$TASK_FILE"
    echo "Task added successfully."
}

# Function to list tasks
list_tasks() {
    if [[ ! -f "$TASK_FILE" ]]; then
        touch "$TASK_FILE"  # Create the file if it doesn't exist
    fi

    if [ -s "$TASK_FILE" ]; then
        cat -n "$TASK_FILE" | while read line_number task; do
            echo "$line_number $task"
        done
    else
        echo "No tasks found."
    fi
}

# Function to complete a task
complete_task() {
    list_tasks
    if [[ ! -s "$TASK_FILE" ]]; then
        return
    fi

    read -p "Enter the number of the task to complete: " task_number
    if ! is_valid_integer "$task_number"; then
        echo "Invalid task number. Please enter a valid integer."
        return
    fi

    if ! task_exists "$task_number"; then
        echo "Task number not found."
        return
    fi


    sed -i "${task_number}s/^\[ \]/\[X\]/" "$TASK_FILE"
    echo "Task completed successfully."
}

# Function to remove a task
remove_task() {
    list_tasks
    if [[ ! -s "$TASK_FILE" ]]; then
        return
    fi

    read -p "Enter the number of the task to remove: " task_number

    if ! is_valid_integer "$task_number"; then
        echo "Invalid task number. Please enter a valid integer."
        return
    fi

   if ! task_exists "$task_number"; then
        echo "Task number not found."
        return
    fi

    sed -i "${task_number}d" "$TASK_FILE"
    echo "Task removed successfully."
}

# Helper function to check if task exists
task_exists() {
    task_number=$1
    num_lines=$(wc -l < "$TASK_FILE")

    if [[ "$task_number" -gt "$num_lines" || "$task_number" -lt 1 ]]; then
        return 1 # task doesn't exist
    else
        return 0 # task does exist
    fi
}
# Function to display the menu
display_menu() {
    echo "
Bash Task Manager

1. Add Task
2. List Tasks
3. Complete Task
4. Remove Task
5. Exit
"
}