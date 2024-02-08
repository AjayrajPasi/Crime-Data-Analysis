import streamlit as st 
import pandas as pd 
import numpy as np 
import matplotlib.pyplot as plt 
import plotly.express as px 
st.title('IRIS FLOWER DASHBOARD')
st.divider()
with st.sidebar:
    st.subheader('Description')
    st.text(' The Iris dataset was used in R.A. Fishers classic 1936 paper.It includes three iris species with 50 samples each as well as some properties about each flower. One flower species is linearly separable from the other two, but the other two are not linearly separable from each other.')
data=pd.read_csv('C:/Users/User12/Desktop/deployment/my_env/data/iris.csv')
data
