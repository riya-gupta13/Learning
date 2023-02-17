import pandas as pd

def convert_day(cell):
    if cell=="NaN":
        return 'not find'
    return cell



df= pd.read_excel('business.xlsx', converters= {
    'Day': convert_day
})
print(df)

# to excel
# df.to_excel("new.xlsx")

# specified columns
df.to_excel("new.xlsx", startrow=1, startcol=2, index=False)


