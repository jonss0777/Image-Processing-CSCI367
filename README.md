# Projects for Image Processing 

### Homework

**HW1**
Comparate for loop vs matrix pairwise eucledian distance implementation.

Algorithm:
<br>
 **DUMMY** 
 
  ```

  INPUT: X <- NxD
  M <- zeros(NXD) % matrix
  Iterate i: 1 to N
      Iterate j:1 to D
          rowVectorj from X % 1XN vector
          rowVectori from X % 1XN vector

          % scalar      |    scalar + scalar + scalar 
          M[i,j] <- dotProduct(rowVectorj, rowVectorj)  + dotProduct(rowVectori, rowVectori ) -2*dotProduct(rowVectorj, rowVectori))

  
  ```
<br>

**MATRIX**

   ```

  The matrix implementation uses the following fact M[i, j] = sqrt(norm(xi) + norm(xj) - 2dot(xi,xj))
  In other words we can square the elements in X and sum them along the rows. The result is a DX1 vector let's call it p 
  This gets the values for norm(xi) and norm(xj). We also need to calculate -2dot(xi,xj) for this I take the dot product
  of X,X' leaving me with a DXD matrix times -2 , let's call it k. By performing p + p' +  k, dimensions of p are DX1, p'
  1XD and k DxD, by using + p is implitly expanded to DXD same for p'. Then p + p' + k is really DxD + DxD + DxD.

  ```

<br>
<br>

Results:
<br>
<img alt="Runtime_of_eucledianDistDummy_vs_Matrix.png" src="https://github.com/jonss0777/Image-Processing-CSCI367/blob/98dabb90748b927b347fe22c70a2d12923ffe7aa/Runtime_of_EucledianDistDummy_vs_Matrix.png" width="600" height="550">
<br>

The figure shows how as the number of rows(vectors) increases the time it takes the dummy(for loop approach) to compute the eucledian distance increases after 400 rows the difference in execution time between the dummy and the matrix algorithm is cosiderably large, and this trend continues as the number of rows increases. 

By visualizing the run time and exploring the dummy and matrix algorithms it's clear the power vectorization has in speeding the the computation time on matrices. 

    


