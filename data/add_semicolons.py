def update_sql_file(filename):
    updated_lines = []

    with open(filename, 'r') as file:
        for line in file:
            line = line.rstrip()  # Remove trailing whitespace and newline characters

            # Check if line should be updated
            if not line.startswith('--') and line.strip():
                if not line.endswith(';'):
                    line += ';'
            updated_lines.append(line)

    # Create a new filename for the updated file
    new_filename = filename.replace('.sql', '_updated.sql')

    with open(new_filename, 'w') as file:
        file.write('\n'.join(updated_lines))

    print(f"File '{new_filename}' created with updated semicolons.")

# Prompt the user for a filename
filename = input("Enter the filename: ")

# Call the function to update the file
update_sql_file(filename)

