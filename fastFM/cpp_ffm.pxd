# Author: Immanuel Bayer
# License: BSD 3 clause
#distutils: language=c++ 

from libcpp.string cimport string

cdef extern from "../../fastFM2/fastFM/fastfm.h" namespace "fastfm":

    cdef cppclass Settings:
        Settings() except +

    cdef cppclass Data:
        Data() except +
        void add_design_matrix(const int rows, int cols, int nnz,
                               int* outer_ptr, int* inter_ptr, double* data,
                               int split)

        void add_target(double* data, int rows, const int split)
        void add_prediction(double* data, int rows, const int split)

    cdef cppclass Model:
        Model() except +
        void add_parameter(double* data, int rows, int columns, int order)
        void add_parameter(double* data, int rows)
        void add_parameter(double* data)


    cdef void fit(const Settings& s, Model* m, Data* d )

    cdef void predict(Model* m, Data* d, const int split)