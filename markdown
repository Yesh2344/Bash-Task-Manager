# Bash Task Manager

A simple command-line task manager written in Bash. This tool allows you to add, list, complete, and remove tasks. Tasks are stored in a plain text file, making it easy to manage and back up your to-do list.

## Features

*   **Add tasks:** Easily add new tasks to your to-do list.
*   **List tasks:** View your current to-do list, with clear indication of completed tasks.
*   **Complete tasks:** Mark tasks as completed.
*   **Remove tasks:** Delete tasks from your list.
*   **Persistence:** Tasks are saved to a file, so they persist between sessions.
*   **Customizable task file:** The location of the task file can be configured.

## Installation

1.  Clone the repository:

    ```bash
    git clone <repository_url>
    cd bash-task-manager
    ```

2.  Make the scripts executable:

    ```bash
    chmod +x run.sh task_manager.sh
    ```

3.  (Optional) Customize the task file location: See the "Configuration" section below.

## Usage

Run the `run.sh` script to start the task manager.
