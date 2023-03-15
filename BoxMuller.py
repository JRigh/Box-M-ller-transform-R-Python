#-------------------------------
# Box-Muller transform in Python
#-------------------------------

import numpy as np
import pandas as pd
import math 

# 1. generate uniform vectors
n = 10000
np.random.seed(2023)
u1 = np.random.uniform(low=0.0, high=1.0, size=n)
u2 = np.random.uniform(low=0.0, high=1.0, size=n)

# 2. define Box-Müller transform using vectorization
x1 = (np.sqrt(-2*np.log(u1))*np.cos(2*math.pi*u2))
x2 = (np.sqrt(-2*np.log(u1))*np.sin(2*math.pi*u2))
x = pd.DataFrame({'x1':x1, 'x2':x2})

# 3. print first lines of dataset 
data = x
data[0:6]
#          x1        x2
# 0 -0.860024  1.235653
# 1 -0.341486 -0.339862
# 2 -0.577473  0.853466
# 3  1.963577 -0.527138
# 4 -1.889265  0.586374
# 5  1.231823 -0.040409

# 4. plot the standard normal data

import seaborn as sns
sns.jointplot(data=data, x="x1", y="x2")


#----
# end
#----
