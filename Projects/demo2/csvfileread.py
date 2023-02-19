import pandas as pd
# df= pd.read_csv('business.csv')
# print(df)

# to read only 3 rows
df= pd.read_csv('business.csv', nrows=3)
# print(df)


# back to csv
# df.to_csv('new.csv')

# to write only specified number of columns
print(df.columns)
df.to_csv("new.csv", columns=['Series_reference'])
