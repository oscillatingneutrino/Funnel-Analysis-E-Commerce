import pandas as pd
from matplotlib import pyplot as plt


df = pd.read_csv('/Users/d404me/Downloads/top_10_most_bought.csv')

xdata = df['product_name']

y1data = df['quant_sum']

plt.figure(figsize=(12,6), dpi = 200)

plt.bar(xdata,y1data, 0.8)
plt.title('Product Sales Per Item', fontsize = 14)
#plt.xlabel('Product Sales')
plt.xticks(rotation=45, ha='right')
plt.ylabel('Products Sold')
#plt.legend(loc='best')
plt.show()
