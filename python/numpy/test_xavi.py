import numpy as np
import time

size=4096

a=np.random.randn(size,size)
b=np.random.randn(size,size)
t1=time.time()
c=np.dot(a,b)
t2=time.time()

print "Elapsed time is",(t2-t1)
