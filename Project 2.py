#!/usr/bin/env python
# coding: utf-8

# # Project 2
# 
# This untidy dataset is a tuberculosis budget with different years provided by the World Health Organization.
# 
# I wanted to return the country with the most tax distribution in a given year.
# 

# In[1]:


import numpy as np
import pandas as pd
#set some pandas options controling output format
pd.set_option('display.notebook_repr_html',True) # output as flat text and not HTML
pd.set_option('display.max_rows', None) # this is the maximum number of rows we will display
pd.set_option('display.max_columns',None) # this is the maximum number of rows we will display


# In[2]:


# read the csv into a dataframe, and force budget_cpp_mdr to be interpreted as a string.
tb = pd.read_csv(r'c:/data/Untidy_TB_budget.csv', dtype={'budget_cpp_mdr': str})


# In[3]:


tb.head()


# In[4]:


# get rid of rows without year,'tx_dstb and budget_cpp_dstb 
tb.dropna(subset=['year','tx_dstb', 'budget_cpp_dstb'], how='all', inplace=True)


# In[5]:


# create a dataframe with the number of country by tx_dstb. Dropping NaN tx_dstb values.
tx_dstb = tb.dropna(subset=['tx_dstb'], how='any')                 [(tb.dropna(subset=['tx_dstb'], how='any') .country == 'Afghanistan')]                 .groupby('tx_dstb')                 .country.count()                 .reset_index(name='Afghanistan_count')                 .sort_values(['tx_dstb'], ascending=True)

# create a dataframe with the number of country by budget_cpp_dstb. Dropping NaNbudget_cpp_dstbb values.
budget_cpp_dstb = tb.dropna(subset=['tx_dstb'], how='any')                 [(tb.dropna(subset=['tx_dstb'], how='any').country == 'Albania')]                 .groupby('tx_dstb')                 .country.count()                 .reset_index(name='Albania_count')                 .sort_values(['tx_dstb'], ascending=True)


# In[6]:


# join the two series into one dataframe
tx_dstb = tx_dstb.join(budget_cpp_dstb.Albania_count)


# In[7]:


# return the contry with the most tax distribution in a given year
tx_dstb.sort_values('Albania_count', ascending=False).head(1)

