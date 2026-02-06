import pandas as pd
import ast

df = pd.read_csv("merged_files.csv")

df = df[['Title', 'Year', 'Rating', 'budget', 'genres', 'awards_content']]

# remove that numbering from titles
df['Title'] = df['Title'].str.replace(r'^\d+\.\s*', '', regex=True)

# Only keep rows where the budget is in USD (starts with "$")
usd_mask = df['budget'].astype(str).str.startswith('$')

filtered_df = df[usd_mask].copy()

# Budget to text
filtered_df['budget'] = filtered_df['budget'].astype(str)
# Remove extra text like "(estimated", "$", ','
filtered_df['budget'] = filtered_df['budget'].str.replace('(estimated)', '', regex=False)
filtered_df['budget'] = filtered_df['budget'].str.replace('$', '', regex=False)
filtered_df['budget'] = filtered_df['budget'].str.replace(',', '', regex=False)

# Convert cleaned budget to a number
# If conversion fails, set it to NaN instead of crashing
filtered_df['budget'] = pd.to_numeric(filtered_df['budget'], errors='coerce')

# Drop rows where budget still couldn't be converted
filtered_df = filtered_df.dropna(subset=['budget'])

filtered_df.rename(columns={'budget': 'Budget_usd'}, inplace=True)

filtered_df.to_csv("imdb_clean.csv", index=False)