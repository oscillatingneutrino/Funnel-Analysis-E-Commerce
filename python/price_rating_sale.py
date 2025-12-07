import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('product_count_vs_rating_or_price.sql.csv')

x1 = df['rating']

x2 = df['price']


y = df['product_count']


plt.figure(figsize=(10,5), dpi = 200)
plt.scatter(x1,y)
plt.xlabel('Average Product Rating')
plt.ylabel('Product Purchase Count')
plt.title('Product Rating vs Product Sales')
plt.grid(True)
plt.show()

plt.figure(figsize=(10,5), dpi = 200)
plt.scatter(x2,y)
plt.xlabel('Average Product Price')
plt.ylabel('Product Purchase Count')
plt.title('Product Price vs Product Sales')
plt.grid(True)
plt.show()

plt.figure(figsize=(10,5), dpi = 200)
plt.scatter(x1,x2)
plt.xlabel('Average Product Rating')
plt.ylabel('Average Product Price')
plt.title('Product Rating vs Product Price')
plt.grid(True)
plt.show()
