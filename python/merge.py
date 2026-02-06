import pandas as pd
import glob
import os

# Look inside the mergeddata folder for any file that had merged and is csv file
joined_files = os.path.join("mergeddata","merged*.csv")

# Build a list of all matching files
joined_list = glob.glob(joined_files)


header = True
# Go through each file and add it to the final combined CSV
for file_name in joined_list:
    print(file_name)
    # mode="a" means append instead of overwrite
    # header is only written for the first file
    df = pd.read_csv(file_name)
    df.to_csv('merged_files.csv', mode="a", header=header, index=False)

    # After first write, stop writing headers again
    header=False