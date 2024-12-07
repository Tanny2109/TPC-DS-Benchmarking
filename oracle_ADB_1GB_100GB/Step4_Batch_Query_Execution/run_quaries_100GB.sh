#!/bin/bash

# Database connection configuration
DB_USER="admin"
DB_PASSWORD="password_hidden"
DB_CONNECTION_STRING="class6400100gb_high"

# SQL files directory
SQL_DIR="TPC-DS-Tool/DSGen-software-code-3.2.0rc1/sql"

# Output log file
LOG_FILE="query_results_100GB.log"

# Clear old log file
> "$LOG_FILE"

# Loop through SQL files in sorted order
for SQL_FILE in $(ls "$SQL_DIR"/*.sql | sort -V); do
  # Print progress
  echo "Running query: $SQL_FILE"
  
  # Execute SQL script and capture the output
  result=$(echo "
  SET SERVEROUTPUT ON;
  SET FEEDBACK ON;
  SET TIMING ON;
  @$SQL_FILE
  exit;" | sqlplus -s "$DB_USER/$DB_PASSWORD@$DB_CONNECTION_STRING" 2>&1)
  
  # Extract the first occurrence of rows selected
  rows_selected=$(echo "$result" | grep -m 1 -Eo "[0-9]+ row(s)? selected" | grep -Eo "[0-9]+")
  # Extract the first occurrence of elapsed time
  elapsed_time=$(echo "$result" | grep -m 1 -Eo "Elapsed: [0-9:.]+" | grep -Eo "[0-9:.]+")
  
  # Write results to the log file
  echo "Script: $SQL_FILE" >> "$LOG_FILE"
  if [ -z "$rows_selected" ] || [ -z "$elapsed_time" ]; then
    echo "Error: Unable to parse rows or elapsed time. This query might have failed." >> "$LOG_FILE"
    echo "Raw Output:" >> "$LOG_FILE"
    echo "$result" >> "$LOG_FILE"
  else
    echo "Rows Selected: $rows_selected" >> "$LOG_FILE"
    echo "Elapsed Time: $elapsed_time seconds" >> "$LOG_FILE"
  fi
  echo "-------------------------------" >> "$LOG_FILE"
done

# Print completion message
echo "All queries executed in sequential order! Results are saved in $LOG_FILE."

