#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


# In[2]:


inpPath = "C:/CarolineZiegler/Studium_DCU/8. Semester/Business Analytics Portfolio/Portfolio/03_Healthcare/"
hospital_Df = pd.read_csv(inpPath + "Hospital_General_Information.csv", delimiter =  ",", header = 0)
hospital_Df


# In[3]:


#understanding the dataset structure and input
hospital_Df.describe()


# In[4]:


hospital_Df.info()


# In[5]:


# Calculate the number of missing values per column
missing_values = hospital_Df.isnull().sum()
missing_values


# In[6]:


# Filter out columns with any missing values to understand the extent of missing data
missing_values_summary = missing_values[missing_values > 0]
missing_values_summary


# In[7]:


# Fill in missing values

fill_values = {
    'meets_criteria_for_promoting_interoperability_of_ehrs': 'Not Available',
    'meets_criteria_for_birthing_friendly_designation': 'Not Available',
    'hospital_overall_rating_footnote': 'Not Applicable',
    'mort_group_footnote': 'Not Applicable',
    'safety_group_footnote': 'Not Applicable',
    'readm_group_footnote': 'Not Applicable',
    'pt_exp_group_footnote': 'Not Applicable',
    'te_group_footnote': 'Not Applicable'
}

hospital_Df.fillna(fill_values, inplace=True)


# In[8]:


hospital_Df


# In[9]:


# Verify the filling operation by checking missing values again
missing_values_after_filling = hospital_Df.isnull().sum()
missing_values_summary_after_filling = missing_values_after_filling[missing_values_after_filling > 0]
missing_values_summary_after_filling


# In[10]:


# Standardize column names: lowercase with underscores instead of spaces or special characters
hospital_Df.columns = hospital_Df.columns.str.lower().str.replace(' ', '_').str.replace('/', '_').str.replace('%', 'percent')


# In[11]:


# Check the updated column names
updated_column_names = hospital_Df.columns.tolist()
updated_column_names


# In[12]:


# Check for duplicate rows based on all columns
duplicates_all_columns = hospital_Df.duplicated().sum()
duplicates_all_columns


# In[13]:


# Check for duplicate rows based on the 'facility_id' column, which should be unique
duplicates_facility_id = hospital_Df.duplicated(subset=['facility_id']).sum()

duplicates_all_columns, duplicates_facility_id


# In[14]:


# Dataset is now cleaned and prepared for the SQL project and needs to be exported
hospital_Df.to_csv("C:/CarolineZiegler/Studium_DCU/8. Semester/Business Analytics Portfolio/Portfolio/03_Healthcare/Hospital_SQL.csv", index = False)


# In[ ]:




