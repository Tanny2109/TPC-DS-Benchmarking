import pandas as pd

# Define data for the comparison table
data = {
    "Metric": [
        "Total Users",
        "Total Completed Transactions",
        "TPS (Transactions Per Second)",
        "TPM (Transactions Per Minute)",
        "Average Response Time (ms)",
        "Maximum Response Time (ms)",
        "Total SELECT Statements",
        "Total INSERT Statements",
        "Total UPDATE Statements",
        "Total Commit Statements",
        "Total Failed Transactions"
    ],
    "Baseline": [16, 187784, 3129.73, 187784, 10.5, 90, 5000, 2000, 1000, 1800, 0],
    "Experiment 1": [32, 306078, 5101.31, 306078, 12.3, 492, 12453, 5947, 3978, 5320, 0],
    "Experiment 2": [32, 234457, 3907.61, 234457, 20.1, 38097, 24739, 10456, 7891, 7654, 0],
    "Experiment 3": [32, 4544, 7.57, 454, 3.5, 19, 47518, 9572, 8034, 4320, 0]
}

# Create DataFrame
comparison_table = pd.DataFrame(data)

# Display the DataFrame
comparison_table
