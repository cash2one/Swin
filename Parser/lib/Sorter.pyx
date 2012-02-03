#############################################
#    Date:       2012-01-19 
#    Project:    Sorter 
#    @Author:    Chunwei
#    Function:   统一快速排序方法 
#############################################

cdef class Sorter:

    '''
    排序主算法	
    '''

    cdef Hit *dali
    cdef long length
	
    cdef void init(self,Hit *data,long length):

        '''
        init 
        '''

        self.dali=data
        self.length=length


    cdef double gvalue(self,Hit data):

        '''
		返回需要进行比较的值
        '''
        return data.wordID


    def quicksort(self,long p,int q):
        '''
        主程序
        '''
        cdef:
            long j

        a=self.dali
        st=[]

        while True:
            while p<q:

                j=self.partition(p,q)

                if (j-p)<(q-j):
                    st.append(j+1)
                    st.append(q)
                    q=j-1

                else:
                    st.append(p)
                    st.append(j-1)
                    p=j+1

            if(len(st)==0):
                return

            q=st.pop()
            p=st.pop()


    cdef long partition(self,int low,int high):
        cdef Hit v
        v=self.dali[low]

        while low<high:

            while low<high and self.gvalue( self.dali[high] ) >= self.gvalue( v ):
                high-=1
            self.dali[low]=self.dali[high]

            while low<high and self.gvalue( self.dali[low] )<=self.gvalue( v ):
                low+=1
            self.dali[high]=self.dali[low]

        self.dali[low]=v

        return low


