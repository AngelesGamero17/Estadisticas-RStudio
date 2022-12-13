#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd


# In[3]:


df = pd.read_csv("D:/Tarea/historico_ventas/historico_ventas.csv", sep = ",", decimal = ".",thousands = None)


# In[4]:


df


# In[5]:


from sklearn.cluster import KMeans


# In[6]:


m = KMeans(n_clusters = 3)
m.fit(df.values)
p = m.predict(df.values)
p


# In[7]:


(pd.DataFrame(p))[0].value_counts()
m.cluster_centers_
df["cluster"] = p
df.groupby("cluster").mean()
import matplotlib.pyplot as plt
plt.scatter(df.values[:,0],df.values[:,1], c=p);


# In[ ]:




