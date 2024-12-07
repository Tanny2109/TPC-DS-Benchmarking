import os
import csv

def main():
    file_path = '/Users/tanmay/GaTech Atlanta/Fall 2024/CS 6400-DBS/Capstone/nyc-taxi-trip-duration/'
    train_file = os.path.join(file_path, 'train.csv')
    test_file = os.path.join(file_path, 'test.csv')
    dataset_file = os.path.join(file_path, 'dataset.csv')

    with open(dataset_file, 'w') as dataset_file, open(train_file, 'r') as train_file, open(test_file, 'r') as test_file:
        train_reader = csv.reader(train_file)
        test_reader = csv.reader(test_file)
        dataset_writer = csv.writer(dataset_file)

        # Read headers
        train_header = next(train_reader)
        test_header = next(test_reader)

        # Combine headers
        combined_header = train_header + [col for col in test_header if col not in train_header]
        dataset_writer.writerow(combined_header)

        # Write train data
        for row in train_reader:
            dataset_writer.writerow(row + [''] * (len(combined_header) - len(row)))

        # Write test data
        for row in test_reader:
            combined_row = []
            for col in combined_header:
                if col in test_header:
                    combined_row.append(row[test_header.index(col)])
                else:
                    combined_row.append('')
                dataset_writer.writerow(combined_row)
    
    print('Dataset created!')
    # Move the file pointer to the beginning of the file
    


if __name__ == '__main__':
    main()