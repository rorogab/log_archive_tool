# Log Archiving Tool

This is a simple command-line tool for archiving log files on Unix-based systems. The tool compresses the logs from a specified directory into a `.tar.gz` file and stores them in a designated archive directory. It also logs the details of each archive operation, such as the date, time, and location of the archived files.

## Features

- Accepts a log directory as an argument.
- Compresses the contents of the log directory into a `.tar.gz` file.
- Stores the compressed archive in a designated archive directory (`$HOME/log_archives`).
- Includes a timestamp in the archive filename for uniqueness.
- Logs the details of each archive operation to a file for tracking.

## Requirements

- Unix-based operating system (Linux, macOS, etc.)
- `tar` command installed (usually pre-installed on most Unix systems)
- `bash` shell (script is written in Bash)

## Usage

### Running the Script

To use the log archiving tool, run the script from the command line, passing the log directory you want to archive as an argument.

```bash
./log_archive.sh <log-directory>
```

Replace `<log-directory>`with the path to the directory containing the logs you wish to archive.

### Example

```bash
./log_archive.sh /var/log
```

The above command will compress the contents of the /var/log directory and store the archive in the $HOME/log_archives directory.

### Output

The script creates the following:

- Compressed Archive File: A `.tar.gz` file containing the logs, named using the format `logs_archive_YYYYMMDD_HHMMSS.tar.gz`.
- Log Details File: An `archive_log.txt` file that logs the date, time, source log directory, and location of the archived file.

## File Structure

After running the script, the file structure may look like this:

```bash
/home/username/
└── log_archives/
    ├── logs_archive_20241022_145830.tar.gz
    └── archive_log.txt
```

## Script Overview

Variables

- `LOG_DIR`: The directory containing the logs to be archived (passed as an argument).
- `ARCHIVE_DIR`: The directory where the archived files will be stored (`$HOME/log_archives`).
- `TIMESTAMP`: A timestamp used in the archive filename (`DDMMYYY_HHMMSS format`).
- `ARCHIVE_FILE`: The name of the `.tar.gz` archive file.
- `LOG_FILE`: The file that logs details of each archive operation (`archive_log.txt`).

## Error Handling

- The script checks if the correct number of arguments is provided.
- It verifies that the specified log directory exists.
- It checks if the `tar` command succeeded in creating the archive.

## Customization

You can customize the script to:

- Archive logs from multiple directories.
- Use a different compression format.
- Automate the script to run on a schedule using cron jobs.
- Send notifications or email updates when archiving is complete.
- Upload the archived file to a remote server or cloud storage.
