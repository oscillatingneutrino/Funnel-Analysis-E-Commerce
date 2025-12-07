import pandas as pd
from matplotlib import pyplot as plt


df = pd.read_csv('/Users/d404me/Downloads/top_10_most_bought.csv')

xdata = 'product_name'

y1data = 'quant_sum'

plt.figure(figsize=(12,6), dpi = 200)

for Category, group in df.groupby('category'):
    plt.bar(group[xdata],group[y1data], 0.8, label = Category)

plt.title('Product Sales Per Item', fontsize = 14)
#plt.xlabel('Product Sales')
plt.xticks(rotation=45, ha='right', fontsize = 12)
plt.ylabel('Products Sold', fontsize = 12)
plt.legend(loc='best')
plt.legend(bbox_to_anchor=(1.19, 1.02), loc='upper right')
plt.show()
