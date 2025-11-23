# Minor edit
#!/bin/bash

# Main script to run the task manager

source task_manager.sh
source utils.sh

while true; do
    display_menu
    read -p "Enter your choice: " choice

    case $choice in
        1) add_task ;;
        2) list_tasks ;;
        3) complete_task ;;
        4) remove_task ;;
        5) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done