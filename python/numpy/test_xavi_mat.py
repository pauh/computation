import numpy as np
import time

size=4096

a = np.random.randn(size,size)
b = np.random.randn(size,size)
A = np.matrix(a)
B = np.matrix(b)
t1=time.time()
C = A*B
t2=time.time()

print "Elapsed time is",(t2-t1)
